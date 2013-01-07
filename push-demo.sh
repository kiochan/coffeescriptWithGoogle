#!/bin/bash
# Deploy the CoffeeScript-to-Closure demo to
# http://bolinfest.com/coffee/

set -e
git checkout lib/*.js
git checkout extras/coffee-script.js

bin/cake build
bin/cake build:parser
bin/cake build:browser

COFFEE=/www/bolinfest.com/coffee
cp extras/coffee-script.js    ${COFFEE}/coffee-script.js
cp closure/demo/index.html    ${COFFEE}/index.html
cp closure/demo/demo.js       ${COFFEE}/demo.js
cp closure/demo/features.html ${COFFEE}/features.html

sed -i -e 's#../../extras/##' ${COFFEE}/index.html
