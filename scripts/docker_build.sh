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

# The reason for this complexity is that we want the container to be running
# with the exact same user id than the host. That way, when stuff gets created
# inside the container, the host user will own them.
docker build -t saavu-local/s_vue_2nd_v6 --build-arg container_user_id=$(id -u) .
