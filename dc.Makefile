.PHONY: build.docker

BINARY        ?= kube-rbac-proxy
VERSION       ?= $(shell git describe --tags --always --dirty)
IMAGE         ?= quay.io/brancz/kube-rbac-proxy
TAG           ?= $(VERSION)
DOCKERFILE    ?= dc.Dockerfile

default: build.docker

build.docker:
	docker build --rm -t "$(IMAGE):$(TAG)" -f $(DOCKERFILE) --build-arg VERSION=$(VERSION) .
