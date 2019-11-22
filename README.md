# dockerimage-zookeeper

单节点`zookeeper`，请使用`docker-compose`启动之。

```yaml
version: "3.7"

services:
  zookeeper:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.4.14"
    container_name: "zookeeper"
    restart: "always"
    ports:
    - "2181:2181"
    volumes:
    - "${PWD}/data/zookeeper/:/var/zookeeper"
```
