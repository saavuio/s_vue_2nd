#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

echo "Fetching stuff from inside the container."

IMAGE_NAME=s_node_1st
RUNNER=./${IMAGE_NAME}.sh
if [ ! -f $RUNNER ]; then exit 1; fi
CONTAINER_NAME=${IMAGE_NAME}_tmp
CONTAINER_NAME=$CONTAINER_NAME NO_TTY=1 $RUNNER eval "sleep 30;" &

echo "run container..."
until docker ps | grep "$CONTAINER_NAME" > /dev/null; do
  sleep 2
  echo "waiting for container to start..."
done
echo "container started!"

docker cp ${CONTAINER_NAME}:/$IMAGE_NAME/node_modules ./
docker cp ${CONTAINER_NAME}:/$IMAGE_NAME/.eslintrc.js ./

if [ $? -eq 0 ]; then
  echo "files copied from container!"
  docker stop ${CONTAINER_NAME}
fi
