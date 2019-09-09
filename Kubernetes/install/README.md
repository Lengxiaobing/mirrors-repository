# kubeadm部署kubernetes单主集群

通过事先定义好的脚本安装kubernetes，注意修改相关配置。

![build](https://travis-ci.org/Mr-Linus/k8s-mirrors.svg?branch=master)

## 安装docker
- 执行相关脚本安装docker，使用阿里的镜像仓库

```shell
Kubernetes/install/install-docker/install-docker.sh
```

## 安装kubernetes主体
- 安装kubelet、 kubeadm、kubectl，并设置环境

```shell
Kubernetes/install/install-k8s/install-kubeadm.sh  
```

- 下载相关镜像

```shell
Kubernetes/install/install-k8s/k8s-images.sh  pull_images
```

- 设置镜像tag

```shell
Kubernetes/install/install-k8s/k8s-images.sh  reset_tags
```

##  安装pod网络附加组件

> 选择一种网络安装，常用的有calico和flannel。

- calico安装

```shell
Kubernetes/install/install-networks/install-calico.sh
```

- flannel安装

```shell
Kubernetes/install/install-networks/install-flannel.sh
```

## 初始化kubernetes
> 运行初始化脚本前，需要修改脚本内容，主要修改主节点IP参数，设为自己安装主机的IP

- 初始化脚本
```shell
Kubernetes/install/install-k8s/init-k8s-master.sh
```

- 如果安装失败，排查错误后，重置kubernetes在安装，重置命令如下
```shell
kubeadm reset
```

- 初始化成功，会看到如下内容，否则为失败。（内容需要记录下来）

```shell
Your Kubernetes master has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  /docs/concepts/cluster-administration/addons/

You can now join any number of machines by running the following on each node
as root:

  kubeadm join <master-ip>:<master-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
```

- 如果需要以普通用户执行k8s命令，需要以普通用户的身份运行

```shell
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

- 如果需要以root用户执行k8s命令，需要以root用户的身份运行

```shell
export KUBECONFIG=/etc/kubernetes/admin.conf
```

- 从节点加入命令格式如下（具体内容为上述打印出来的）

```shell
 kubeadm join <master-ip>:<master-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
```

## 其他配置

> 其他相关的一些配置，和集群安装方式，参见我的博客

- [kubeadm部署kubernetes单主集群](https://lengxiaobing.github.io/2019/01/02/kubeadm%E9%83%A8%E7%BD%B2kubernetes%E5%8D%95%E4%B8%BB%E9%9B%86%E7%BE%A4/)

- [kubeadm部署kubernetes高可用集群-VIP版](https://lengxiaobing.github.io/2019/06/04/kubeadm%E9%83%A8%E7%BD%B2kubernetes%E9%AB%98%E5%8F%AF%E7%94%A8%E9%9B%86%E7%BE%A4-VIP%E7%89%88/)

