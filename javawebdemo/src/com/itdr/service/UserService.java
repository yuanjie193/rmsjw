package com.itdr.service;

import com.itdr.common.ResponseCode;
import com.itdr.pojo.Users;

public interface UserService {
    ResponseCode<Users> login(String username,String password);

    ResponseCode<Users> forgetPassword(String username, String email,String newpassword);

    ResponseCode<Users> getMsg(Users users);

    ResponseCode<Users> changePassword(Users user,String oldPassword, String newPassword,Integer uid);

    ResponseCode addMsg(String username, String password, String email, String checked1, String checked2,Users users);

    ResponseCode deleteUser(String uid);

    ResponseCode selectInformation();

}
