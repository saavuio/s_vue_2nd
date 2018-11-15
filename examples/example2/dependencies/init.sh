#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR

. ./helpers.sh

# -- s_vue_2nd
get "s_vue_2nd" "v4"
