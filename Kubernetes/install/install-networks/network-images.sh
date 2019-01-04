#!/bin/bash


# 拉取网络设置镜像文件
# 版本信息
coreos_etcd_version=v3.3.10
calico_node_version=release-v3.4
calico_cni_version=release-v3.2
kube_controllers_version=release-v3.3
kube_policy_controller_version=v1.0.0-rc4
# 路径
registry_path=quay.io
docker_path=lengxiaobing

function pull_images(){
    echo "Pulling Images"
    sudo docker pull lengxiaobing/coreos.etcd:${coreos_etcd_version}
    sudo docker pull lengxiaobing/calico.node:${calico_node_version}
    sudo docker pull lengxiaobing/calico.cni:${calico_cni_version}
    sudo docker pull lengxiaobing/calico.kube-controllers:${kube_controllers_version}
    sudo docker pull lengxiaobing/calico.kube-policy-controller:${kube_policy_controller_version}
}

function reset_tags(){
    echo "Reset Tags"
    sudo docker tag ${docker_path}/coreos.etcd:${coreos_etcd_version}                                ${registry_path}/coreos/etcd:${coreos_etcd_version}
    sudo docker tag ${docker_path}/calico.node:${calico_node_version}                                ${registry_path}/calico/node:${calico_node_version}
    sudo docker tag ${docker_path}/calico.cni:${calico_cni_version}                                  ${registry_path}/calico/cni:${calico_cni_version}
    sudo docker tag ${docker_path}/calico.kube-controllers:${kube_controllers_version}               ${registry_path}/calico/kube-controllers:${kube_controllers_version}
    sudo docker tag ${docker_path}/calico.kube-policy-controller:${kube_policy_controller_version}   ${registry_path}/calico/kube-policy-controller:${kube_policy_controller_version}
}


#server
pull_images
reset_tags
