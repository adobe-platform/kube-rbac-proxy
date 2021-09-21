module github.com/brancz/kube-rbac-proxy

go 1.13

require (
	github.com/ghodss/yaml v1.0.0
	github.com/google/go-cmp v0.5.4
	github.com/oklog/run v1.0.0
	github.com/spf13/pflag v1.0.5
	golang.org/x/crypto v0.0.0-20201216223049-8b5274cf687f // indirect
	golang.org/x/net v0.0.0-20201110031124-69a78807bb2b
	golang.org/x/text v0.3.7 // indirect
	gopkg.in/yaml.v2 v2.2.8
	k8s.io/api v0.19.15
	k8s.io/apimachinery v0.19.16-rc.0
	k8s.io/apiserver v0.19.15
	k8s.io/client-go v0.19.15
	k8s.io/component-base v0.19.15
	k8s.io/klog/v2 v2.3.0
)
