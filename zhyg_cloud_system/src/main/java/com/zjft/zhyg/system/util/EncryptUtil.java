package com.zjft.zhyg.system.util;

import java.security.MessageDigest;

/**
 * @author shp
 * @since 2005.12.12
 */
public final class EncryptUtil {

    /**
     * MD5加密算法
     *
     * @param arg0 - 要加密的字符串
     * @return 加密过后的字符串
     */

    public static String MD5(String arg0) {
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            byte[] strTemp = arg0.getBytes();
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(strTemp);
            byte[] md = mdTemp.digest();
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }

}