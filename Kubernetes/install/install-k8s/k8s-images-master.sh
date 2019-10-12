#!/bin/bash

# 拉取k8s镜像文件,并设置tag
# 版本信息
k8s_version=v1.15.3
pause_version=3.1
etcd_version=3.3.10
coredns_version=1.3.1

# 路径
k8s_path=k8s.gcr.io
docker_path=lengxiaobing

# 拉取k8s镜像文件
function pull_images(){
    echo "Pulling Images"
    sudo docker pull ${docker_path}/kube-apiserver:${k8s_version}
    sudo docker pull ${docker_path}/kube-controller-manager:${k8s_version}
    sudo docker pull ${docker_path}/kube-scheduler:${k8s_version}
    sudo docker pull ${docker_path}/kube-proxy:${k8s_version}
    sudo docker pull ${docker_path}/pause:${pause_version}
    sudo docker pull ${docker_path}/etcd:${etcd_version}
    sudo docker pull ${docker_path}/coredns:${coredns_version}
}

# 设置tag
function reset_tags(){
    echo "Reset Tags"
    sudo docker tag ${docker_path}/kube-apiserver:${k8s_version}			    ${k8s_path}/kube-apiserver:${k8s_version}
    sudo docker tag ${docker_path}/kube-controller-manager:${k8s_version}		${k8s_path}/kube-controller-manager:${k8s_version}
    sudo docker tag ${docker_path}/kube-scheduler:${k8s_version}				${k8s_path}/kube-scheduler:${k8s_version}
    sudo docker tag ${docker_path}/kube-proxy:${k8s_version}					${k8s_path}/kube-proxy:${k8s_version}
    sudo docker tag ${docker_path}/pause:${pause_version}					    ${k8s_path}/pause:${pause_version}
    sudo docker tag ${docker_path}/etcd:${etcd_version}					        ${k8s_path}/etcd:${etcd_version}
    sudo docker tag ${docker_path}/coredns:${coredns_version}					${k8s_path}/coredns:${coredns_version}
	
    echo "Delete Tags"
    sudo docker rmi  ${docker_path}/kube-apiserver:${k8s_version}
    sudo docker rmi  ${docker_path}/kube-controller-manager:${k8s_version}
    sudo docker rmi  ${docker_path}/kube-scheduler:${k8s_version}
    sudo docker rmi  ${docker_path}/kube-proxy:${k8s_version}
    sudo docker rmi  ${docker_path}/pause:${pause_version}
    sudo docker rmi  ${docker_path}/etcd:${etcd_version}
    sudo docker rmi  ${docker_path}/coredns:${coredns_version}
}

#server
pull_images
reset_tags
