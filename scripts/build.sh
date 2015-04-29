#!/bin/bash -e

webpack=node_modules/.bin/webpack

rm -rf tmp
mkdir tmp
rm -rf build
mkdir build

cp -r lib tmp/lib
cp knex.js tmp

node -p 'p=require("./package");p.main="lib";p.scripts=p.devDependencies=undefined;JSON.stringify(p,null,2)' > tmp/package.json

$webpack --config scripts/webpack.config.js tmp build/knex.js

rm -rf tmp