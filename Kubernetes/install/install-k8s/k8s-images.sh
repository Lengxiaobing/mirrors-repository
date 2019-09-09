#!/bin/bash

# 拉取k8s镜像文件,并设置tag
# 版本信息
k8s_version=v1.15.3
pause_version=3.1
etcd_version=3.3.10
coredns_version=1.3.1

calico_version=v3.8.2
flannel_version=v0.11.0
dashboard_version=v2.0.0-beta4
metrics_scraper_version=v1.0.1

# 路径
k8s_path=k8s.gcr.io
dashboard_path=kubernetesui
calico_path=calico
flannel_path=quay.io/coreos
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

    sudo docker pull ${docker_path}/dashboard:${dashboard_version}
    sudo docker pull ${docker_path}/metrics-scraper:${metrics_scraper_version}

    sudo docker pull ${docker_path}/calico-cni:${calico_version}
    sudo docker pull ${docker_path}/calico-node:${calico_version}
    sudo docker pull ${docker_path}/calico-kube-controllers:${calico_version}
    sudo docker pull ${docker_path}/calico-pod2daemon-flexvol:${calico_version}

    sudo docker pull ${docker_path}/flannel-amd64:${flannel_version}-amd64
    sudo docker pull ${docker_path}/flannel-arm64:${flannel_version}-arm64
    sudo docker pull ${docker_path}/flannel-arm:${flannel_version}-arm
    sudo docker pull ${docker_path}/flannel-ppc64le:${flannel_version}-ppc64le
    sudo docker pull ${docker_path}/flannel-s390x:${flannel_version}-s390x
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

    sudo docker tag ${docker_path}/dashboard:${dashboard_version}               ${dashboard_path}/dashboard:${dashboard_version}
    sudo docker tag ${docker_path}/metrics-scraper:${metrics_scraper_version}   ${dashboard_path}/metrics-scraper:${metrics_scraper_version}

    sudo docker tag ${docker_path}/calico-cni:${calico_version}					${calico_path}/cni:${calico_version}
    sudo docker tag ${docker_path}/calico-node:${calico_version}				${calico_path}/node:${calico_version}
    sudo docker tag ${docker_path}/calico-kube-controllers:${calico_version}	${calico_path}/kube-controllers:${calico_version}
    sudo docker tag ${docker_path}/calico-pod2daemon-flexvol:${calico_version}	${calico_path}/pod2daemon-flexvol:${calico_version}

    sudo docker tag ${docker_path}/flannel-amd64:${flannel_version}-amd64		${flannel_path}/flannel:${flannel_version}-amd64
    sudo docker tag ${docker_path}/flannel-arm64:${flannel_version}-arm64		${flannel_path}/flannel:${flannel_version}-arm64
    sudo docker tag ${docker_path}/flannel-arm:${flannel_version}-arm			${flannel_path}/flannel:${flannel_version}-arm
    sudo docker tag ${docker_path}/flannel-ppc64le:${flannel_version}-ppc64le	${flannel_path}/flannel:${flannel_version}-ppc64le
    sudo docker tag ${docker_path}/flannel-s390x:${flannel_version}-s390x		${flannel_path}/flannel:${flannel_version}-s390x
}

#server
pull_images
reset_tags
