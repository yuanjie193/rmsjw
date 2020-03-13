package com.itdr.dao;

import com.itdr.pojo.Order;
import com.itdr.pojo.OrderItem;
import com.itdr.utils.C3p0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class OrderItemDao {
    public List<OrderItem> selectAllOrderItem() {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<OrderItem> o = null;
        String sql = "select id,user_id,order_no,product_id,product_name,product_image,current_unit_price,quantity,total_price,create_time,update_time from `order_item`";
        try {
            o = queryRunner.query(sql, new BeanListHandler<OrderItem>(OrderItem.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }

    public List<OrderItem> selectOrderItemByOrderNo(Long order) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<OrderItem> o = null;
        String sql = "select id,user_id,order_no,product_id,product_name,product_image,current_unit_price,quantity,total_price,create_time,update_time from `order_item` where order_no =?";
        try {
            o = queryRunner.query(sql, new BeanListHandler<OrderItem>(OrderItem.class),order);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }
}
