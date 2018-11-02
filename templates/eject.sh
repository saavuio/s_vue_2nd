#!/bin/bash
echo "Fetching stuff from inside the container."

IMAGE_NAME=s_vue_2nd
CONTAINER_NAME=$(docker ps | grep $IMAGE_NAME | sed 's/ \+ /\t/g' | cut -d$'\t' -f7)

docker cp $CONTAINER_NAME:/$IMAGE_NAME/node_modules ./
docker cp $CONTAINER_NAME:/$IMAGE_NAME/.eslintrc.js ./
docker cp $CONTAINER_NAME:/$IMAGE_NAME/.prettierrc ./
docker cp $CONTAINER_NAME:/$IMAGE_NAME/tsconfig.json ./
