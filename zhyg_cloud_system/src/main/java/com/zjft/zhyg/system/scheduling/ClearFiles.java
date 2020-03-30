package com.zjft.zhyg.system.scheduling;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.swing.plaf.synth.SynthSpinnerUI;
import java.io.File;
import java.time.temporal.Temporal;

/**
 * @author: liurenfei
 * @description:定时删除设备维护商上传文件夹中的临时文件
 */
@Component
public class ClearFiles {
    private static final Logger log = LoggerFactory.getLogger(ClearFiles.class);

    /**
     * 每天凌晨0点定时删除临时文件
     */
    @Scheduled(cron = "0 0 0 * * ?")
    public void clear(){
        String path = "C:/tempFile1";
        File file = new File(path);
        boolean flag = false;
        if (!file.exists()){
            log.error("维护商临时文件夹不存在");
            return ;
        }
        flag = delAllFile(path);
        if (flag){
           log.info("定时清除维护商临时文件成功");
        }else {
            log.error("定时清除维护商临时文件失败");
        }

    }

    /**
     * 删除指定目录下的所有文件
     * @param path
     * @return
     */
    public static boolean delAllFile(String path){
        boolean flag = false;
        File file = new File(path);
        if (!file.exists()){
            return flag;
        }
        if (!file.isDirectory()){
            return flag;
        }
        String [] tempArr = file.list();
        File temp = null;
        for (int i=0;i<tempArr.length;i++){
            if (path.endsWith(File.separator)){
                temp = new File(path+tempArr[i]);
            }else {
                temp = new File(path+File.separator+ tempArr[i]);
            }
            if (temp.isFile()){
                temp.delete();
                flag = true;
            }
            if (temp.isDirectory()){
                delAllFile(path+File.separator+tempArr[i]);
                delFolder(path+File.separator+tempArr[i]);
                flag = true;
            }
        }
        return flag;
    }

    /**
     * 删除文件夹
     * @param path
     */
    private static void delFolder(String path) {
        delAllFile(path);//删除文件内的文件
        File file = new File(path);
        file.delete();
    }
}
