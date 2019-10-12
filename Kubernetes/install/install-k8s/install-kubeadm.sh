#!/bin/bash

# 安装kubernetes
# 关闭防火墙
systemctl stop firewalld & systemctl disable firewalld

# 设置SELinux
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# 关闭Swap
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

#　设置iptables
cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
sysctl -p /etc/sysctl.d/k8s.conf

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
yum install -y kubelet-1.15.3 kubeadm-1.15.3 kubectl-1.15.3 --disableexcludes=kubernetes

# 设置kubelet开机启动，并立即启动
systemctl enable kubelet && systemctl start kubelet
