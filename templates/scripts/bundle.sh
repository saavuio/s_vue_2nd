#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

NAME=ExampleBundleName

./s_vue_2nd.sh yarn run build --target lib --name $NAME src/$NAME.vue
