package com.itdr.service.impl;

import com.itdr.common.ResponseCode;
import com.itdr.dao.CustomerDao;
import com.itdr.pojo.Customer;
import com.itdr.service.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    private CustomerDao customerDao = new CustomerDao();
    @Override
    public ResponseCode getAllCustomer() {
        List<Customer> customerList = customerDao.selectAllCustomer();
        if(customerList.isEmpty()){
            return ResponseCode.toDefeated("暂无客户");
        }
        return ResponseCode.toSuccess(customerList);
    }

    @Override
    public ResponseCode getCustomerDetail(String id) {
        if(id == null || "".equals(id)){
            return ResponseCode.toDefeated("id不能为空");
        }
        Integer a = Integer.parseInt(id);
        Customer customer = customerDao.selectOneCustomer(a);
        if(customer == null){
            return ResponseCode.toDefeated("暂无详情");
        }
        return ResponseCode.toSuccess(customer);
    }

}
