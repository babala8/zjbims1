export let environment = {
    chore: false,
    // 服务器部署时环境配置
   /* VUE_EXTEND_LINK: 'http://172.16.69.76:4203/webExtend',
    VUE_MEDIA_LINK: 'http://172.16.69.76:4203/mediaShow',
    VUE_QUEUEMANAGE_LINK: 'http://172.16.69.76:4203/queuemanage',
    SERVER_URL: 'http://172.16.69.75:8091',
    SERVER_FILE_URL: 'http://172.16.69.75:8091',
    WEBSOCKET_URL: 'ws://172.16.69.75:8091',
    RESOURCE_URL: 'http://172.16.69.76:4203/zjbims/assets',*/
    // 本地测试时环境配置
    SERVER_URL: '',
    SERVER_FILE_URL: '',
    WEBSOCKET_URL: '',
    RESOURCE_URL: '',
    VUE_QUEUEMANAGE_LINK: '',
    VUE_EXTEND_LINK: '',
    VUE_MEDIA_LINK: '',
    production: true,
    hmr: false,
    useHash: true
};
