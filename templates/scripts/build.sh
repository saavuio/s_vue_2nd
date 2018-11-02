#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

./dependencies/init.sh
./s_vue_2nd.sh yarn install
./scripts/eject.sh
