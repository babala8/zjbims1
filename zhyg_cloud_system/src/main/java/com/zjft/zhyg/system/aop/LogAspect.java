package com.zjft.zhyg.system.aop;

import com.zjft.zhyg.system.FinalValues;
import com.zjft.zhyg.system.pojo.RspMsg;
import com.zjft.zhyg.system.pojo.User;
import com.zjft.zhyg.system.service.AuditService;
import com.zjft.zhyg.system.service.DevBaseService;
import com.zjft.zhyg.system.service.LogService;
import com.zjft.zhyg.system.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Author zyq
 * @Description 操作日志记录切面
 **/
@Aspect
@Component
@Slf4j
public class LogAspect {

    @Autowired
    private LogService logService;
    @Autowired
    private AuditService auditService;
    @Autowired
    private UserService userService;
    @Autowired
    private DevBaseService devBaseService;
    /**
     * 拦截用@ZjftOperateLog 注解的方法
     */
    @Pointcut("@annotation(com.zjft.zhyg.system.aop.ZjftOperateLog)")
    public void logPointCut() {
    }

    @Around("logPointCut()")
    public Object around(ProceedingJoinPoint pjp)throws Throwable {
        RspMsg rspMsg=new RspMsg();
        //前置开始是否需要审批的处理逻辑
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        ZjftOperateLog annotion = ((MethodSignature) pjp.getSignature()).getMethod().getAnnotation(ZjftOperateLog.class);
        //获取请求中的参数
        Object[] args = pjp.getArgs();
        //参数转byte[]数组
        byte[] currentDetail = ObjectToByte(args[0]);
        byte[] beforeDetail = new byte[100];
        String userNo;
        // 登录操作的userNo在参数中，其他操作的都在headers中
        if (annotion.button() == Buttons.LOGIN) {
            userNo = ((User) pjp.getArgs()[0]).getNo();
        } else {
            userNo = request.getHeader("userNo");
        }
        //类名
        String declaringTypeName = pjp.getSignature().getDeclaringTypeName();
        //方法名
        String methodName = pjp.getSignature().getName();
        //是否需要审批标志，需要则保存到sys_audit表中，不需要则走正常保存步骤
        String auditFlag = request.getHeader("auditFlag");
        if (!StringUtils.isEmpty(auditFlag) && auditFlag.equalsIgnoreCase("true")){

            if (declaringTypeName.toLowerCase().contains("dev")){
                Map<String, Object> auditTable = new HashMap<>();
                if (methodName.equalsIgnoreCase("add")){
                    addAuditBase(request, currentDetail, declaringTypeName, methodName, auditTable, userNo);
                }
                if (methodName.equalsIgnoreCase("mod")){
                    //获得以前的数据
                    if(args[0] instanceof  Map){
                        Map map = (Map)args[0];
                        if (map!=null){
                            LinkedHashMap current =  (LinkedHashMap) map.get("current");
                            LinkedHashMap before =  (LinkedHashMap) map.get("before");
                            currentDetail = ObjectToByte(current);
                            beforeDetail = ObjectToByte(before);
                        }
                    }
                    auditTable.put("beforeDetail",beforeDetail);
                    auditTable.put("currentDetail",currentDetail);
                    addAuditBase(request, currentDetail, declaringTypeName, methodName, auditTable, userNo);
                }
                if (methodName.equalsIgnoreCase("del")){
                    String no = pjp.getArgs()[0].toString();
                    System.out.println(no);
                    Object before = devBaseService.qryByNo(no).getData();
                    beforeDetail = ObjectToByte(before);
                    System.out.println(beforeDetail);
                    auditTable.put("beforeDetail",beforeDetail);
                    addAuditBase(request, currentDetail, declaringTypeName, methodName, auditTable, userNo);
                }
                rspMsg = auditService.addAudit(auditTable);
            }

            if (declaringTypeName.toLowerCase().contains("user")){
                Map<String, Object> auditTable = new HashMap<>();
                if (methodName.equalsIgnoreCase("add")){
                    addAuditBase(request, currentDetail, declaringTypeName, methodName, auditTable, userNo);
                }
                if (methodName.equalsIgnoreCase("mod")){
                    if(args[0] instanceof  Map){
                        Map map = (Map)args[0];
                        if (map!=null){
                            LinkedHashMap current =  (LinkedHashMap) map.get("current");
                            LinkedHashMap before =  (LinkedHashMap) map.get("before");
                            System.out.println(before+","+current);
                            currentDetail = ObjectToByte(current);
                            beforeDetail = ObjectToByte(before);
                        }
                    }
                    auditTable.put("beforeDetail",beforeDetail);
                    auditTable.put("currentDetail",currentDetail);
                    addAuditBase(request, currentDetail, declaringTypeName, methodName, auditTable, userNo);
                }
                if (methodName.equalsIgnoreCase("del")){
                    //获得以前的数据
                    String no = pjp.getArgs()[0].toString();
                    Object before = userService.qryByNo(no).getData();
                    beforeDetail = ObjectToByte(before);
                    auditTable.put("beforeDetail",beforeDetail);
                    addAuditBase(request, currentDetail, declaringTypeName, methodName, auditTable, userNo);
                }
                rspMsg = auditService.addAudit(auditTable);
            }
        }else {
            rspMsg = (RspMsg) pjp.proceed();
        }
        if (methodName.equalsIgnoreCase("mod")){
            System.out.println(args[0]);
            if(args[0] instanceof  Map){
                Map map = (Map)args[0];
                if (map!=null){
                    LinkedHashMap current =  (LinkedHashMap) map.get("current");
                    LinkedHashMap before =  (LinkedHashMap) map.get("before");
                    currentDetail = ObjectToByte(current);
                    beforeDetail = ObjectToByte(before);
                }
            }
        }
        //后置开始记录日志
        if (!FinalValues.OK.equals(rspMsg.getRetCode())) {
            return rspMsg;
        }
        Map<String, Object> operate = new HashMap<>(8);
        operate.put("menuNo", declaringTypeName);
        operate.put("btnNo", methodName);
        operate.put("time", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        operate.put("no", System.currentTimeMillis() + "");
        operate.put("userNo", userNo);
        operate.put("currentDetail",currentDetail);
        operate.put("beforeDetail",beforeDetail);
        RspMsg result = logService.log(operate);
        if ("fail".equals(result.getRetCode())) {
            log.error("记录操作日志失败: " + result.getRetMsg());
        } else {
            log.info("记录操作日志: menu=[" + declaringTypeName + "], button=[" + methodName + "], userNo=[" + userNo + "]");
        }
        return rspMsg;
    }

    public void addAuditBase(HttpServletRequest request, byte[] currentDetail, String declaringTypeName, String methodName, Map<String, Object> auditTable, String no) throws Throwable {
        auditTable.put("userNo", no);
        auditTable.put("commitOrg", request.getHeader("commitOrg"));
        auditTable.put("commitRole", request.getHeader("commitRole"));
        auditTable.put("commitUser", request.getHeader("commitUser"));

        String commitNote = request.getHeader("commitNote");
        if (!StringUtils.isEmpty(commitNote)){
            //请求头不能允许中文，前端要编码，后端要解码
            commitNote=java.net.URLDecoder.decode(commitNote,"UTF-8");

            System.out.println(commitNote);
        }
        auditTable.put("commitNote", commitNote);
        //提交审批实体的信息
        auditTable.put("currentDetail", currentDetail);
        auditTable.put("menuNo", declaringTypeName);
        auditTable.put("btnNo", methodName);
        //当前时间，主键
        auditTable.put("no", DateTime.now().toString("yyyyMMddHHmmssSSS"));
        auditTable.put("operateTime", DateTime.now().toString("yyyy-MM-dd HH:mm:ss"));
        auditTable.put("commitStatus", "1");
    }

    /**
     * 对象转数组
     * @param obj
     * @return byte[]
     */
    private byte[] ObjectToByte(Object obj) {
        byte[] bytes = null;
        ByteArrayOutputStream byteArrayOutputStream = null;
        ObjectOutputStream objectOutputStream = null;
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            objectOutputStream.writeObject(obj);
            objectOutputStream.flush();
            bytes = byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (objectOutputStream != null) {
                try {
                    objectOutputStream.close();
                } catch (IOException e) {
                }
            }
            if (byteArrayOutputStream != null) {
                try {
                    byteArrayOutputStream.close();
                } catch (IOException e) {
                }
            }
        }
        return bytes;
    }

}
