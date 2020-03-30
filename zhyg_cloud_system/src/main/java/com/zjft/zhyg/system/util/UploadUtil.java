package com.zjft.zhyg.system.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @author: liurenfei
 * @description:文件上传工具类
 */
public class UploadUtil {
    public static String uploadFile(MultipartFile file,String path,String fileName) throws IOException {
        File tempFile = new File(path,fileName);//新建文件
        if (!tempFile.getParentFile().exists()){
            tempFile.getParentFile().mkdir();
        }
        if (tempFile.exists()){
            tempFile.delete();
        }
        tempFile.createNewFile();
        file.transferTo(tempFile);
        return tempFile.getName();
    }
}
