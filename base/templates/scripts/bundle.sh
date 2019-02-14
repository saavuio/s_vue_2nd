#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

if [ -z $1 ]; then 
  CMD='build'
else
  CMD=$1
fi

./s_vue_2nd.sh yarn run $CMD
