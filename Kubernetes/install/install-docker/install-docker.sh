#!/bin/bash

# 安装docker
# 添加阿里云镜像软件源
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 安装docker
sudo yum install docker-ce

# 设置docker开机启动，并立即启动
sudo systemctl start docker & systemctl enable docker
