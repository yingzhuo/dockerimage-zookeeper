# dockerimage-zookeeper

**警告**: ⚠️ 本项目并没有经过严格测试，不可用于生产环境。

### 单节点

```yaml
version: "3.9"

services:
  zookeeper:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.7"
    container_name: "zookeeper"
    restart: "always"
    ports:
    - "2181:2181"
    volumes:
    - "${PWD}/data/:/opt/zookeeper/data/"
```

### 集群

```yaml
version: "3.9"

services:
  zookeeper1:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.7"
    container_name: "zookeeper1"
    restart: "always"
    hostname: "zookeeper1"
    networks:
    - "zookeeper-cluster-network"
    ports:
    - "2181:2181"
    volumes:
    - "${PWD}/data/zookeeper1/:/opt/zookeeper/data/"
    environment:
    - "ZOOKEEPER_MYID=1"
    - "ZOOKEEPER_SERVERS=server.1=zookeeper1:2888:3888,server.2=zookeeper2:2888:3888,server.3=zookeeper3:2888:3888"

  zookeeper2:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.7"
    container_name: "zookeeper2"
    restart: "always"
    hostname: "zookeeper2"
    networks:
    - "zookeeper-cluster-network"
    ports:
    - "2182:2181"
    volumes:
    - "${PWD}/data/zookeeper2/:/opt/zookeeper/data/"
    environment:
    - "ZOOKEEPER_MYID=2"
    - "ZOOKEEPER_SERVERS=server.1=zookeeper1:2888:3888,server.2=zookeeper2:2888:3888,server.3=zookeeper3:2888:3888"

  zookeeper3:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/zookeeper:3.5.7"
    container_name: "zookeeper3"
    restart: "always"
    hostname: "zookeeper3"
    networks:
    - "zookeeper-cluster-network"
    ports:
    - "2183:2181"
    volumes:
    - "${PWD}/data/zookeeper3/:/opt/zookeeper/data/"
    environment:
    - "ZOOKEEPER_MYID=3"
    - "ZOOKEEPER_SERVERS=server.1=zookeeper1:2888:3888,server.2=zookeeper2:2888:3888,server.3=zookeeper3:2888:3888"

networks:
  zookeeper-cluster-network:
    driver: bridge
```
