# dockerimage-zookeeper

单节点`zookeeper`，请使用`docker-compose`启动之。

```yaml
version: "3.7"

services:
  kafka:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/kafka:2.3.1"
    container_name: "kafka"
    restart: "always"
    ports:
    - "2181:2181"
    volumes:
    - "${PWD}/data/zookeeper/:/var/zookeeper"
```
