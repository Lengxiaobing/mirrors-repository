#!/bin/bash

# 初始化 k8s
# --kubernetes-version 指定k8s版本
# --pod-network-cidr 表示集群将使用`Calico`网络，这里需要提前指定`Calico`的子网范围
# --apiserver-advertise-address 是主节点ip
kubeadm init --kubernetes-version=v1.11.0  --pod-network-cidr=10.16.0.0/16 --apiserver-advertise-address=192.168.0.0

# 构建 k8s 配置文件夹并拷贝到管理员默认配置文件
mkdir -p ${HOME}/.kube
sudo cp -i /etc/kubernetes/admin.conf ${HOME}/.kube/config
sudo chown $(id -u):$(id -g) ${HOME}/.kube/config
