package com.zjft.zhyg.system.controller;

import com.zjft.zhyg.system.aop.Buttons;
import com.zjft.zhyg.system.aop.Menus;
import com.zjft.zhyg.system.aop.ZjftOperateLog;
import com.zjft.zhyg.system.pojo.DevServiceCompany;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.service.DevServiceCompanyService;
import com.zjft.zhyg.system.util.UploadUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;

/**
 * @Author:xss
 * @Description:设备维护商管理模块
 */
@RestController
@RequestMapping("/devServiceManager")
public class DevServiceCompanyController {
    private static final Logger log = LoggerFactory.getLogger(DevServiceCompanyController.class);

    @Autowired
    DevServiceCompanyService devServiceCompanyService;

    /**
     * 查询设备维护商信息
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/qryDevServiceCompany", method = RequestMethod.GET)
    public RspMsg qry(HttpServletRequest request) {
        log.info("qry()");
        RspMsg rspMsg;
        try {
            Map<String, String> param = new HashMap<>(8);
            param.put("curPage", request.getParameter("curPage"));
            param.put("pageSize", request.getParameter("pageSize"));
            rspMsg = devServiceCompanyService.qry(param);
        } catch (Exception e) {
            log.error("查询设备维护商信息失败", e);
            rspMsg = new RspMsg("fail", " 查询设备维护商异常");
        }
        return rspMsg;
    }

    /**
     * 添加维护商设备
     *
     * @param devServiceCompany
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_MAINTAIN, button = Buttons.ADD)
    @RequestMapping(value = "/addDevServiceCompany", method = RequestMethod.POST)
    public RspMsg add(@RequestBody DevServiceCompany devServiceCompany) {
        log.info("add()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(devServiceCompany.getName())) {
                rspMsg = new RspMsg("fail", "添加设备维护商参数校验失败");
            } else {
                rspMsg = devServiceCompanyService.add(devServiceCompany);
            }
        } catch (Exception e) {
            log.error("添加设备维护商信息失败", e);
            rspMsg = new RspMsg("fail", "添加设备维护商异常");
        }
        return rspMsg;
    }

    /**
     * 根据编号查询设备维护商
     *
     * @param no
     * @return
     */
    @RequestMapping(value = "/qryDevServiceCompanyById", method = RequestMethod.GET)
    public RspMsg qryByNo(@RequestParam("no") String no) {
        log.info("qryByNo");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)) {
                rspMsg = new RspMsg("fail", "设备维护商编号不能为空");
            } else {
                rspMsg = devServiceCompanyService.qryByNo(no);
            }
        } catch (Exception e) {
            log.error("查询设备维护商失败", e);
            rspMsg = new RspMsg("fail", "根据编号查询设备维护商失败");
        }
        return rspMsg;

    }

    /**
     * 修改维护商设备
     *
     * @param map
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_MAINTAIN, button = Buttons.MOD)
    @RequestMapping(value = "/modDevServiceCompany", method = RequestMethod.POST)
    public RspMsg mod(@RequestBody Map map) {
        log.info("mod()");
        RspMsg rspMsg;
        DevServiceCompany devServiceCompany = new DevServiceCompany();
        try {
            if (map != null) {
                BeanUtils.populate(devServiceCompany, ((LinkedHashMap) map.get("current")));
            }
            if (StringUtils.isEmpty(devServiceCompany.getNo()) || StringUtils.isEmpty(devServiceCompany.getName())) {
                rspMsg = new RspMsg("fail", "修改设备维护商参数校验失败");
            } else {
                rspMsg = devServiceCompanyService.mod(devServiceCompany);
            }
        } catch (Exception e) {
            log.error("修改设备维护商信息失败", e);
            rspMsg = new RspMsg("fail", "修改设备维护商异常");
        }
        return rspMsg;
    }

    /**
     * 删除维护商设备
     *
     * @param no
     * @return
     */
    @ZjftOperateLog(menu = Menus.DEV_MAINTAIN, button = Buttons.DEL)
    @RequestMapping(value = "/delDevServiceCompany", method = RequestMethod.DELETE)
    public RspMsg del(@RequestParam("no") String no) {
        log.info("del()");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)) {
                rspMsg = new RspMsg("fail", "设备维护商编号不能为空");
            } else {
                rspMsg = devServiceCompanyService.del(no);
            }
        } catch (Exception e) {
            log.error("删除维护商设备失败", e);
            rspMsg = new RspMsg("fail", "删除维护商设备失败");
        }
        return rspMsg;

    }

    @RequestMapping(value = "/delFileByNo", method = RequestMethod.DELETE)
    public RspMsg delFileByNo(@RequestParam("no") String no) {
        log.info("delFileByNo");
        RspMsg rspMsg;
        try {
            if (StringUtils.isEmpty(no)) {
                rspMsg = new RspMsg("fail", "设备维护商编号不能为空");
            } else {
                rspMsg = devServiceCompanyService.delFileByNo(no);
            }
        } catch (Exception e) {
            log.error("删除文件异常", e);
            rspMsg = new RspMsg("fail", "删除维护商文件异常");
        }
        return rspMsg;
    }

    /**
     * 上传文件
     *
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public RspMsg uploadFile(MultipartFile file, HttpServletRequest request) {
        log.info("uploadFile()");
        RspMsg rspMsg;
        String path = System.getProperty("user.dir") + System.getProperty("file.separator") + "tempFile";
        String name = file.getOriginalFilename();//上传文件的真实名称
        String hash = Integer.toHexString(new Random().nextInt());
        String fileName = hash + name;//防止文件名重复
        try {
            String url = path + System.getProperty("file.separator") + UploadUtil.uploadFile(file, path, fileName);
            rspMsg = new RspMsg("ok", "上传成功", url);
        } catch (IOException e) {
            log.error("文件上传异常", e);
            rspMsg = new RspMsg("fail", "文件上传异常");
        }
        return rspMsg;
    }

    /**
     * 下载文件
     */
    @RequestMapping(value = "preview", method = RequestMethod.GET)
    public RspMsg previewFile(HttpServletRequest request, HttpServletResponse response) {
        log.info("previewFile()");
        String no = request.getParameter("no");
        String url = devServiceCompanyService.getPathByNo(no);
        InputStream bin = null;
        OutputStream out = null;
        String fileName = url.substring(76);
        try {
            File file = new File(url);
            if (!file.exists()) {
                return new RspMsg("fail", "文件不存在");
            }

            byte[] buffer = new byte[1024];
            bin = new BufferedInputStream(new FileInputStream(file));
            response.setContentType("application/pdf");
            out = response.getOutputStream();
            int i;
            while ((i = bin.read(buffer)) != -1) {
                out.write(buffer, 0, i);
            }
            out.flush();
            return null;
        } catch (IOException e) {
            log.error("在线预览异常");
            return new RspMsg("fail", "在线预览异常");
        } finally {
            if (bin != null) {
                try {
                    bin.close();
                } catch (IOException e) {
                    log.error("关闭输入流异常");
                    bin = null;
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    log.error("关闭输出流异常");
                    out = null;
                }
            }
        }

    }

    @RequestMapping(value = "downFile", method = RequestMethod.GET)
    public RspMsg down(HttpServletRequest request, HttpServletResponse response) {
        log.info("down()");
        String no = request.getParameter("no");
        String url = devServiceCompanyService.getPathByNo(no);
        BufferedInputStream bin = null;
        OutputStream out = null;
        String fileName = url.substring(76);
        try {
            File file = new File(url);
            if (!file.exists()) {
                return new RspMsg("fail", "文件不存在");
            }
            response.setHeader("content-type", "application/octet-stream");
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            byte[] buffer = new byte[1024];
            bin = new BufferedInputStream(new FileInputStream(file));
            out = response.getOutputStream();
            int i;
            while ((i = bin.read(buffer)) != -1) {
                out.write(buffer, 0, i);
            }
            out.flush();
            return null;
        } catch (IOException e) {
            log.error("文件下载异常");
            return new RspMsg("fail", "下载文件异常");
        } finally {
            if (bin != null) {
                try {
                    bin.close();
                } catch (IOException e) {
                    log.error("关闭输入流异常");
                    bin = null;
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    log.error("关闭输出流异常");
                    out = null;
                }
            }
        }

    }

    @RequestMapping(value = "beforeDown", method = RequestMethod.GET)
    public RspMsg beforeDown(HttpServletRequest request) {
        log.info("down()");
        String no = request.getParameter("no");
        if (StringUtils.isEmpty(no)) {
            return new RspMsg("fail", "文件不存在");
        }
        String url = devServiceCompanyService.getPathByNo(no);
        if (StringUtils.isEmpty(url)) {
            return new RspMsg("fail", "该维护商不存在文件");
        }
        File file = new File(url);
        if (!file.exists()) {
            return new RspMsg("fail", "文件不存在");
        }
        return new RspMsg("ok", "文件存在");
    }

}