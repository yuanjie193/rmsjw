package com.itdr.service.impl;

import com.itdr.common.ResponseCode;
import com.itdr.dao.CustomerDao;
import com.itdr.dao.OrderDao;
import com.itdr.dao.OrderItemDao;
import com.itdr.dao.ShippingDao;
import com.itdr.pojo.Customer;
import com.itdr.pojo.Order;
import com.itdr.pojo.OrderItem;
import com.itdr.pojo.Shipping;
import com.itdr.pojo.VO.ListVO;
import com.itdr.service.OrderService;
import com.itdr.utils.toObjectUtil;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao = new OrderDao();
    private OrderItemDao orderItemDao = new OrderItemDao();
    private CustomerDao customerDao = new CustomerDao();
    private ShippingDao shippingDao = new ShippingDao();
    @Override
    public ResponseCode getAllOrder() {
        List<Order> orderList = orderDao.selectAllOrder();
        if(orderList.isEmpty()){
            return ResponseCode.toDefeated("暂无订单");
        }
        return ResponseCode.toSuccess(orderList);
    }

    @Override
    public ResponseCode getoneOrder(String orderNo) {
        //通过订单号查询订单
        if(orderNo == null || "".equals(orderNo)){
            return ResponseCode.toDefeated("查询有误！");
        }
        Long order = Long.parseLong(orderNo);
        //查询订单
        Order o = orderDao.selectOneOrderByOrderNo(order);
        //查询用户详情
        Customer customer = customerDao.selectOneCustomer(o.getUser_id());
        //查询订单详情
        List<OrderItem> orderItemList = orderItemDao.selectOrderItemByOrderNo(order);
        //查询订单地址
        System.out.println(o.getShipping_id());
        Shipping shipping = shippingDao.selectShipping(o.getShipping_id());
        //封装ListVO
        ListVO listVO = toObjectUtil.getListVO(shipping, customer, orderItemList, o);
        if(listVO == null){
            return ResponseCode.toDefeated("错误！");
        }
        return ResponseCode.toSuccess(listVO);
    }

    //已完成订单
    @Override
    public ResponseCode getSuccessOrder() {
       List<Order> orderList =  orderDao.selectSuccessOrder();
       if(orderList.isEmpty()){
           return ResponseCode.toDefeated("暂无完成订单");
       }
       return ResponseCode.toSuccess(orderList);
    }
    //代发货订单

    @Override
    public ResponseCode getwaitOrder() {
        List<Order> orderList =  orderDao.selectwaitOrder();
        if(orderList.isEmpty()){
            return ResponseCode.toDefeated("暂无代发货订单");
        }
        return ResponseCode.toSuccess(orderList);
    }

    @Override
    public ResponseCode getsendOrder() {
        List<Order> orderList =  orderDao.sentOrder();
        if(orderList.isEmpty()){
            return ResponseCode.toDefeated("暂无代发货订单");
        }
        return ResponseCode.toSuccess(orderList);
    }
    //获取昨日售出订单
    @Override
    public ResponseCode getoutOrder() {
        List<Order> orderList = orderDao.selectAllOrder();
        Calendar c1 =Calendar.getInstance();
        //获取当前天数
        Calendar c2 = Calendar.getInstance();
        List<Order> orderListNew = new ArrayList<Order>();
        for (Order order : orderList) {
            Date create_time = order.getCreate_time();
            if(create_time != null){
                c2.setTime(create_time);
                if(c2.get(Calendar.YEAR) == c1.get(Calendar.YEAR) && (c2.get(Calendar.MONTH)+1) == (c1.get(Calendar.MONTH)+1) &&c1.get(Calendar.DAY_OF_MONTH) -c2.get(Calendar.DAY_OF_MONTH)==1){
                    orderListNew.add(order);
                }
            }
        }
        if(orderListNew.isEmpty()){
            return ResponseCode.toDefeated("暂无数据~");
        }
        return ResponseCode.toSuccess(orderListNew);
    }
}
