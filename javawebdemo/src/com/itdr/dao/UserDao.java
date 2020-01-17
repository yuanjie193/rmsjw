package com.itdr.dao;

import com.itdr.pojo.Goods;
import com.itdr.pojo.Users;
import com.itdr.utils.C3p0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDao {
    public Users selectByUsernameAndPassword(String username,String password){
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        Users u = null;
        String sql = "select uid,username,password,create_time," +
                "update_time,user_level,type from user where username=? and password=? ";
        try {
            u = queryRunner.query(sql, new BeanHandler<Users>(Users.class),username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }
}
