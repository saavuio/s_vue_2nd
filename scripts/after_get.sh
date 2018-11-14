#!/bin/bash
if [ -z $PROJECT_ROOT_PATH ]; then
  echo "PROJECT_ROOT_PATH not provided"
  exit 1
fi

# folders required
mkdir ${PROJECT_ROOT_PATH}/src 2> /dev/null
mkdir ${PROJECT_ROOT_PATH}/dist 2> /dev/null

# link to self
cp ./s_vue_2nd/templates/s_vue_2nd.sh ${PROJECT_ROOT_PATH}

# scripts
if [ ! -d ${PROJECT_ROOT_PATH}/scripts ]; then
  cp -a ./s_vue_2nd/templates/scripts ${PROJECT_ROOT_PATH}/scripts
fi
# .gitignore skel
if [ ! -f ${PROJECT_ROOT_PATH}/.gitignore ]; then
  cp ./s_vue_2nd/templates/gitignore ${PROJECT_ROOT_PATH}/.gitignore
fi
# env-development skel
if [ ! -f ${PROJECT_ROOT_PATH}/env-development ]; then
  cp ./s_vue_2nd/templates/env-development ${PROJECT_ROOT_PATH}/env-development
fi
# package.json skel
if [ ! -f ${PROJECT_ROOT_PATH}/package.json ]; then
  echo "{}" > ${PROJECT_ROOT_PATH}/package.json
fi
