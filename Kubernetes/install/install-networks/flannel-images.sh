#!/bin/bash

# 拉取flannel镜像文件,并设置tag
# 版本信息
flannel_version=v0.11.0

# 路径
flannel_path=quay.io/coreos
docker_path=lengxiaobing

# 拉取flannel镜像文件
function pull_images(){
    echo "Pulling Images"
    sudo docker pull ${docker_path}/flannel-amd64:${flannel_version}-amd64
    sudo docker pull ${docker_path}/flannel-arm64:${flannel_version}-arm64
    sudo docker pull ${docker_path}/flannel-arm:${flannel_version}-arm
    sudo docker pull ${docker_path}/flannel-ppc64le:${flannel_version}-ppc64le
    sudo docker pull ${docker_path}/flannel-s390x:${flannel_version}-s390x
}

# 设置tag
function reset_tags(){
    echo "Reset Tags"
    sudo docker tag ${docker_path}/flannel-amd64:${flannel_version}-amd64		${flannel_path}/flannel:${flannel_version}-amd64
    sudo docker tag ${docker_path}/flannel-arm64:${flannel_version}-arm64		${flannel_path}/flannel:${flannel_version}-arm64
    sudo docker tag ${docker_path}/flannel-arm:${flannel_version}-arm			${flannel_path}/flannel:${flannel_version}-arm
    sudo docker tag ${docker_path}/flannel-ppc64le:${flannel_version}-ppc64le	${flannel_path}/flannel:${flannel_version}-ppc64le
    sudo docker tag ${docker_path}/flannel-s390x:${flannel_version}-s390x		${flannel_path}/flannel:${flannel_version}-s390x

    echo "Delete Tags"
    sudo docker rmi  ${docker_path}/flannel-amd64:${flannel_version}-amd64
    sudo docker rmi  ${docker_path}/flannel-arm64:${flannel_version}-arm64
    sudo docker rmi  ${docker_path}/flannel-arm:${flannel_version}-arm
    sudo docker rmi  ${docker_path}/flannel-ppc64le:${flannel_version}-ppc64le
    sudo docker rmi  ${docker_path}/flannel-s390x:${flannel_version}-s390x
}

#server
pull_images
reset_tags
