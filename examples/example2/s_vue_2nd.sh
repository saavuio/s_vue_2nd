#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR

./dependencies/s_vue_2nd/scripts/docker_run.sh ${@:1}
