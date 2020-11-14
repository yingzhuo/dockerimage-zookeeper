#!/bin/bash -e

echo -n "${ZOOKEEPER_MYID}" > /data/myid

docktool filegen -t="/opt/zoo.cfg.tmpl" -o="${ZOOKEEPER_HOME}/conf/zoo.cfg"

chmod +x "${ZOOKEEPER_HOME}/bin/zkServer.sh" && bash "${ZOOKEEPER_HOME}/bin/zkServer.sh" start

docktool -q sleep
