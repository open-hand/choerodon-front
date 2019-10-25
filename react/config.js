const config = {
  local: true, //是否为本地开发
  theme: {
    'primary-color': '#3F51B5',
  },
  cookieServer: '',
  clientId: 'localhost', // 必须填入响应的客户端（本地开发）
  cookieServer: '', //子域名token共享
  titlename: 'Choerodon | 多云应用技术集成平台',
  server: 'http://api.choerodon.example.com',
  fileServer: 'http://minio.choerodon.example.com',
  webSocketServer: 'ws://notify.choerodon.example.com',
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
  ],
  resourcesLevel: ['site', 'organization', 'project', 'user'],
  outward: '/knowledge/share',
};

module.exports = config;
