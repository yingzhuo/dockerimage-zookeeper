FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/java:8-jre

MAINTAINER 应卓 yingzhor@gmail.com

ARG VERSION=3.5.6
ARG DOWNLOAD_URL=https://archive.apache.org/dist/zookeeper/stable/apache-zookeeper-${VERSION}-bin.tar.gz

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN \
    wget "${DOWNLOAD_URL}" -O /opt/zookeeper-${VERSION}.tar.gz && \
    tar -zxf /opt/zookeeper-${VERSION}.tar.gz -C /opt && \
    mv /opt/apache-zookeeper-${VERSION}-bin/ /opt/zookeeper && \
    mkdir -p /opt/zookeeper/data && \
    rm -rf /opt/zookeeper-${VERSION}.tar.gz && \
    chmod +x /bin/docker-entrypoint.sh && \
    rm -rf /opt/zookeeper/conf/zoo_sample.cfg && \
    rm -rf /opt/zookeeper/docs/ && \
    find /opt/zookeeper -name "*.txt" -delete && \
    find /opt/zookeeper -name "*.cmd" -delete && \
    find /opt/zookeeper -name "*.md" -delete

COPY ./config/zoo.cfg /opt/zookeeper/conf/zoo.cfg

ENV \
    ZOOKEEPER_HOME=/opt/zookeeper \
    ZOOKEEPER_VERSION=${VERSION}

EXPOSE 2181

VOLUME /opt/zookeeper/data

CMD ["docker-entrypoint.sh"]