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
            case "changepassword":
                changePassword(request,response);
                break;
            case "addmsg":
                addMsg(request,response);
                break;
            case "deleteuser":
                deleteUser(request,response);
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
    private void getMsg(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        ResponseCode<Users> msg = userService.getMsg(user);
        request.setAttribute("msg",msg);
        request.getRequestDispatcher("/WEB-INF/alist.jsp").forward(request,response);
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
    private void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String uid = request.getParameter("um");
        Integer userid = Integer.parseInt(uid);
        ResponseCode<Users> u =userService.changePassword(user,oldPassword,newPassword,userid);
        if(u.getStatus() == 200 && user.getType() == userid ){
            session.removeAttribute("user");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }else {
           getMsg(request,response);
        }
    }
    //添加管理员
    private void addMsg(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String checked1 = request.getParameter("checked1");
        String checked2 = request.getParameter("checked2");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        ResponseCode addMsg = userService.addMsg(username,password,email,checked1,checked2,user);
        request.setAttribute("addmsg",addMsg);
        request.getRequestDispatcher("/WEB-INF/getmsg.jsp").forward(request,response);
    }
    //删除管理员
    private void deleteUser(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String uid = request.getParameter("uid");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        ResponseCode delete = null;
        if(user.getType() == 1) {
             delete = userService.deleteUser(uid);
        }
        System.out.println(delete.getDate().toString());
        response.getWriter().write(delete.getDate().toString());
    }
}
