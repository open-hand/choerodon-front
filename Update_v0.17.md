# 0.17 前端升级说明

## 工程映射关系

以0.17.6 作为说明

依赖名称 | 代码库 | 版本
--- | --- | ---
"@choerodon/boot": "0.17.4" | https://github.com/choerodon/choerodon-front-boot | 0.17.4
"@choerodon/master": "0.17.3" | https://github.com/choerodon/choerodon-front-master | 0.17.3 
"@choerodon/iam": "0.17.1" | https://github.com/choerodon/iam-service | 0.17.1
"@choerodon/asgard": "0.17.0" | https://github.com/choerodon/asgard-service | 0.17.1
"@choerodon/notify": "0.17.1" | https://github.com/choerodon/notify-service | 0.17.1
"@choerodon/manager": "0.17.0" | https://github.com/choerodon/manager-service | 0.17.0
"@choerodon/devops": "0.17.4" | https://github.com/choerodon/devops-service | 0.17.4
"@choerodon/knowledge": "0.17.3" | https://github.com/choerodon/knowledgebase-service | 0.17.3
"@choerodon/agile": "0.17.5" | https://github.com/choerodon/agile-service | 0.17.5
"@choerodon/issue": "0.17.0" | https://github.com/choerodon/issue-service | 0.17.0
"@choerodon/testmanager": "0.17.0" | https://github.com/choerodon/test-manager-service | 0.17.0
"@choerodon/wiki": "0.17.0" | https://github.com/choerodon/wiki-service | 0.17.0

## 

## 项目迁移

### 把原来的代码，拷贝到后端项目的react目录下

在后端项目根目录下新建package.json
``` json
{
  "name": "@choerodon/asgard",
  "routeName": "asgard",
  "version": "1.0.0",
  "description": "",
  "main": "./react/src/app/asgard/containers/AsgardIndex.js",
  "dependencies": {
    "@choerodon/boot": "0.x.x",
    "@choerodon/master": "0.x.x"
  },
  "scripts": {
    "start": "choerodon-front-boot start --config ./react/config.js",
    "dist": "choerodon-front-boot dist --config ./react/config.js",
    "lint-staged": "lint-staged",
    "lint-staged:es": "eslint"
  },
  "author": "",
  "license": "ISC",
  "lint-staged": {
    "react/**/*.{js,jsx}": [
      "npm run lint-staged:es"
    ],
    "react/**/*.scss": "stylelint --syntax scss"
  },
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "peerDependencies": {}
}
```
* name为模块名（可以增加@choerodon scope）
* routeName为路由前缀（如空，取模块名）
* main为入口index的路径（如空，当前模块不会被编译进去）
* 依赖中除了boot的依赖加入一个@choerodon/master的依赖（表示进入页面后的部分，菜单、header和AutoRouter等，可自己配置）

### 修改config.js
```
const config = {
  // use for c7n start
  server: 'http://api.xxx.xxx',
  master: '@choerodon/master',
  projectType: 'choerodon',
  buildType: 'single',
  dashboard: {},
  resourcesLevel: ['site', 'origanization', 'project', 'user'],
};
module.exports = config;
```
## 本地启动

与原有方式并无差异，根目录执行 `npm run start` 即可

## 总前端打包

参考0.17.6 的choerodon-front 的.gitlab-ci.yml 文件

```
image: registry.cn-hangzhou.aliyuncs.com/choerodon-tools/cibase:0.8.1

stages:
  - build

build:
  stage: build
  script:
    - npm run clean
    - npm i --registry ${NPM_REPO} --sass-binary-site=http://npm.taobao.org/mirrors/node-sass
    - chmod -R 777 node_modules
    - npm run dist
    - cp -r src/main/resources/lib $CI_PROJECT_DIR/docker/lib
    - kaniko -c $CI_PROJECT_DIR/docker -f $CI_PROJECT_DIR/docker/Dockerfile -d ${DOCKER_REGISTRY}/${GROUP_NAME}/${PROJECT_NAME}:${CI_COMMIT_TAG}

.auto_devops: &auto_devops |
  http_status_code=`curl -o .auto_devops.sh -s -m 10 --connect-timeout 10 -w %{http_code} "${CHOERODON_URL}/devops/ci?token=${Token}&type=front"`
  if [ "$http_status_code" != "200" ]; then
    cat .auto_devops.sh
    exit 1
  fi
  source .auto_devops.sh
```

## 发布

各前端子模块打好tag 后，执行 `npm publish`。总前端拉取最新版的ci 打包即可。