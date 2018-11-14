#!/bin/bash
RUN_DIR=$(pwd)
cd $RUN_DIR

IMAGE=saavu-local/s_vue_2nd_v4

RUN_DIR=$(pwd)

if [ ! -z $CONTAINER_NAME ]; then
  DOCKER_PARAM_NAME=--name=$CONTAINER_NAME
fi

if [ ! -z $PTO ]; then
  PORT_TO_OPEN=$PTO
fi

if [ ! -z $NET_NAME ]; then
 docker network create $NET_NAME 2> /dev/null
 DOCKER_PARAM_NET=--net=$NET_NAME
fi

if [ ! -f $RUN_DIR/package.json ]; then
  echo "No package.json found."
  exit 1
fi

# Create placeholders for folders that should exist so that
# permissions will be correct when they are mounted to the
# container.
mkdir -p $RUN_DIR/dist
mkdir -p $RUN_DIR/node_modules_app/saavu-cbin-placeholder

ARGS=${@:1}
TWO="$1 $2"
if [ "$TWO" = "yarn add" -o "$TWO" = "yarn install" ]; then
  # working with local packages (installing deps)
  WORKDIR="/ext";
  CMD="$ARGS"
else
  # working with packages already in the container
  WORKDIR="/s_vue_2nd";
  CMD="/entry.sh $ARGS"
fi

docker run \
  -u $UID:$(id -g $USER) \
  -e NODE_ENV=$NODE_ENV \
  $([ -z $RUN_IN_BG ] && echo '--rm' || echo '-d') \
  $([ ! -z $NO_TTY ] && echo '' || echo '-it') \
  $DOCKER_PARAM_NAME \
  $DOCKER_PARAM_NET \
  $([ ! -z $PORT_TO_OPEN ] && echo "-p $PORT_TO_OPEN:$PORT_TO_OPEN") \
  $([ -f $RUN_DIR/package.json ] && echo "--volume $RUN_DIR/package.json:/ext/package.json") \
  $([ -d $RUN_DIR/node_modules ] && echo "--volume $RUN_DIR/node_modules:/s_vue_2nd/node_modules") \
  $([ -d $RUN_DIR/node_modules_app ] && echo "--volume $RUN_DIR/node_modules_app:/ext/node_modules") \
  $([ -f $RUN_DIR/env-development ] && echo "--volume $RUN_DIR/env-development:/s_vue_2nd/env-development") \
  $([ -d $RUN_DIR/src ] && echo "--volume $RUN_DIR/src:/s_vue_2nd/src") \
  $([ -d $RUN_DIR/dist ] && echo "--volume $RUN_DIR/dist:/s_vue_2nd/dist") \
  $([ -f $RUN_DIR/vue.config.js ] && echo "--volume $RUN_DIR/vue.config.js:/s_vue_2nd/vue.config.js") \
  --workdir $WORKDIR \
  --entrypoint sh \
  $IMAGE \
  -c "$CMD"
