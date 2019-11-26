# dockerimage-zookeeper

### 单节点

```yaml
version: "3.7"

services:
  zookeeper:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.6"
    container_name: "zookeeper"
    restart: "always"
    ports:
    - "2181:2181"
    volumes:
    - "${PWD}/data/:/opt/zookeeper/data/"
```

### 集群

```yaml
```