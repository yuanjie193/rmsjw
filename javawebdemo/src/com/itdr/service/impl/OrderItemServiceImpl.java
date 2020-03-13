package com.itdr.service.impl;

import com.itdr.common.ResponseCode;
import com.itdr.dao.CustomerDao;
import com.itdr.dao.OrderItemDao;
import com.itdr.dao.UserDao;
import com.itdr.pojo.Customer;
import com.itdr.pojo.OrderItem;
import com.itdr.pojo.Users;
import com.itdr.pojo.VO.OrderItemVO;
import com.itdr.service.OrderItemService;
import com.itdr.utils.toObjectUtil;

import java.util.ArrayList;
import java.util.List;

public class OrderItemServiceImpl implements OrderItemService {
    private OrderItemDao orderItemDao = new OrderItemDao();
    private CustomerDao customerDao = new CustomerDao();
    @Override
    public ResponseCode getAllOrderItem() {
      List<OrderItem> orderItemList =  orderItemDao.selectAllOrderItem();
        if(orderItemList.isEmpty()){
            return ResponseCode.toDefeated("暂无订单商品详情");
        }
        List<OrderItemVO> orderItemVOList = new ArrayList<OrderItemVO>();
        for (OrderItem orderItem : orderItemList) {
            Customer c = customerDao.selectOneCustomer(orderItem.getUser_id());
            System.out.println(c);
            if(c==null){
                return ResponseCode.toDefeated("没有对应客户");
            }
            OrderItemVO orderItemVO = toObjectUtil.getOrderItemVO(c.getUsername(), orderItem);
            orderItemVOList.add(orderItemVO);
        }
        if(orderItemVOList.isEmpty()){
            return ResponseCode.toDefeated("暂无订单商品详情");
        }
        return ResponseCode.toSuccess(orderItemVOList);
    }
}
