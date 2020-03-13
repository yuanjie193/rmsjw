package com.itdr.service;

import com.itdr.common.ResponseCode;

public interface OrderService {
    ResponseCode getAllOrder();

    ResponseCode getoneOrder(String orderNo);

    ResponseCode getSuccessOrder();

    ResponseCode getwaitOrder();

    ResponseCode getsendOrder();

    ResponseCode getoutOrder();
}
