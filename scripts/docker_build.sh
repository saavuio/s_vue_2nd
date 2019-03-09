#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd $SCRIPT_DIR
cd ..

echo
echo
echo "-------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------"
echo "NOTE: this might take a while and pause for long periods without any output while downloading packages."
echo "-------------------------------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------------------------------"
echo
echo

IS_DEV="false"
if [ "$1" = "dev" ]; then
  IS_DEV="true"
  echo "RUNNING AS A DEV BUILD!"
fi

# The reason for this complexity is that we want the container to be running
# with the exact same user id than the host. That way, when stuff gets created
# inside the container, the host user will own them.
docker build -t saavu-local/s_vue_2nd_v7 --build-arg container_user_id=$(id -u) --build-arg is_dev=$IS_DEV .
