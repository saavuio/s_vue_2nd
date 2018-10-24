#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR

NOCLONE=$1

function gitcheck {
  VERSION=$1
  which git
  [[ -z $(git status --porcelain) ]] && \
  git diff --quiet --exit-code && \
  git diff --quiet --cached --exit-code && \
  git diff --quiet --exit-code origin/$VERSION..$VERSION
}

function get {
  NAME=$1
  VERSION=$2
  if [ -z $NOCLONE ]; then
    if [ -d $NAME ]; then
      # check if there are changes
      cd $NAME && gitcheck $VERSION
      if [ $? != 0 ]; then echo "changes not pushed"; exit; fi;
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
  ./$NAME/scripts/docker_build.sh
  cp ./$NAME/templates/$NAME.sh ../
}

# -- s_vue_2nd
get "s_vue_2nd" "v1.0.0"
