package com.itdr.configs;

import com.itdr.pojo.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "FullFilter",value = "/backed/*")
public class FullFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        //乱码处理
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");

        //管理员权限校验
//        request.getServletContext();
        String requestURI = ((HttpServletRequest) request).getRequestURI();
        String[] split = requestURI.split("/");
        //登录页面直接放行
        if("login".equals(split[split.length-1])){
            chain.doFilter(request, response);
        }else {
            //其它请求斗西游验证管理员权限以及是否登录，定位到一个页面
            HttpSession session = ((HttpServletRequest) request).getSession();
            Users us =(Users) session.getAttribute("us");
            if(us == null || us.getType() != 1){
                request.getRequestDispatcher("/WEB-INF/noaccess.jsp").forward(request,response);
            }else {
                chain.doFilter(request, response);
            }

        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
