#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

NET_NAME=saavunet ./s_vue_2nd.sh yarn run test ${@:1}
