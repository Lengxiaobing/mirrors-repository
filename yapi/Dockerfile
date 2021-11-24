FROM node:12-alpine as builder
WORKDIR /yapi
RUN apk add --no-cache wget python3 make
ENV YAPI_VERSION=1.10.1
RUN wget https://github.com/YMFE/yapi/archive/v${YAPI_VERSION}.zip
RUN unzip v${YAPI_VERSION}.zip && mv yapi-${YAPI_VERSION} vendors
RUN cd /yapi/vendors && cp config_example.json ../config.json && rm -f package-lock.json && npm install --production --registry https://registry.npm.taobao.org

FROM node:12-alpine
MAINTAINER zhuxiang "787681084@qq.com"
ENV TZ="Asia/Shanghai"
WORKDIR /yapi/vendors
COPY --from=builder /yapi/vendors /yapi/vendors
EXPOSE 3000
ENTRYPOINT ["node"]
