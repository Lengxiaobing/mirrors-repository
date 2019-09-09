#!/bin/bash

# 初始化 k8s
# --kubernetes-version 指定k8s版本
# --pod-network-cidr 表示集群将使用的子网范围
# --apiserver-advertise-address 是主节点ip
kubeadm init --kubernetes-version=v1.15.3  --pod-network-cidr=10.16.0.0/16 --apiserver-advertise-address=192.168.0.0