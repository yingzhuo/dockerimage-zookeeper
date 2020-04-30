#!/bin/bash

set -e

mkdir -p "${ZOOKEEPER_HOME}/data"
echo -n "${ZOOKEEPER_MYID}" > "${ZOOKEEPER_HOME}/data/myid"
docktool filegen -t="/opt/zoo.cfg.tmpl" -o="${ZOOKEEPER_HOME}/conf/zoo.cfg"
bash "${ZOOKEEPER_HOME}/bin/zkServer.sh" start
docktool --quiet sleep