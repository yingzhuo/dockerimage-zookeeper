FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/java:jre-8

LABEL maintainer="应卓 <yingzhor@gmail.com>"

ENV JMXDISABLE=true \
    ZOOKEEPER_HOME=/opt/zookeeper \
    ZOOKEEPER_VERSION=3.5.7 \
    ZOOKEEPER_MYID=1

ARG DOWNLOAD_LINK="https://archive.apache.org/dist/zookeeper/stable/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz"
ARG TGZ="/opt/zookeeper-${ZOOKEEPER_VERSION}.tar.gz"

COPY ./docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN \
    wget "${DOWNLOAD_LINK}" -O /opt/zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
    tar -zxf ${TGZ} -C /opt && \
    mv /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/ ${ZOOKEEPER_HOME} && \
    rm -rf ${TGZ} && \
    rm -rf ${ZOOKEEPER_HOME}/conf/zoo_sample.cfg && \
    rm -rf ${ZOOKEEPER_HOME}/docs/ && \
    find ${ZOOKEEPER_HOME} -name "*.txt" -delete && \
    find ${ZOOKEEPER_HOME} -name "*.cmd" -delete && \
    find ${ZOOKEEPER_HOME} -name "*.md" -delete

COPY ./config/zoo.cfg.tmpl /opt/zoo.cfg.tmpl

EXPOSE 2181

VOLUME ${ZOOKEEPER_HOME}/data

CMD ["bash", "/bin/docker-entrypoint.sh"]