FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/java:8-jre

MAINTAINER 应卓 yingzhor@gmail.com

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN \
    wget "https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz" -O /opt/zookeeper-3.4.14.tar.gz && \
    tar -zxf /opt/zookeeper-3.4.14.tar.gz -C /opt && \
    ln -sf /opt/zookeeper-3.4.14/ /opt/zookeeper && \
    rm -rf /opt/zookeeper-3.4.14.tar.gz && \
    mkdir -p /var/zookeeper && \
    chmod +x /bin/docker-entrypoint.sh

COPY ./config/zoo.cfg /opt/zookeeper/conf/zoo.cfg

ENV \
    ZOOKEEPER_HOME=/opt/zookeeper \
    ZOOKEEPER_VERSION=3.4.14

EXPOSE 2181

VOLUME /var/zookeeper

CMD ["docker-entrypoint.sh"]
