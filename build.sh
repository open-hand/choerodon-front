#!/bin/bash
npm run clean
npm i --registry https://nexus.choerodon.com.cn/repository/choerodon-npm/ --sass-binary-site=http://npm.taobao.org/mirrors/node-sass
chmod -R 777 node_modules
npm run dist
cp -r src/main/resources/lib ./docker/lib