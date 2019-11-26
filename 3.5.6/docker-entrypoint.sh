#!/bin/bash

set -e

mkdir -p /opt/zookeeper/data

cat -n "${ZOOKEEPER_MYID}" > /opt/zookeeper/data/myid

bash /opt/zookeeper/bin/zkServer.sh start

docktool sleep