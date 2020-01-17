<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/6/0006
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/backed/users/login" method="post" >
    <input type="text" placeholder="用户名" name="username">
    <input type="password" placeholder="密码" name="password">
    <input type="submit" placeholder="登录">
  </form>
  </body>
</html>
