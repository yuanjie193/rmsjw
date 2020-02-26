<%--
  Created by IntelliJ IDEA.
  User: 12985
  Date: 2020/2/19
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <title>Dashio - Bootstrap Admin Template</title>

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!--external css-->
    <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet">
    <style>
        .a{
            margin-bottom: 18px;
        }

    </style>

</head>

<body>
<!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
<div id="login-page">
    <div class="container">
        <form class="form-login" action="/backed/users/login" method="post">
            <h2 class="form-login-heading">后台管理系统</h2>
            <div class="login-wrap">
                <input type="text" class="form-control" placeholder="用户名" autofocus name="username">
                <br>
                <input type="password" class="form-control" placeholder="密码" name="password">
                <label class="checkbox">
            <span class="pull-right">
             <a  href="/backed/index/register">忘记密码</a>
            </span>
                </label>
                <button class="btn btn-theme btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
                <hr>
            </div>
        </form>

    </div>
</div>
<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("${pageContext.request.contextPath}/img/login-bg.jpg", {
        speed: 500
    });
</script>
<c:if test="${not empty forget.date}">
   <script> alert(${forget.date})</script>
</c:if>
<c:if test="${not empty forget.msg}">
   <script> alert(${forget.msg})</script>
</c:if>
</body>

</html>
