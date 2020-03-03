package com.itdr.service.impl;


import com.itdr.common.ResponseCode;
import com.itdr.dao.UserDao;
import com.itdr.pojo.Users;
import com.itdr.service.UserService;

import java.util.ArrayList;
import java.util.List;

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

    @Override
    public ResponseCode<Users> changePassword(Users user,String oldPassword, String newPassword,Integer uid) {
        //参数非空判断
        if(oldPassword == null || oldPassword.equals("")){
            return ResponseCode.toDefeated("旧密码不能为空");
        }
        if(newPassword == null || newPassword.equals("")){
            return ResponseCode.toDefeated("新密码不能为空");
        }
        if(uid == null || uid.equals("")){
            return ResponseCode.toDefeated("不能为空");
        }
        //更新密码
           int  i = userDao.updateNewPasswordByOldPassword(oldPassword,newPassword,uid,user.getUsername());

        if(i<=0){
            return ResponseCode.toSuccess(i);
        }
        return ResponseCode.toSuccess(i);
    }
    @Override
    public ResponseCode<Users> getMsg(Users users) {
        List<Users> u =new ArrayList<Users>();
        if(users.getType() == 1){
             u =  userDao.getMsg();
        }
        if(users.getType() == 0){
            u = userDao.getMsg2(users.getType(),users.getUid());
        }
        if(u.isEmpty()){
            return ResponseCode.toDefeated("暂无管理员");
        }
        return ResponseCode.toSuccess(u);
    }

    @Override
    public ResponseCode addMsg(String username, String password, String email, String checked1, String checked2,Users users) {
        //参数非空判断
        if(username == null || username.equals("")){
            return ResponseCode.toDefeated("用户名不能为空");
        }
        if(password == null || password.equals("")){
            return ResponseCode.toDefeated("密码不能为空");
        }
        if(email == null || email.equals("")){
            return ResponseCode.toDefeated("邮箱不能为空");
        }
        if(checked1 == null && checked2 == null){
            return ResponseCode.toDefeated("错误");
        }
        int a = 0;
        if(checked1 == null && checked2.equals("on")){
            a =0;
        }
        if(checked2 == null && checked1.equals("on")){
            a =1;
        }
       int insert =  userDao.insertUser(username,password,email,a,users.getUsername());
       if(insert <=0){
           return ResponseCode.toDefeated("添加失败");
       }
       return ResponseCode.toSuccess(insert);
    }

    @Override
    public ResponseCode deleteUser(String uid) {
        //参数非空判断
        if(uid == null || uid.equals("")){
            return ResponseCode.toDefeated("用户名不能为空");
        }
        int u = Integer.parseInt(uid);
        int a = userDao.deleteUserByUid(u);
        if(a <=0){
            return ResponseCode.toDefeated("删除失败");
        }
        return ResponseCode.toSuccess(a);

    }
}
