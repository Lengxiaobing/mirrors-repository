# 指定基础镜像，并且必须是第一条指令
FROM alpine:latest

# 指明该镜像的作者和其电子邮件
MAINTAINER zhuxiang "787681084@qq.com"

# 设置语言环境
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# 设置JAVA变量环境
ENV JAVA_HOME=/usr/local/java/jre1.8.0_291
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$PATH:$JAVA_HOME/bin

# 将安装包复制到镜像中
ADD jre-8u291-linux-x64.tar.gz /usr/local/java
# 下载地址：https://www.oracle.com/java/technologies/javase-jce8-downloads.html
ADD jce_policy-8.zip $JAVA_HOME/jre/lib/security

## glibc安装包 下载地址：https://github.com/sgerrand/alpine-pkg-glibc
COPY glibc-2.33-r0.apk  glibc-2.33-r0.apk
COPY glibc-bin-2.33-r0.apk  glibc-bin-2.33-r0.apk
COPY glibc-i18n-2.33-r0.apk  glibc-i18n-2.33-r0.apk

# 更换Alpine源为中科大
RUN echo http://mirrors.ustc.edu.cn/alpine/v3.10/main > /etc/apk/repositories \
    && echo http://mirrors.ustc.edu.cn/alpine/v3.10/community >> /etc/apk/repositories \
    && apk update && apk upgrade \
    # 设置时区、字符集
    && apk add tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# Alpine安装 Glibc
RUN apk --no-cache add ca-certificates wget \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && apk add glibc-2.33-r0.apk glibc-bin-2.33-r0.apk glibc-i18n-2.33-r0.apk \
    # 创建字符集
    && /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 $LANG \
    # 清理资源
    && rm -rf /var/cache/apk/* glibc-2.33-r0.apk glibc-bin-2.33-r0.apk glibc-i18n-2.33-r0.apk /tmp/*

CMD ["java","-version"]