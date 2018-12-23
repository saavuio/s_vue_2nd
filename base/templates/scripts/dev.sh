#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

. ./env-development

CONTAINER_NAME_PREFIX=example-app-ui

# run
CONTAINER_NAME=$CONTAINER_NAME_PREFIX-app \
  PORT_TO_OPEN=$DEV_PORT \
  NODE_ENV=development ./s_vue_2nd.sh yarn run serve --port $DEV_PORT
