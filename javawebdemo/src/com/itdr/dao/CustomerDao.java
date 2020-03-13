package com.itdr.dao;

import com.itdr.pojo.Customer;
import com.itdr.pojo.Users;
import com.itdr.utils.C3p0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class CustomerDao {
    public List<Customer> selectAllCustomer() {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Customer> c = null;
        String sql = "select id,username,password,email,phone,question,answer,role,create_time,update_time,ip from customer ";
        try {
            c = queryRunner.query(sql, new BeanListHandler<Customer>(Customer.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }
    public Customer selectOneCustomer(Integer uid) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        Customer c = null;
        String sql = "select id,username,password,email,phone,question,answer,role,create_time,update_time,ip from customer where id=?" ;
        try {
            c = queryRunner.query(sql, new BeanHandler<Customer>(Customer.class),uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }
}
