# yapi镜像

## 打包镜像
build.sh 为执行 Dockerfile 的脚本

## 安装
- 安装MongoDB

可以使用镜像安装，也可以直接安装。这里不在说明安装过程。

- 设置配置文件

```json
{
  "port": "3000",
  "adminAccount": "admin@admin.com",
  "timeout":120000,
  "db": {
    "servername": "mongo",
    "DATABASE": "yapi",        //MongoDB库名
    "port": 27017,             //MongoDB端口
    "user": "username",        //MongoDB用户名
    "pass": "password",        //MongoDB密码
    "authSource": "admin"
  },
  "mail": {
    "enable": true,
    "host": "smtp.163.com",    //邮箱服务器
    "port": 465,               //端口
    "from": "***@163.com",     //发送人邮箱
    "auth": {
      "user": "***@163.com",  //邮箱服务器账号
      "pass": "*****"         //邮箱服务器密码
    }
  }
}
```

- 初始化数据库

```shell script
docker run -it --rm \
  --entrypoint npm \
  --workdir /yapi/vendors \
  -v $PWD/config.json:/yapi/config.json \
  yapi-alpine:1.10.1 \
  run install-server
```

- 启动yapi

```shell script
docker run -d \
  --name yapi \
  --workdir /yapi/vendors \
  -p 3000:3000 \
  -v $PWD/config.json:/yapi/config.json \
  yapi-alpine:1.10.1 \
  server/app.js
```

## 使用

- 访问：http://ip:3000
- 用户名：admin@admin.com
- 密码：ymfe.org