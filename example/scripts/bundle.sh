#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

NAME=AppOrLibName

./s_vue_2nd.sh yarn run vcs build --target lib --name $NAME src/$NAME.vue
