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

    //根据用户名和邮箱更新密码
    public int updateNewPasswordByUsernameAndEmail(String username, String email, String newpassword) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        int i = 0;
        String sql = "update user set password =? where username=? and email=?";
        try {
            i = queryRunner.update(sql,newpassword,username,email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public Users selectByUserId(Integer uid) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        Users u = null;
        String sql = "select uid,username,password,create_time," +
                "update_time,user_level,type from user where uid = ? ";
        try {
            u = queryRunner.query(sql, new BeanHandler<Users>(Users.class),uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    public List<Users> getMsg() {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Users> u = null;
        String sql = "select uid,username,password,create_time," +
                "update_time,user_level,operator,email,type from user";
        try {
            u = queryRunner.query(sql, new BeanListHandler<Users>(Users.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }
    public List<Users> getMsg2(int type,int id) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        List<Users> u = null;
        String sql = "select uid,username,password,create_time," +
                "update_time,user_level,operator,email,type from user where type=? and uid = ?";
        try {
            u = queryRunner.query(sql, new BeanListHandler<Users>(Users.class),type,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    //    重置密码
    public int updateNewPasswordByOldPassword(String oldPassword, String newPassword,Integer id,String uname) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        int i = 0;
        String sql = "update user set password =?,operator=? where password=? and uid = ?";
        try {
            i = queryRunner.update(sql,newPassword,uname,oldPassword,id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
    public int insertUser(String username, String password, String email, int a,String operator) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        int i = 0;
        String level = null;
        if(a == 1){
            level="超级管理员";
        }
        if(a == 0){
            level="普通管理员";
        }
        String sql = "insert into user values(null,?,?,?,?,now(),now(),?,?)";
        try {
            i = queryRunner.update(sql,username,password,level,a,email,operator);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    public int deleteUserByUid(int u) {
        QueryRunner queryRunner =new QueryRunner(C3p0Util.getCom());
        int i = 0;
        String sql = "delete from user where uid=?";
        try {
            i = queryRunner.update(sql,u);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }
}
