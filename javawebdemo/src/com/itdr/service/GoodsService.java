package com.itdr.service;

import com.itdr.common.ResponseCode;
import com.itdr.pojo.Users;

public interface GoodsService {
    ResponseCode getAllGoods();

    ResponseCode toType(String id);

    ResponseCode selectGoods(String sg);

    ResponseCode toDelete(String id);

    ResponseCode addGoods(Integer uid,String goodsname, String price, String number, String color, String discount, String description, String checked);

    ResponseCode updateGoods(Integer uid, String goods_id, String goodsname, String price, String number, String color, String discount, String description, String checked);

    ResponseCode selectOneGoods(String goodsId);

    ResponseCode goodsSort(String field,String way);
}
