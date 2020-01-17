package com.itdr.controller;

import com.itdr.common.ResponseCode;
import com.itdr.pojo.Users;
import com.itdr.service.GoodsService;
import com.itdr.service.UserService;
import com.itdr.service.impl.GoodsServiceImpl;
import com.itdr.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "GoodsServlet",value = "/backed/goods/*")
public class GoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }
    private GoodsService goodsService = new GoodsServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String[] split = requestURI.split("/");
        switch (split[split.length-1]){
            case "getall":
                getAllGoods(request,response);
                break;
            case "totype":
                toType(request,response);
            case "selectgoods":
                selectGoods(request,response);
        }

    }

    //获取所有商品
    private void getAllGoods(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        ResponseCode allGoods = goodsService.getAllGoods();
        request.setAttribute("glist",allGoods);
        request.getRequestDispatcher("/WEB-INF/glist.jsp").forward(request,response);
    }
    private void toType(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("goods_id");
        ResponseCode allGoods = goodsService.toType(id);
        response.getWriter().write(allGoods.getDate().toString());
    }
    //搜索商品
    private void selectGoods(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String sg = request.getParameter("selectgoods");
        System.out.println(sg);
        ResponseCode selectgoods =  goodsService.selectGoods(sg);
        request.setAttribute("sg",selectgoods);
        request.getRequestDispatcher("/WEB-INF/glist.jsp").forward(request,response);
    }
}
