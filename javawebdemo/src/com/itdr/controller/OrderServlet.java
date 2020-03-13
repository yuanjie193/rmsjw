package com.itdr.controller;

import com.itdr.common.ResponseCode;
import com.itdr.service.OrderService;
import com.itdr.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/backed/order/*")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    private OrderService orderService = new OrderServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String[] split = requestURI.split("/");
        switch (split[split.length-1]){
            case "get_all_order":
                getAllOrder(request,response);
                break;
            case "get_one_order":
                getoneOrder(request,response);
                break;
            case "success_order":
                successOrder(request,response);
                break;
            case "wait_order":
                waitOrder(request,response);
                break;
            case "send_order":
                sendOrder(request,response);
                break;
            case "out_order":
                outOrder(request,response);
                break;
        }
    }

    private void getAllOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResponseCode all =  orderService.getAllOrder();
        System.out.println(all.getDate());
        request.setAttribute("olist",all);
        request.getRequestDispatcher("/WEB-INF/orderlist.jsp").forward(request,response);
    }
    //获取详细信息
    private void getoneOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNo = request.getParameter("orderNo");
        ResponseCode all = orderService.getoneOrder(orderNo);
        request.setAttribute("all",all);
        request.getRequestDispatcher("/WEB-INF/all.jsp").forward(request,response);
    }
    //已完成订单
    private void successOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResponseCode all = orderService.getSuccessOrder();
        request.setAttribute("olist",all);
        request.getRequestDispatcher("/WEB-INF/orderlist.jsp").forward(request,response);
    }
    //待发货
    private void waitOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResponseCode all = orderService.getwaitOrder();
        request.setAttribute("olist",all);
        request.getRequestDispatcher("/WEB-INF/orderlist.jsp").forward(request,response);
    }
    //已发货
    private void sendOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResponseCode all = orderService.getsendOrder();
        request.setAttribute("olist",all);
        request.getRequestDispatcher("/WEB-INF/orderlist.jsp").forward(request,response);
    }
    //昨日售出商品
    private void outOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResponseCode all = orderService.getoutOrder();
        request.setAttribute("olist",all);
        request.getRequestDispatcher("/WEB-INF/orderlist.jsp").forward(request,response);
    }
}
