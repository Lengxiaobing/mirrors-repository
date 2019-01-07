#!/bin/bash


# 拉取k8s镜像文件
# 版本信息
k8s_version=v1.13.1
k8s_dns_version=1.15.0
pause_version=3.1
etcd_version=3.3.10
coredns_version=1.2.6
dashborad_version=v1.10.1
dashborad_ini_version=v1.0.1

# 路径
registry_path=k8s.gcr.io
docker_path=lengxiaobing

function pull_images(){
    echo "Pulling Images"
    sudo docker pull ${docker_path}/kube-proxy-amd64:${k8s_version}
    sudo docker pull ${docker_path}/kube-scheduler-amd64:${k8s_version}
    sudo docker pull ${docker_path}/kube-controller-manager-amd64:${k8s_version}
    sudo docker pull ${docker_path}/kube-apiserver-amd64:${k8s_version}
    sudo docker pull ${docker_path}/etcd-amd64:${etcd_version}
    sudo docker pull ${docker_path}/k8s-dns-dnsmasq-nanny-amd64:${k8s_dns_version}
    sudo docker pull ${docker_path}/k8s-dns-sidecar-amd64:${k8s_dns_version}
    sudo docker pull ${docker_path}/k8s-dns-kube-dns-amd64:${k8s_dns_version}
    sudo docker pull ${docker_path}/pause-amd64:${pause_version}
    sudo docker pull ${docker_path}/etcd:${etcd_version}
    sudo docker pull ${docker_path}/coredns:${coredns_version}
    sudo docker pull ${docker_path}/kubernetes-dashboard-amd64:${dashborad_version}
    sudo docker pull ${docker_path}/kubernetes-dashboard-init-amd64:${dashborad_ini_version}
}


function reset_tags(){
    echo "Reset Tags"
    sudo docker tag ${docker_path}/kube-proxy-amd64:${k8s_version}                    ${registry_path}/kube-proxy:${k8s_version}
    sudo docker tag ${docker_path}/kube-scheduler-amd64:${k8s_version}                ${registry_path}/kube-scheduler:${k8s_version}
    sudo docker tag ${docker_path}/kube-controller-manager-amd64:${k8s_version}       ${registry_path}/kube-controller-manager:${k8s_version}
    sudo docker tag ${docker_path}/kube-apiserver-amd64:${k8s_version}                ${registry_path}/kube-apiserver:${k8s_version}
    sudo docker tag ${docker_path}/etcd-amd64:${etcd_version}                         ${registry_path}/etcd-amd64:${etcd_version}
    sudo docker tag ${docker_path}/k8s-dns-dnsmasq-nanny-amd64:${k8s_dns_version}     ${registry_path}/k8s-dns-dnsmasq-nanny-amd64:${k8s_dns_version}
    sudo docker tag ${docker_path}/k8s-dns-sidecar-amd64:${k8s_dns_version}           ${registry_path}/k8s-dns-sidecar-amd64:${k8s_dns_version}
    sudo docker tag ${docker_path}/k8s-dns-kube-dns-amd64:${k8s_dns_version}          ${registry_path}/k8s-dns-kube-dns-amd64:${k8s_dns_version}
    sudo docker tag ${docker_path}/pause-amd64:${pause_version}                       ${registry_path}/pause:${pause_version}
    sudo docker tag ${docker_path}/etcd:${etcd_version}                               ${registry_path}/etcd:${etcd_version}
    sudo docker tag ${docker_path}/coredns:${coredns_version}                         ${registry_path}/coredns:${coredns_version}
    sudo docker tag ${docker_path}/kubernetes-dashboard-amd64:${dashborad_version}    ${registry_path}/kubernetes-dashboard-amd64:${dashborad_version}
    sudo docker tag ${docker_path}/kubernetes-dashboard-init-amd64:${dashborad_ini_version}    ${registry_path}/kubernetes-dashboard-init-amd64:${dashborad_ini_version}
}

#server
pull_images
reset_tags
