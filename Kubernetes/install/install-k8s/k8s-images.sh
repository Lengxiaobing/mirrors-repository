#!/bin/bash


# 拉取k8s镜像文件
k8s_version=v1.11.0
pause_version=3.1
etcd_version=3.2.18
coredns_version=1.1.3
dashborad_version=v1.8.3
registry_name=registry.cn-hangzhou.aliyuncs.com/geekcloud
registry_host=registry.cn-hangzhou.aliyuncs.com

function pull_images(){
    echo "Pulling Images"
    sudo docker pull k8s.gcr.io/kube-apiserver-amd64:${k8s_version}
    sudo docker pull k8s.gcr.io/kube-controller-manager-amd64:${k8s_version}
    sudo docker pull k8s.gcr.io/kube-scheduler-amd64:${k8s_version}
    sudo docker pull k8s.gcr.io/kube-proxy-amd64:${k8s_version}
    sudo docker pull k8s.gcr.io/pause:${pause_version}
    sudo docker pull k8s.gcr.io/etcd-amd64:${etcd_version}
    sudo docker pull k8s.gcr.io/coredns:${coredns_version}
    sudo docker pull k8s.gcr.io/kubernetes-dashboard-amd64:${dashborad_version}
}

function set_tags(){
    echo "Setting Tags"
    sudo docker tag k8s.gcr.io/kube-apiserver-amd64:${k8s_version}             ${registry_name}/kube-apiserver-amd64:${k8s_version}
    sudo docker tag k8s.gcr.io/kube-controller-manager-amd64:${k8s_version}    ${registry_name}/kube-controller-manager-amd64:${k8s_version}
    sudo docker tag k8s.gcr.io/kube-scheduler-amd64:${k8s_version}             ${registry_name}/kube-scheduler-amd64:${k8s_version}
    sudo docker tag k8s.gcr.io/kube-proxy-amd64:${k8s_version}                 ${registry_name/kube-proxy-amd64:${k8s_version}
    sudo docker tag k8s.gcr.io/pause:${pause_version}                          ${registry_name}/pause:${pause_version}
    sudo docker tag k8s.gcr.io/etcd-amd64:${etcd_version}                      ${registry_name}/etcd-amd64:${etcd_version}
    sudo docker tag k8s.gcr.io/coredns:${coredns_version}                      ${registry_name}/coredns:${coredns_version}
    sudo docker tag k8s.gcr.io/kubernetes-dashboard-amd64:${dashborad_version} ${registry_name}/k8s-dashboard:${dashborad_version}
}

function reset_tags(){
    echo "Reset Tags"
    sudo docker tag ${registry_name}/kube-apiserver-amd64:${k8s_version}             k8s.gcr.io/kube-apiserver-amd64:${k8s_version}
    sudo docker tag ${registry_name}/kube-controller-manager-amd64:${k8s_version}    k8s.gcr.io/kube-controller-manager-amd64:${k8s_version}
    sudo docker tag ${registry_name}/kube-scheduler-amd64:${k8s_version}             k8s.gcr.io/kube-scheduler-amd64:${k8s_version}
    sudo docker tag ${registry_name}/kube-proxy-amd64:${k8s_version}                 k8s.gcr.io/kube-proxy-amd64:${k8s_version}
    sudo docker tag ${registry_name}/pause:${pause_version}                          k8s.gcr.io/pause:${pause_version}
    sudo docker tag ${registry_name}/etcd-amd64:${etcd_version}                      k8s.gcr.io/etcd-amd64:${etcd_version}
    sudo docker tag ${registry_name}/coredns:${coredns_version}                      k8s.gcr.io/coredns:${coredns_version}
    sudo docker tag ${registry_name}/k8s-dashboard:${dashborad_version}              k8s.gcr.io/kubernetes-dashboard-amd64:${dashborad_version}
}

function local_pull_images(){
    echo "Local Pulling Images"
    sudo docker pull ${registry_name}/kube-apiserver-amd64:${k8s_version}
    sudo docker pull ${registry_name}/kube-controller-manager-amd64:${k8s_version}
    sudo docker pull ${registry_name}/kube-scheduler-amd64:${k8s_version}
    sudo docker pull ${registry_name}/kube-proxy-amd64:${k8s_version}
    sudo docker pull ${registry_name}/pause:${pause_version}
    sudo docker pull ${registry_name}/etcd-amd64:${etcd_version}
    sudo docker pull ${registry_name}/coredns:${coredns_version}
    sudo docker pull ${registry_name}/k8s-dashboard:${dashborad_version}
}

#server

pull_images
set_tags

#local

#local_pull_images
#reset_tags