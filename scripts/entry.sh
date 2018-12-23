#!/bin/bash
cd /s_vue_2nd

# copy external node modules
cp -a /ext/node_modules/* node_modules

# merge external package.json
package-json-merge ./package.json /ext/package.json > /tmp/package.json
cat /tmp/package.json > ./package.json

${@:1}
