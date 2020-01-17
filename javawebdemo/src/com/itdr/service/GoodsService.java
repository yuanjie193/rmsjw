package com.itdr.service;

import com.itdr.common.ResponseCode;
import com.itdr.pojo.Users;

public interface GoodsService {
    ResponseCode getAllGoods();

    ResponseCode toType(String id);

    ResponseCode selectGoods(String sg);
}
