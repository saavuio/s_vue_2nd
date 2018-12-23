#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

# The point of this is to make development experience better by copying files
# out of the container (node_modules, .eslintrc.js etc). This will allow editors
# to do realtime linting and module discovery.
#
# Remove .ejected to get the files out of the containers again (should not be
# necessary unless the base template has been updated).

if [ ! -f .ejected ]; then
  echo "fetching stuff from inside the container."
  IMAGE_ID=s_vue_2nd
  RUNNER=./${IMAGE_ID}.sh
  if [ ! -f $RUNNER ]; then exit 1; fi
  CONTAINER_NAME=${IMAGE_ID}_tmp
  CONTAINER_NAME=$CONTAINER_NAME NO_TTY=1 $RUNNER eval "sleep 30;" &
  #
  echo "run container..."
  until docker ps | grep "$CONTAINER_NAME" > /dev/null; do
    sleep 2
    echo "waiting for container to start..."
  done
  echo "container started!"

  echo "copy files from container..."
  #
  docker cp ${CONTAINER_NAME}:/$IMAGE_ID/.eslintrc.js ./
  docker cp ${CONTAINER_NAME}:/$IMAGE_ID/.prettierrc ./
  docker cp ${CONTAINER_NAME}:/$IMAGE_ID/tsconfig.json ./
  #
  docker cp ${CONTAINER_NAME}:/$IMAGE_ID/node_modules.tar.bz2 ./
  echo "extract node_modules..."
  tar xjf node_modules.tar.bz2
  rm node_modules.tar.bz2
  #
  docker stop ${CONTAINER_NAME}
  #
  touch .ejected
fi

echo "merge node_modules_app and node_modules...";
cp -a node_modules_app/* node_modules/

echo "done."
