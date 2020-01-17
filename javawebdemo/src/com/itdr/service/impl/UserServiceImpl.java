package com.itdr.service.impl;


import com.itdr.common.ResponseCode;
import com.itdr.dao.UserDao;
import com.itdr.pojo.Users;
import com.itdr.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDao();
    @Override
    public ResponseCode<Users> login(String username, String password) {
        //参数非空判断
        if(username == null || username.equals("")){
            return null;
        }
        if(password == null || password.equals("")){
            return null;
        }
        Users users = userDao.selectByUsernameAndPassword(username, password);
        //如果返回值为空，说明用户不存在，也就是登录失败
        if(users == null){
            return ResponseCode.toDefeated("用户登录失败");
        }
        //成功则返回用户数据
        return ResponseCode.toSuccess(users);
    }
}
