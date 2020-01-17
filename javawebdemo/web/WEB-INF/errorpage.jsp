<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/15/0015
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>系统出错啦~~ </title>
    <style>
        body{
            margin: 0;
        }
        #left{
            width: 30%;
            height: 100%;
            float: left;
            background-color: burlywood;
        }
        #right{
            width: 70%;
            float: right;
            background-color: chocolate;
        }
    </style>
</head>
<body>
<div id="left">
    <p>
        <a href="/backed/index/home">首页</a>
    </p>
    <h1>欢迎${us.username}登录</h1>
    <a href="/backed/goods/getall">获取所有商品数据</a>
</div>
<div id="right">
<h1>系统出错啦！请联系管理员</h1>
</div>
</body>
</html>
