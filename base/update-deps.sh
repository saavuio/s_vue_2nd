#!/bin/bash
RUN_DIR=$(pwd)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd $(realpath $SCRIPT_DIR)

echo "install dependencies"
./yarn.sh install

echo
echo "compress node_modules"
tar cjf node_modules.tar.bz2 node_modules/

echo "upload to seperate github repo"
CACHE_DIR=node_modules_cache
CACHE_REPO=git@github.com:saavuio/s_vue_2nd_cache.git
VERSION=v7

if [ -d $CACHE_DIR ]; then
  rm -rf $CACHE_DIR
fi

mkdir $CACHE_DIR
mv node_modules.tar.bz2 $CACHE_DIR
cd $CACHE_DIR
git init
git remote add origin $CACHE_REPO
git checkout -b $VERSION
git add node_modules.tar.bz2
git commit -m "Latest."
git push -u -f origin $VERSION
