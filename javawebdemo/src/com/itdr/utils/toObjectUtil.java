package com.itdr.utils;

import com.itdr.pojo.Goods;
import com.itdr.pojo.Users;
import com.itdr.pojo.VO.GoodsVO;

import java.util.List;

public class toObjectUtil {
    public static GoodsVO getGoodsVO(String username, Goods goods){
        GoodsVO g = new GoodsVO();
        g.setUsername(username);
        g.setUpdate_time(goods.getUpdate_time());
        g.setGoods_type(goods.getGoods_type());
        g.setGoods_price(goods.getGoods_price());
        g.setGoods_photo(goods.getGoods_photo());
        g.setGoods_number(goods.getGoods_number());
        g.setGoods_name(goods.getGoods_name());
        g.setGoods_id(goods.getGoods_id());
        g.setGoods_discount(goods.getGoods_discount());
        g.setGoods_description(goods.getGoods_description());
        g.setGoods_color(goods.getGoods_color());
        g.setCreat_time(goods.getCreat_time());
        return g;
    }
}
