// 对外暴露 getLinkServer
// getlink(url, key, id, fn) 初始化使用建立和直接子iframe的连接
// url子连接地址  key约定口令 id 子iframe的id fn连接成功并开始接受数据的回调函数
// postMes(url, data);向直接子iframe传数据
// url 字iframe的地址 data 要传的数据

import {Injectable} from '@angular/core';

// 所要通信的iframe地址
let keyUrl = '';
// 为了安全考虑和子iframe约定的口令
let keyword = '';
// 是否成功连接
let match = false;
// 所要通信的 iframeDom
let iframeDom;
// 连接成功后，立即主动执行的回调函数
let startFn;
// 连接成功后，响应子iframe传来的数据的回调函数
let selfFn;
// 监听函数的句柄
function ExeMessage(e) {
   // match = false;
// 同源判断
    console.log(keyUrl);
    console.log(keyUrl.indexOf(e.origin));
  if (e.origin == keyUrl || keyUrl.indexOf(e.origin) >= 0) {
    // console.log('目标子iframe传来的值',  e.data);
    // console.log('目标子iframe应该传的值',  keyword);
console.log('haii', match, keyword);
  // 初始化
    if (!match) {
      console.log('目标口令', e.data, keyword);
      if (e.data !== keyword) {
        console.log('和目标约定的口令不一致！');
        return false;
      } else {
        // angular方连接成功
        match = true;
        console.log('第一步:接受目标子iframe连接请求，并应答：');
        iframeDom.postMessage(keyword, keyUrl);
        // 如果有连接成功主动执行的回调函数则执行
        if (startFn) {
          startFn();
        }
      }
      // 连接成功之后的数据处理
    } else if (e.data === keyword) {
      // 重新连接请求
      console.log('第一 步 （重新连接）:接受目标子iframe连接请求，并应答：');
        if (startFn) {
            iframeDom = startFn();
        }
        console.log('lrf', iframeDom);
      iframeDom.postMessage(keyword, keyUrl);
      startFn();
    } else {
      console.log('来自子iframe的响应', e.data);
      console.log(keyword, '最后一个vue页面的keyword');
      // 如果有连接成功之后的回调函数则执行
      if (selfFn) {
        selfFn(e.data);
      }

    }

  }
}

// 定义参数接口
interface params {
  url: string;
  key: any;
  element: any;
  fn1?: (data: any) => void;
  fn2?: () => void;
}

@Injectable(
)
export class IframeLinkService {
    dom: any;
  getlink(parm: params) {
    keyUrl = parm.url;
    iframeDom = parm.element;
    keyword = parm.key;
    selfFn = parm.fn1 || false;
    startFn = parm.fn2 || false;
    window.addEventListener('message', ExeMessage);
  }
  postMes(url: string, data: any ) {
      /*if (iframeDom === undefined) {
          iframeDom = this.dom;
          console.log(iframeDom);
      }*/
    iframeDom.postMessage(data, url);
  }
  reLink(url: string, key: string) {
      keyUrl = url;
      keyword = key;
      iframeDom = this.dom;
      console.log(iframeDom);
      window.addEventListener('message', ExeMessage);
  }
}
