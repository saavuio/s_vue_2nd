#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

. ./env-development

# bundle
if [ ! -d dist/builds ]; then
  echo "No build found. Building..."
  ./s_vue_2nd.sh yarn run build --mode development
fi

# run
CONTAINER_NAME=$IDENTIFIER-cnt \
  NET_NAME=saavunet \
  PORT_TO_OPEN=$DEV_PORT \
  NODE_ENV=development ./s_vue_2nd.sh yarn run start -n -l $DEV_PORT
