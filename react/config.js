const config = {
  local: true, //是否为本地开发
  modules: [
    '@choerodon/base',
    '@choerodon/asgard',
    '@choerodon/devops',
    '@choerodon/manager',
    '@choerodon/notify',
    '@choerodon/code-repo',
    '@choerodon/prod-repo',
  ]
};

module.exports = config;
