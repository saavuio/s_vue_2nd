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

docker build -t saavu-local/s_vue_2nd_v4 --build-arg container_user_id=$(id -u) .
