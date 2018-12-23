#!/bin/bash
RUN_DIR=$(pwd)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
MONOREPO_ROOT=$(cd $RUN_DIR && cd .. && pwd)

cd $(realpath $SCRIPT_DIR)

if [ ! -z $DOCKER_NAME ]; then NAME=--name=$DOCKER_NAME; fi

docker run \
  --rm -it \
  -u $UID:$(id -g $USER) \
  $([ ! -z $PORT_TO_OPEN ] && echo "-p $PORT_TO_OPEN:$PORT_TO_OPEN") \
  $NET \
  $NAME \
  -e NODE_ENV=$NODE_ENV \
  --volume $RUN_DIR:/app \
  --workdir /app \
  --entrypoint yarn \
  node:8.11.3 ${@:1}
