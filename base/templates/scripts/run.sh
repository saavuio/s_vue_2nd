#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

. ./env-development

# bundle
./s_vue_2nd.sh yarn run build --mode development

# run
CONTAINER_NAME=$IDENTIFIER-app \
  NET_NAME=saavunet \
  PORT_TO_OPEN=$DEV_PORT \
  NODE_ENV=development ./s_vue_2nd.sh yarn run start -n -l $DEV_PORT
