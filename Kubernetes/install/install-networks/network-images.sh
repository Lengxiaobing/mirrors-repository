#!/bin/bash


# 拉取网络设置镜像文件
calico_typha_version=v0.7.4
calico_node_version=v3.1.3
calico_cni_version=v3.1.3
flannel_version=v0.10.0-amd64
registry_name=registry.cn-hangzhou.aliyuncs.com/geekcloud
registry_host=registry.cn-hangzhou.aliyuncs.com

function pull_images(){
    echo "Pulling Images"
    sudo docker pull quay.io/calico/typha:${calico_typha_version}
    sudo docker pull quay.io/calico/node:${calico_node_version}
    sudo docker pull quay.io/calico/cni:${calico_cni_version}
    sudo docker pull quay.io/coreos/flannel:${flannel_version}
}

function set_tags(){
    echo "Setting Tags"
    sudo docker tag quay.io/calico/typha:${calico_typha_version}    ${registry_name}/typha:${calico_typha_version}
    sudo docker tag quay.io/calico/node:${calico_node_version}      ${registry_name}/calico-node:${calico_node_version}
    sudo docker tag quay.io/calico/cni:${calico_cni_version}        ${registry_name}/calico-cni:${calico_cni_version}
    sudo docker tag quay.io/coreos/flannel:${flannel_version}       ${registry_name}/flannel:${flannel_version}
}

function reset_tags(){
    echo "Reset Tags"
    sudo docker tag ${registry_name}/typha:${calico_typha_version}         quay.io/calico/typha:${calico_typha_version}
    sudo docker tag ${registry_name}/calico-node:${calico_node_version}    quay.io/calico/node:${calico_node_version}
    sudo docker tag ${registry_name}/calico-cni:${calico_cni_version}      quay.io/calico/cni:${calico_cni_version}
    sudo docker tag ${registry_name}/flannel:${flannel_version}            quay.io/coreos/flannel:${flannel_version}
}

function local_pull_images(){
    echo "Local Pulling Images"
    sudo docker pull ${registry_name}/typha:${calico_typha_version}
    sudo docker pull ${registry_name}/calico-node:${calico_node_version}
    sudo docker pull ${registry_name}/calico-cni:${calico_cni_version}
    sudo docker pull ${registry_name}/flannel:${flannel_version}
}

#server
pull_images
set_tags

#local

#local_pull_images
#reset_tags