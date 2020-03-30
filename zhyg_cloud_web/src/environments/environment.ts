// The file contents for the current environment will overwrite these during build.
// The build system defaults to the dev environment which uses `environment.ts`, but if you do
// `ng build --env=prod` then `environment.prod.ts` will be used instead.
// The list of which env maps to which file can be found in `.angular-cli.json`.

export let environment = {
    chore: true,
    // 服务器部署时使用的环境配置
   /* VUE_EXTEND_LINK: 'http://172.16.69.76:4203/webExtend',
    VUE_MEDIA_LINK: 'http://172.16.69.76:4203/mediaShow',
    SERVER_URL: 'http://172.16.69.75:8091',
    SERVER_FILE_URL: 'http://172.16.69.75:8091',
    WEBSOCKET_URL: 'ws://172.16.69.75:8091',
    VUE_QUEUEMANAGE_LINK: 'http://172.16.69.76:4203/queuemanage',
    RESOURCE_URL: 'http://172.16.69.76:4203/zjbims/assets',*/
    // 本地测试时使用的环境配置
    SERVER_URL: '',
    SERVER_FILE_URL: '',
    WEBSOCKET_URL: '',
    RESOURCE_URL: '',
    VUE_QUEUEMANAGE_LINK: '',
    VUE_EXTEND_LINK: '',
    VUE_MEDIA_LINK: '',
    production: false,
    hmr: false,
    useHash: false

    // "VUE_EXTEND_LINK": "http://172.16.69.76:4203/webExtend",
    // "VUE_MEDIA_LINK": "http://172.16.69.76:4203/mediaShow",
    // "SERVER_URL": "http://172.16.69.75:8091",
    // "SERVER_FILE_URL": "http://172.16.69.75:8091",
    // "WEBSOCKET_URL": "ws://172.16.69.75:8091",
    // "VUE_QUEUEMANAGE_LINK": "http://172.16.69.76:4203/queuemanage",
    // "RESOURCE_URL": "http://172.16.69.76:4203/zjbims/assets"
};
