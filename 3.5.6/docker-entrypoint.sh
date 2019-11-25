#!/bin/bash

set -e

mkdir -p /opt/zookeeper/data

bash /opt/zookeeper/bin/zkServer.sh start

docktool sleep