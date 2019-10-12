#!/bin/bash

# 拉取calico镜像文件,并设置tag
# 版本信息
calico_version=v3.8.2

# 路径
calico_path=calico
docker_path=lengxiaobing

# 拉取calico镜像文件
function pull_images(){
    echo "Pulling Images"
    sudo docker pull ${docker_path}/calico-cni:${calico_version}
    sudo docker pull ${docker_path}/calico-node:${calico_version}
    sudo docker pull ${docker_path}/calico-kube-controllers:${calico_version}
    sudo docker pull ${docker_path}/calico-pod2daemon-flexvol:${calico_version}
}

# 设置tag
function reset_tags(){
    echo "Reset Tags"
    sudo docker tag ${docker_path}/calico-cni:${calico_version}					${calico_path}/cni:${calico_version}
    sudo docker tag ${docker_path}/calico-node:${calico_version}				${calico_path}/node:${calico_version}
    sudo docker tag ${docker_path}/calico-kube-controllers:${calico_version}	${calico_path}/kube-controllers:${calico_version}
    sudo docker tag ${docker_path}/calico-pod2daemon-flexvol:${calico_version}	${calico_path}/pod2daemon-flexvol:${calico_version}
	
    echo "Delete Tags"
    sudo docker rmi  ${docker_path}/calico-cni:${calico_version}
    sudo docker rmi  ${docker_path}/calico-node:${calico_version}
    sudo docker rmi  ${docker_path}/calico-kube-controllers:${calico_version}
    sudo docker rmi  ${docker_path}/calico-pod2daemon-flexvol:${calico_version}
}

#server
pull_images
reset_tags
