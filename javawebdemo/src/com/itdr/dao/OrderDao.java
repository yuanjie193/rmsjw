package com.itdr.dao;

import com.itdr.pojo.Customer;
import com.itdr.pojo.Order;
import com.itdr.utils.C3p0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class OrderDao {
    public List<Order> selectAllOrder() {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Order> o = null;
        String sql = "select id,user_id,order_no,shipping_id,payment,payment_type,postage,status,payment_time,send_time,end_time,close_time,create_time,update_time from `order`";
        try {
            o = queryRunner.query(sql, new BeanListHandler<Order>(Order.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }

    public Order selectOneOrderByOrderNo(Long orderNo) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        Order o = null;
        String sql = "select id,user_id,order_no,shipping_id,payment,payment_type,postage,status,payment_time,send_time,end_time,close_time,create_time,update_time from `order`" +
                "where order_no=?";
        try {
            o = queryRunner.query(sql, new BeanHandler<Order>(Order.class),orderNo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }

    //获取已完成订单
  public List<Order> selectSuccessOrder() {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Order> o = null;
        String sql = "select id,user_id,order_no,shipping_id,payment,payment_type,postage,status,payment_time,send_time,end_time,close_time,create_time,update_time from `order` where status = 50";
        try {
            o = queryRunner.query(sql, new BeanListHandler<Order>(Order.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }
    //待发货订单
    public List<Order> selectwaitOrder() {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Order> o = null;
        String sql = "select id,user_id,order_no,shipping_id,payment,payment_type,postage,status,payment_time,send_time,end_time,close_time,create_time,update_time from `order` where status = 20";
        try {
            o = queryRunner.query(sql, new BeanListHandler<Order>(Order.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }
    //已发货订单
    public List<Order> sentOrder() {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Order> o = null;
        String sql = "select id,user_id,order_no,shipping_id,payment,payment_type,postage,status,payment_time,send_time,end_time,close_time,create_time,update_time from `order` where status = 40";
        try {
            o = queryRunner.query(sql, new BeanListHandler<Order>(Order.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }
}
