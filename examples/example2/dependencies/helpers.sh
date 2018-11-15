#!/bin/bash
function get {
  NAME=$1
  VERSION=$2
  if [ -z $NOCLONE ]; then
    if [ -d $NAME ]; then
      cd $SCRIPT_DIR
      # confirm removal
      read -p "$NAME will be forcefully removed. Are you sure? " -n 1 -r; echo
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf $NAME
      else
        exit 1
      fi
    fi
    git clone --single-branch -b $VERSION https://github.com/saavuio/$NAME
  fi
  PROJECT_ROOT_PATH=.. ./$NAME/scripts/after_get.sh
  ./$NAME/scripts/docker_build.sh
}

