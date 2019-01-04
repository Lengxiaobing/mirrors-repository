#!/bin/bash

# 安装 k8s
# 添加阿里云镜像软件源
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

# 安装kubelet、 kubeadm、kubectl
yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

# 设置kubelet开机启动，并立即启动
systemctl enable kubelet && systemctl start kubelet
