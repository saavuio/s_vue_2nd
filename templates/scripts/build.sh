#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

./s_vue_2nd.sh yarn install
./scripts/eject.sh
