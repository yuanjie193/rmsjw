package com.itdr.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/backed/index/*")
public class ConfigServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String[] split = requestURI.split("/");
        switch (split[split.length-1]){
            case "home":
                home(request,response);
                break;
            case "register":
                register(request,response);
                break;
            case "addgoods":
                addGoods(request,response);
                break;
            case "reset":
                reset(request,response);
                break;
            case "addmsg":
                addMsg(request,response);
                break;
        }
    }
    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request,response);
    }
    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request,response);
    }
    private void addGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/addgoods.jsp").forward(request,response);
    }
    private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a = request.getParameter("a");
        System.out.println(a);
        request.setAttribute("uid",a);
        request.getRequestDispatcher("/WEB-INF/chongzhi.jsp").forward(request,response);
    }
    private void addMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/addmsg.jsp").forward(request,response);
    }
}
