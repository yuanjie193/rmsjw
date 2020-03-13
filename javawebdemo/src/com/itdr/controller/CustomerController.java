package com.itdr.controller;

import com.itdr.common.ResponseCode;
import com.itdr.service.CustomerService;
import com.itdr.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/backed/customer/*")
public class CustomerController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }
        private CustomerService customerService = new CustomerServiceImpl();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String[] split = requestURI.split("/");
        switch (split[split.length-1]){
            case "get_all_customer":
                getAllCustomer(request,response);
                break;
            case "get_customer_detail":
                getCustomerDetail(request,response);
                break;
        }
    }


    private void getAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       ResponseCode all =  customerService.getAllCustomer();
       request.setAttribute("clist",all);
       request.getRequestDispatcher("/WEB-INF/getcustomer.jsp").forward(request,response);
//        System.out.println(all.getDate().toString());
    }
    private void getCustomerDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ResponseCode all =  customerService.getCustomerDetail(id);
        request.setAttribute("all",all);
        request.getRequestDispatcher("/WEB-INF/customerdetail.jsp").forward(request,response);
    }
}
