FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/java:8-jre

MAINTAINER 应卓 yingzhor@gmail.com

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN \
    wget "https://archive.apache.org/dist/zookeeper/stable/apache-zookeeper-3.5.6-bin.tar.gz" -O /opt/zookeeper-3.5.6.tar.gz && \
    tar -zxf /opt/zookeeper-3.5.6.tar.gz -C /opt && \
    mv /opt/apache-zookeeper-3.5.6-bin/ /opt/zookeeper && \
    rm -rf /opt/zookeeper-3.5.6.tar.gz && \
    rm -rf /opt/zookeeper/conf/zoo_sample.cfg && \
    rm -rf /opt/zookeeper/docs/ && \
    find /opt/zookeeper -name "*.txt" -delete && \
    find /opt/zookeeper -name "*.cmd" -delete && \
    find /opt/zookeeper -name "*.md" -delete

COPY ./config/zoo.cfg /opt/zookeeper/conf/zoo.cfg

ENV \
    JMXDISABLE=true \
    ZOOKEEPER_HOME=/opt/zookeeper \
    ZOOKEEPER_VERSION=3.5.6

EXPOSE 2181

VOLUME /opt/zookeeper/data

CMD ["bash", "docker-entrypoint.sh"]