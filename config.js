const config = {
    local: true, //是否为本地开发
    clientId: 'localhost', // 必须填入响应的客户端（本地开发）
    titlename: 'Choerodon', //项目页面的title名称
    favicon: 'favicon.ico', //项目页面的icon图片名称
    fileServer: 'http://minio.choerodon.com.cn',
    theme: {
        'primary-color': '#3F51B5',
    },
    cookieServer: '', //子域名token共享
    server: 'http://api.choerodon.com.cn',
    dashboard: {
        iam: 'choerodon-front-iam/iam/src/app/iam/dashboard/*',
        testManager: 'choerodon-front-test-manager/testManager/src/app/testManager/dashboard/*'
    },
};

module.exports = config;