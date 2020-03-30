package com.zjft.zhyg.system.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjft.zhyg.system.dao.DevServiceCompanyDao;
import com.zjft.zhyg.system.pojo.DevServiceCompany;
import com.zjft.zhyg.system.pojo.MyPage;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevServiceCompanyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Author:xss
 * @Description:设备维护商实现类
 */
@Transactional
@Service
public class DevServiceCompanyServiceImpl implements DevServiceCompanyService {

    private static final Logger log = LoggerFactory.getLogger(DevServiceCompanyServiceImpl.class);


    @Autowired
    private DevServiceCompanyDao devServiceCompanyDao;

    /**
     * 查询设备维护商信息
     * @param param
     * @return
     */
    @Override
    public RspMsg qry(Map<String, String> param){
        Map<String, Object> map = new HashMap<>(8);
        RspMsg rspMsg = new RspMsg();
        // 需要分页查询
        List<DevServiceCompany> result;
        if (!StringUtils.isEmpty(param.get("curPage")) && !StringUtils.isEmpty(param.get("pageSize"))) {
            int curPage = Integer.parseInt(param.get("curPage"));
            int pageSize = Integer.parseInt(param.get("pageSize"));
            Page<DevServiceCompany> page = PageHelper.startPage(curPage, pageSize);
            result = devServiceCompanyDao.qry(map);
            PageInfo<DevServiceCompany> pageInfo = new PageInfo<>(page.getResult());
            int totalRow = (int) pageInfo.getTotal();
            int totalPage = (int) Math.ceil((double) totalRow / pageSize);
            rspMsg.setPage(new MyPage(pageSize, curPage, totalRow, totalPage));
        } else {
            result = devServiceCompanyDao.qry(map);
        }
        if (result == null || result.size() == 0) {
            return new RspMsg("ok", "设备维护商不存在");
        }
        rspMsg.setRetCode("ok");
        rspMsg.setRetMsg("查询成功");
        rspMsg.setData(result);
        return rspMsg;
    }

    /**
     * 设备维护商添加
     * @param devServiceCompany
     * @return
     */
    @Override
    public RspMsg add(DevServiceCompany devServiceCompany) {
        log.info("设备维护商添加开始 name:"+devServiceCompany.getName());
        DevServiceCompany temp = devServiceCompanyDao.qryByName(devServiceCompany.getName());
        if (temp != null) {
            log.warn("设备维护商已存在 name:"+devServiceCompany.getName());
            return new RspMsg("fail", "设备维护商已存在");
        }
        String uuid = UUID.randomUUID().toString();
        if (!StringUtils.isEmpty(devServiceCompany.getInfoFilePath())){
            String filePath = devServiceCompany.getInfoFilePath();
            String infoFileName = filePath.substring(filePath.lastIndexOf(System.getProperty("file.separator"))+9,filePath.length());//去除路径名和随机数
            String basePath = devServiceCompanyDao.getPath();
            String destFilePath = basePath+System.getProperty("file.separator")+uuid+System.getProperty("file.separator")+infoFileName;//目标文件
            File srcFile = new File(devServiceCompany.getInfoFilePath());//源文件
            File destFile = new File(destFilePath);
            if (!destFile.getParentFile().exists()){
                destFile.getParentFile().mkdirs();
            }
            if (destFile.exists()){
                destFile.delete();
            }
            try {
                FileCopyUtils.copy(srcFile,destFile);
                srcFile.delete();
                devServiceCompany.setInfoFileName(infoFileName);
                devServiceCompany.setInfoFilePath(destFilePath);
            } catch (IOException e) {
                log.error("上传文件异常",e);
                return new RspMsg("fail","文件上传异常");
            }
        }
        devServiceCompany.setNo(uuid);
        devServiceCompanyDao.add(devServiceCompany);
        log.info("添加设备维护商成功 devServiceCompany:"+devServiceCompany);
        return new RspMsg("ok", "添加设备维护商成功");

    }

    /**
     * 根据设备维护商号查询设备维护商信息
     * @param no
     * @return
     */
    @Override
    public RspMsg qryByNo(String no) {
        DevServiceCompany devServiceCompany = devServiceCompanyDao.qryByNo(no);
        if (devServiceCompany == null) {
            return new RspMsg("fail", "设备维护商不存在");
        } else {
            return new RspMsg("ok", "查询维护商成功", devServiceCompany);
        }
    }
    /**
     * 设备维护商添加
     * @param devServiceCompany
     * @return
     */
    @Override
    public RspMsg mod(DevServiceCompany devServiceCompany) {
        log.info("设备维护商修改开始 no:"+devServiceCompany.getNo());
        DevServiceCompany temp = devServiceCompanyDao.qryByNameNo(devServiceCompany.getName(),devServiceCompany.getNo());
        if (temp != null) {
            log.warn("设备维护商已存在 name:"+devServiceCompany.getName());
            return new RspMsg("fail", "设备维护商已存在");
        }
        String oldPath = devServiceCompanyDao.getOldPathByNo(devServiceCompany.getNo());
        if (!StringUtils.isEmpty(devServiceCompany.getInfoFilePath())){
            //修改之后有文件
            String filePath = devServiceCompany.getInfoFilePath();
            String infoFileName = filePath.substring(filePath.lastIndexOf(System.getProperty("file.separator"))+9,filePath.length());//去除路径名和随机数
            String basePath = devServiceCompanyDao.getPath();
            String destFilePath = basePath+System.getProperty("file.separator")+devServiceCompany.getNo()+System.getProperty("file.separator")+infoFileName;
            if (!StringUtils.isEmpty(oldPath)){
                //修改之前有文件
                if (oldPath.equals(devServiceCompany.getInfoFilePath())){
                    //文件没有改变，只改变了其他信息
                    int index = devServiceCompany.getInfoFilePath().lastIndexOf("/");
                    devServiceCompany.setInfoFileName(devServiceCompany.getInfoFilePath().substring(index+1));
                    devServiceCompanyDao.mod(devServiceCompany);
                    return new RspMsg("ok","设备维护商修改成功");
                }

                if (changeFilePath(devServiceCompany.getInfoFilePath(),destFilePath)){
                    File file = new File(oldPath);
                    file.delete();//删除之前保存的文件
                    devServiceCompany.setInfoFileName(infoFileName);
                    devServiceCompany.setInfoFilePath(destFilePath);
                    devServiceCompanyDao.mod(devServiceCompany);
                    return new RspMsg("ok","设备维护商修改成功");
                }
                    return new RspMsg("fail","文件写入到目标文件时异常");

            }else {
                //修改之前没有文件
                if (changeFilePath(devServiceCompany.getInfoFilePath(),destFilePath)){
                    devServiceCompany.setInfoFileName(infoFileName);
                    devServiceCompany.setInfoFilePath(destFilePath);
                    devServiceCompanyDao.mod(devServiceCompany);
                    return new RspMsg("ok","设备维护商修改成功");
                }
                    return new RspMsg("fail","文件写入到目标文件时异常");
            }
        }else{
            //修改之后没有文件
            if (!StringUtils.isEmpty(oldPath)){
                //修改之前有文件
               File file = new File(oldPath);
               file.delete();
               devServiceCompanyDao.mod(devServiceCompany);
            }else {
                //修改之前没有文件
                devServiceCompanyDao.mod(devServiceCompany);
            }
            log.info("设备维护商修改成功 devServiceCompany:"+devServiceCompany);
            return new RspMsg("ok","设备维护商修改成功");
        }

    }
    /**
     * 删除设备维护商
     * @param no
     * @return
     */
    @Override
    public RspMsg del(String no) {
        log.info("删除设备维护商开始 no:"+no);
        List<String> temp = devServiceCompanyDao.qryDevService(no);
        if(temp.size()>0){
            log.warn("设备维护商被调用 no:"+no);
            return new RspMsg("fail", "设备维护商被调用,不能删除");
        }else {
            String oldPath = devServiceCompanyDao.getOldPathByNo(no);
            if(!StringUtils.isEmpty(oldPath)){
                File oldFile = new File(oldPath);
                oldFile.delete();
            }
            devServiceCompanyDao.del(no);
            log.info("删除维护商成功 no:"+no);
            return new RspMsg("ok", "删除维护商成功");
        }
    }

    /**
     * 根据维护商编号删除维护商文件
     * @param no
     * @return
     */
    @Override
    public RspMsg delFileByNo(String no) {
        log.info("根据维护商编号删除维护商文件开始 no:"+no);
        String oldPath = devServiceCompanyDao.getOldPathByNo(no);
        File oldFile = new File(oldPath);
        oldFile.delete();
        devServiceCompanyDao.delFileByNo(no);
        log.info("删除维护商文件成功 no:"+no);
        return new RspMsg("ok","删除维护商文件成功");
    }

    /**
     * 根据维护商编号获取文件路径
     * @param no
     * @return
     */
    @Override
    public String getPathByNo(String no) {
        return devServiceCompanyDao.getOldPathByNo(no);
    }


    /**
     * 将源文件写到目标文件中
     * @param srcFilePath 源文件路径
     * @param destFilePath 目标文件路径
     * @return
     */
    public static boolean changeFilePath(String srcFilePath,String destFilePath){
        File srcFile = new File(srcFilePath);
        File destFile = new File(destFilePath);
        if (!destFile.getParentFile().exists()){
            destFile.getParentFile().mkdirs();
        }
        if (destFile.exists()){
            destFile.delete();
        }
        try {
            FileCopyUtils.copy(srcFile,destFile);//从源文件写到目录文件中
            srcFile.delete();//删除临时文件中的文件
        } catch (IOException e) {
           log.error("文件写入最终目录异常",e);
           return false;
        }
        return  true;
    }
}