package com.itdr.service;

import com.itdr.common.ResponseCode;

public interface CustomerService {
    ResponseCode getAllCustomer();

    ResponseCode getCustomerDetail(String id);
}
