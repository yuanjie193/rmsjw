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
                break;
            case "selectgoods":
                selectGoods(request,response);
                break;
            case "deletegoods":
                deleteGoods(request,response);
                break;
            case "addgoods":
                addGoods(request,response);
                break;
            case "updategoods":
                updateGoods(request,response);
                break;
            case "selectonegoods":
                selectOneGoods(request,response);
                break;
            case "goodssort":
                goodsSort(request,response);
                break;
        }

    }

    //获取所有商品
    private void getAllGoods(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        ResponseCode allGoods = goodsService.getAllGoods();
        request.setAttribute("glist",allGoods);
        request.getRequestDispatcher("/WEB-INF/glist2.jsp").forward(request,response);
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
        request.setAttribute("glist",selectgoods);
        request.getRequestDispatcher("/WEB-INF/glist2.jsp").forward(request,response);
    }
    //删除商品
    private void deleteGoods(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("goods_id");
        ResponseCode delete = goodsService.toDelete(id);
        response.getWriter().write(delete.getDate().toString());

    }
    //增加商品
    private void addGoods(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String goodsname = request.getParameter("goodsname");
        String price = request.getParameter("price");
        String number = request.getParameter("number");
        String color = request.getParameter("color");
        String discount = request.getParameter("discount");
        String description = request.getParameter("description");
        String checked = request.getParameter("checked");
        HttpSession session = request.getSession();
        Users user =(Users) session.getAttribute("user");
        ResponseCode addGoods = goodsService.addGoods(user.getUid(),goodsname,price,number,color,discount,description,checked);
        getAllGoods(request,response);
    }
    //更新商品
    private void updateGoods(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        String goodsname = request.getParameter("goodsname");
        String goods_id = request.getParameter("goods_id");
        System.out.println(goods_id);
        String price = request.getParameter("price");
        String number = request.getParameter("number");
        String color = request.getParameter("color");
        String discount = request.getParameter("discount");
        String description = request.getParameter("description");
        String checked = request.getParameter("checked");
        HttpSession session = request.getSession();
        Users user =(Users) session.getAttribute("user");
        ResponseCode addGoods = goodsService.updateGoods(user.getUid(),goods_id,goodsname,price,number,color,discount,description,checked);
        getAllGoods(request,response);
    }
    //获取当前商品
    private void selectOneGoods(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String goodsId = request.getParameter("goods_id");
        System.out.println(goodsId);
        ResponseCode g = goodsService.selectOneGoods(goodsId);
        System.out.println(g.getDate());
        request.setAttribute("g",g.getDate());
        request.getRequestDispatcher("/WEB-INF/updategoods.jsp").forward(request,response);
    }
    //对商品价格或商品库存进行排序
    private void goodsSort(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String field = request.getParameter("field");
        String way = request.getParameter("way");
        System.out.println(field);
        System.out.println(way);
        ResponseCode g = goodsService.goodsSort(field,way);
        request.setAttribute("glist",g);
        request.getRequestDispatcher("/WEB-INF/glist2.jsp").forward(request,response);
    }
}
