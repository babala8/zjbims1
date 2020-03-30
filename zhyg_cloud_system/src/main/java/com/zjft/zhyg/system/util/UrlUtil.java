package com.zjft.zhyg.system.util;

/**
 * @author: liurenfei
 * @description: Url地址解析
 */
public class UrlUtil {
    private String userNo;
    private String token;

    public String getUserNo(){
        return  this.userNo;
    }
    public String getToken(){
        return  this.token;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public void setToken(String token) {
        this.token = token;
    }

    /**
     * 解析websocket地址中的参数
     * @param url
     * @return
     */
    public  UrlUtil UrlResolve(String url){
        String userNo = url.substring(url.indexOf("=")+1,url.indexOf("&"));
        String token = url.substring(url.lastIndexOf("=")+1,url.length());
        this.userNo = userNo;
        this.token = token;
        return this;
    }

}
