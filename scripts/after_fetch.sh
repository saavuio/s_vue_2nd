#!/bin/bash
if [ -z $PROJECT_ROOT_PATH ]; then
  echo "PROJECT_ROOT_PATH not provided"
  exit 1
fi

VERSION=v6
rm -rf s_vue_2nd_cache
git clone --single-branch -b $VERSION https://github.com/saavuio/s_vue_2nd_cache
cp s_vue_2nd_cache/node_modules.tar.bz2 s_vue_2nd/base

# folders required
mkdir ${PROJECT_ROOT_PATH}/src 2> /dev/null
mkdir ${PROJECT_ROOT_PATH}/dist 2> /dev/null
mkdir ${PROJECT_ROOT_PATH}/.webpack-cache 2> /dev/null
touch ${PROJECT_ROOT_PATH}/src/main.ts

# link to self
cp ./s_vue_2nd/base/templates/s_vue_2nd.sh ${PROJECT_ROOT_PATH}

# scripts
if [ ! -d ${PROJECT_ROOT_PATH}/scripts ]; then
  cp -a ./s_vue_2nd/base/templates/scripts ${PROJECT_ROOT_PATH}/scripts
fi
# .gitignore skel
if [ ! -f ${PROJECT_ROOT_PATH}/.gitignore ]; then
  cp ./s_vue_2nd/base/templates/gitignore ${PROJECT_ROOT_PATH}/.gitignore
fi
# env-development skel
if [ ! -f ${PROJECT_ROOT_PATH}/env-development ]; then
  cp ./s_vue_2nd/base/templates/env-development ${PROJECT_ROOT_PATH}/env-development
fi
# package.json skel
if [ ! -f ${PROJECT_ROOT_PATH}/package.json ]; then
  echo "{}" > ${PROJECT_ROOT_PATH}/package.json
fi
