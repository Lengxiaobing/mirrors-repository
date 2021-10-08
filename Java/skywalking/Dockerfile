FROM busybox:latest

MAINTAINER zhuxiang "787681084@qq.com"

ENV LANG=C.UTF-8

RUN set -eux && mkdir -p /usr/skywalking/agent/

ADD apache-skywalking-apm-bin-es7/agent/ /usr/skywalking/agent/

WORKDIR /
