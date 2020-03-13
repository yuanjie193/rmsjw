package com.itdr.controller;

import com.itdr.common.ResponseCode;
import com.itdr.service.OrderItemService;
import com.itdr.service.OrderService;
import com.itdr.service.impl.OrderItemServiceImpl;
import com.itdr.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/backed/order_item/*")
public class OrderItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    private OrderItemService orderItemService = new OrderItemServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String[] split = requestURI.split("/");
        switch (split[split.length-1]){
            case "get_all_order_item":
                getAllOrderItem(request,response);
                break;
        }
    }
    private void getAllOrderItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResponseCode all =  orderItemService.getAllOrderItem();
        System.out.println(all.getDate());
        request.setAttribute("olist",all);
        request.getRequestDispatcher("/WEB-INF/orderitemlist.jsp").forward(request,response);
    }
}
