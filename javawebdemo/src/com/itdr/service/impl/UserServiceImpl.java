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

    @Override
    public ResponseCode<Users> forgetPassword(String username, String email,String newpassword) {
        //参数非空判断
        if(username == null || username.equals("")){
            return ResponseCode.toDefeated("用户名不能为空");
        }
        if(email == null || email.equals("")){
            return ResponseCode.toDefeated("邮箱不能为空");
        }
        //更新密码
        int i = userDao.updateNewPasswordByUsernameAndEmail(username,email,newpassword);
        if(i<=0){
            return ResponseCode.toDefeated("密码更新失败!!");
        }
        return ResponseCode.toSuccess("密码修改成功！");
    }
}
