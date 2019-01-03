## K8S-Mirrors

通过拉取官方k8s镜像形成私有镜像仓库

![build](https://travis-ci.org/Mr-Linus/k8s-mirrors.svg?branch=master)

### 原理

利用境外服务器协助我们拉取gcr.io的镜像,打上tag,实现容器镜像的境内mirrors

#### 目前同步的k8s版本:V1.13.0