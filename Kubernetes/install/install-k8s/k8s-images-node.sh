#!/bin/bash

# 拉取k8s从节点镜像文件,并设置tag
# 版本信息
k8s_version=v1.15.3
pause_version=3.1

dashboard_version=v2.0.0-beta4
metrics_scraper_version=v1.0.1

# 路径
k8s_path=k8s.gcr.io
dashboard_path=kubernetesui
docker_path=lengxiaobing

# 拉取k8s镜像文件
function pull_images(){
    echo "Pulling Images"
    sudo docker pull ${docker_path}/kube-proxy:${k8s_version}
    sudo docker pull ${docker_path}/pause:${pause_version}

    sudo docker pull ${docker_path}/dashboard:${dashboard_version}
    sudo docker pull ${docker_path}/metrics-scraper:${metrics_scraper_version}
}

# 设置tag
function reset_tags(){
    echo "Reset Tags"
    sudo docker tag ${docker_path}/kube-proxy:${k8s_version}					${k8s_path}/kube-proxy:${k8s_version}
    sudo docker tag ${docker_path}/pause:${pause_version}					    ${k8s_path}/pause:${pause_version}

    sudo docker tag ${docker_path}/dashboard:${dashboard_version}               ${dashboard_path}/dashboard:${dashboard_version}
    sudo docker tag ${docker_path}/metrics-scraper:${metrics_scraper_version}   ${dashboard_path}/metrics-scraper:${metrics_scraper_version}

    echo "Delete Tags"
    sudo docker rmi  ${docker_path}/kube-proxy:${k8s_version}
    sudo docker rmi  ${docker_path}/pause:${pause_version}

    sudo docker rmi  ${docker_path}/dashboard:${dashboard_version}
    sudo docker rmi  ${docker_path}/metrics-scraper:${metrics_scraper_version}
}

#server
pull_images
reset_tags
