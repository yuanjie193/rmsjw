package com.itdr.utils;

import com.itdr.pojo.*;
import com.itdr.pojo.VO.GoodsVO;
import com.itdr.pojo.VO.HomeVO;
import com.itdr.pojo.VO.ListVO;
import com.itdr.pojo.VO.OrderItemVO;

import java.math.BigDecimal;
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
    public static OrderItemVO getOrderItemVO(String username,OrderItem orderItem){
        OrderItemVO o = new OrderItemVO();
        o.setCname(username);
        o.setCreate_time(orderItem.getCreate_time());
        o.setCurrent_unit_price(orderItem.getCurrent_unit_price());
        o.setId(orderItem.getId());
        o.setOrder_no(orderItem.getOrder_no());
        o.setProduct_id(orderItem.getProduct_id());
        o.setUser_id(orderItem.getUser_id());
        o.setUpdate_time(orderItem.getUpdate_time());
        o.setTotal_price(orderItem.getTotal_price());
        o.setProduct_name(orderItem.getProduct_name());
        o.setQuantity(orderItem.getQuantity());
        o.setProduct_image(orderItem.getProduct_image());
         return o;
    }
    public static ListVO getListVO(Shipping shipping, Customer customer,List<OrderItem> orderItem,Order order){
        ListVO listVO = new ListVO();
        listVO.setCustomer(customer);
        listVO.setOrder(order);
        listVO.setOrderItem(orderItem);
        listVO.setShipping(shipping);
        return listVO;
    }
    public static HomeVO getHomeVO(int pending, int shipped, BigDecimal totalPrice,String goodName,int success,int out){
        HomeVO homeVO = new HomeVO();
        homeVO.setGoodName(goodName);
        homeVO.setOut(out);
        homeVO.setPending(pending);
        homeVO.setShipped(shipped);
        homeVO.setTotalPrice(totalPrice);
        homeVO.setSuccess(success);
        return homeVO;
    }
}
