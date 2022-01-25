# yapi镜像

## 打包镜像
build.sh 为执行 Dockerfile 的脚本

## 安装
### 安装MongoDB

1. 拉取镜像

```shell
docker pull mongo
# 运行容器
docker run --name mongodb -p 27017:27017 -v $PWD/db:/data/db -d mongo:latest
```

2. 以 admin 用户身份进入mongo

```shell
docker exec -it  mongodb  mongo admin
```

3. 创建一个 admin 管理员账号 ：

```shell
db.createUser({ user: 'admin', pwd: '123456', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
```

4. 对 admin 用户 进行身份认证

```shell
db.auth("admin","123456");
``````

5. 创建 用户、密码和数据库

```shell
db.createUser({ user: 'yapi', pwd: '123456', roles: [ { role: "dbAdmin", db: "yapi" } ] });
```

6. 对 yapi 进行身份认证

```shell
db.auth("yapi","123456");
```

7. 切换数据库

```shell
use yapi
```

8. 添加数据
向表test中添加数据

```shell
db.test.save({name:"zhangsan"});
```

9. 查询数据

```shell
db.test.find();
```

10. mongo 角色说明

角色分类：  
- 数据库用户角色：read、readWrite；
- 数据库管理角色：dbAdmin、dbOwner、userAdmin;
- 集群管理角色：clusterAdmin、clusterManager、4. clusterMonitor、hostManage；
- 备份恢复角色：backup、restore；
- 所有数据库角色：readAnyDatabase、readWriteAnyDatabase、userAdminAnyDatabase、dbAdminAnyDatabase
- 超级用户角色：root
- 内部角色：system

角色说明：
- Read：允许用户读取指定数据库
- readWrite：允许用户读写指定数据库
- dbAdmin：允许用户在指定数据库中执行管理函数，如索引创建、删除，查看统计或访问system.profile
- userAdmin：允许用户向system.users集合写入，可以在指定数据库里创建、删除和管理用户
- clusterAdmin：只在admin数据库中可用，赋予用户所有分片和复制集相关函数的管理权限。
- readAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读权限
- readWriteAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的读写权限
- userAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的userAdmin权限
- dbAdminAnyDatabase：只在admin数据库中可用，赋予用户所有数据库的dbAdmin权限。
- root：只在admin数据库中可用。超级账号，超级权限

### 安装yapi

```json
{
  "port": "3000",
  "adminAccount": "admin@admin.com",
  "timeout":120000,
  "db": {
    "servername": "127.0.0.1",  //MongoDB地址
    "DATABASE": "yapi",         //MongoDB库名
    "port": 27017,              //MongoDB端口
    "user": "yapi",             //MongoDB用户名
    "pass": "123456",           //MongoDB密码
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
