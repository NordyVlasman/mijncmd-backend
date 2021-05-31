#!/bin/sh

BASE_DIR=$(cd "$(dirname "$0")"; pwd)/dev_docker

cd $BASE_DIR

docker compose -f mijncmd.yml -f postgres.yml up
