ARG GO_VERSION=1.17

FROM docker-hub-remote.dr.corp.adobe.com/golang:${GO_VERSION}-alpine AS builder

ARG VERSION

ENV GOFLAGS="-mod=readonly"

RUN mkdir -p /build && mkdir -p /_output
WORKDIR /build

COPY go.* /build/
RUN go mod download

COPY . /build
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -v --installsuffix cgo -o output/linux/kube-rbac-proxy -ldflags "-X main.version=$VERSION -w -s" .

# -----

FROM gcr.io/distroless/static:nonroot

COPY --from=builder /build/output/linux/kube-rbac-proxy /usr/local/bin/kube-rbac-proxy
EXPOSE 8080
USER 65532:65532

ENTRYPOINT ["/usr/local/bin/kube-rbac-proxy"]
