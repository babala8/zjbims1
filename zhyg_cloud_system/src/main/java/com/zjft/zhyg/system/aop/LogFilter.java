package com.zjft.zhyg.system.aop;

import org.slf4j.MDC;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "logFilter", urlPatterns = "/*")
public class LogFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String userNo = ((HttpServletRequest)request).getHeader("userNo");
        MDC.put("requestIp", request.getRemoteAddr() + ":" + userNo);
        chain.doFilter(request, response);
        MDC.clear();
    }
}