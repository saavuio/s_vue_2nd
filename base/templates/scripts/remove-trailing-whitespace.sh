#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..
cd src

find . -type f -print0 | xargs -0 perl -pi -e 's/ +$//'
