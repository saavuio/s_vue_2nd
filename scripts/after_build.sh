#!/bin/bash
if [ -z $PROJECT_ROOT_PATH ]; then
  echo "PROJECT_ROOT_PATH not provided"
  exit 1
fi

# remove previous build if exists
rm -rf $PROJECT_ROOT_PATH/node_modules* .ejected

$PROJECT_ROOT_PATH/scripts/build.sh
