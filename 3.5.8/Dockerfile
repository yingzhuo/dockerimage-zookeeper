FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/java:jre-8

LABEL maintainer="应卓 <yingzhor@gmail.com>"

USER root:root

ARG ZOOKEEPER_VERSION=3.5.8
ARG DOWNLOAD_LINK="https://archive.apache.org/dist/zookeeper/stable/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz"
ARG TGZ="/tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz"
ARG DATA_DIR=/data

ENV JMXDISABLE=true \
    ZOOKEEPER_HOME=/opt/zookeeper \
    ZOOKEEPER_MYID=1

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN \
    wget ${DOWNLOAD_LINK} -O ${TGZ} && \
    tar -zxf ${TGZ} -C /opt && \
    mv /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/ ${ZOOKEEPER_HOME} && \
    rm -rf ${TGZ} && \
    rm -rf ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg && \
    rm -rf ${ZOOKEEPER_HOME}/docs/ && \
    find ${ZOOKEEPER_HOME} -name "*.txt" -delete && \
    find ${ZOOKEEPER_HOME} -name "*.cmd" -delete && \
    find ${ZOOKEEPER_HOME} -name "*.md" -delete && \
    chmod +x /bin/docker-entrypoint.sh && \
    mkdir -p $DATA_DIR

COPY ./config/zoo.cfg.tmpl /opt/zoo.cfg.tmpl
COPY ./zkServer.sh ${ZOOKEEPER_HOME}/bin/zkServer.sh

EXPOSE 2181 2888 3888

VOLUME ${ZOOKEEPER_HOME}/data

ENTRYPOINT ["docker-entrypoint.sh"]