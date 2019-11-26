#!/bin/bash

set -e

mkdir -p /opt/zookeeper/data
echo -n "${ZOOKEEPER_MYID}" > /opt/zookeeper/data/myid

docktool --quiet filegen -t="/opt/zookeeper/conf/zoo.cfg.tmpl" --o="/opt/zookeeper/conf/zoo.cfg"

bash /opt/zookeeper/bin/zkServer.sh start

docktool sleep