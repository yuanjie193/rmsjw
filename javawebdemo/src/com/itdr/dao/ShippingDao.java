package com.itdr.dao;

import com.itdr.pojo.OrderItem;
import com.itdr.pojo.Shipping;
import com.itdr.utils.C3p0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ShippingDao {

    public Shipping selectShipping(Integer shipping_id) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        Shipping s = null;
        String sql = "select id,user_id,receiver_name,receiver_phone,receiver_mobile,receiver_province,receiver_city,receiver_district,receiver_address,receiver_zip,create_time,update_time from `shipping` where id =?";
        try {
            s = queryRunner.query(sql, new BeanHandler<Shipping>(Shipping.class),shipping_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return s;
    }
}
