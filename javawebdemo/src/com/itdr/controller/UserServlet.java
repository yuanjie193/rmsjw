package com.itdr.controller;

import com.itdr.common.ResponseCode;
import com.itdr.pojo.Users;
import com.itdr.service.UserService;
import com.itdr.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "UserServlet",value ="/backed/users/*")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
            System.out.println("请求进来了");
    }
    private UserService userService = new UserServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String[] split = requestURI.split("/");
       /* if("login".equals(split[split.length-1])){
            login(request,response);
        }
        if("getmsg".equals(split[split.length-1])){
            getMsg(request,response);
        }*/
        switch (split[split.length-1]){
            case "login":
                login(request,response);
                break;
            case "getmsg":
                getMsg(request,response);
                break;
            case "forget_password":
                forgetPassword(request,response);
                break;
        }

    }



    //管理员登陆
    private void login(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ResponseCode<Users> login = userService.login(username, password);
        //用户登录成功，保存用户信息
        HttpSession session = request.getSession();
        Users date = login.getDate();
        session.setAttribute("user",date);
//        request.setAttribute("user",login);
        request.getRequestDispatcher("/WEB-INF/home2.jsp").forward(request,response);
    }
    //获取管理员信息
    private void getMsg(HttpServletRequest request,HttpServletResponse response){
        System.out.println("获取管理员信息");
    }
    //修改管理员信息
    //禁用管理员
    //忘记密码
    private void forgetPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        ResponseCode<Users> u =userService.forgetPassword(username,email,newPassword);
        request.setAttribute("forget",u);
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }
}
