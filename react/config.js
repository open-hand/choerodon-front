const config = {
  local: true, //是否为本地开发
  buildType: 'single',
  projectType: 'choerodon',
  master: './node_modules/@choerodon/master/lib/master.js',
  modules: [
    '@choerodon/base',
    '@choerodon/asgard',
    '@choerodon/notify',
    '@choerodon/manager',
    "@choerodon/agile",
    "@choerodon/testmanager",
    "@choerodon/knowledge",
    "@choerodon/devops",
    "@choerodon/code-repo",
    "@choerodon/prod-repo",
  ],
  resourcesLevel: ['site', 'organization', 'project', 'user'],
  emailBlackList: 'qq.com,gmail.com,sina.com,163.com,sina.cn,126.com,yeah.net,189.cn'
};

module.exports = config;
