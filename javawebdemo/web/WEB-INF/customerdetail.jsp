<%--
  Created by IntelliJ IDEA.
  User: 12985
  Date: 2020/3/10
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: 12985
  Date: 2020/2/26
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
        #a{
            margin-left:74%;
            margin-right: 1%;
        }
        #ff{
            position: relative;
            top:35px;
            left: 2%;
        }
        #foot{
            height: 80px;
            width: 100%;
        }

    </style>


</head>

<body>
<section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="index.html" class="logo"><b>DASH<span>IO</span></b></a>
        <!--logo end-->
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li>
                    <a class="logout" href="${pageContext.request.contextPath}/login.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <p class="centered">
                    <a href="profile.html"><img src="${pageContext.request.contextPath}/img/ui-sam.jpg" class="img-circle" width="80"></a>
                </p>
                <h5 class="centered">${user.username}</h5>
                <li class="sub-menu">
                    <a  href="${pageContext.request.contextPath}/backed/users/get_home">
                        <i class="fa fa-desktop"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a   href="javascript:;">
                        <i class="fa fa-desktop"></i>
                        <span>商品管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/backed/goods/getall">全部商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/backed/index/addgoods">增加商品</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>管理员</span>
                    </a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/backed/users/getmsg">我的管理员</a></li>
                        <c:if test="${user.type eq 1}">
                            <li><a href="${pageContext.request.contextPath}/backed/index/addmsg">添加管理员</a></li>
                        </c:if>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>我的客户</span>
                    </a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/backed/customer/get_all_customer">所有客户</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a class="active" href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>订单管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/backed/order/get_all_order">所有订单</a></li>
                        <li><a href="${pageContext.request.contextPath}/backed/order_item/get_all_order_item">订单商品详情</a></li>
                    </ul>
                </li>

            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->

    <section id="main-content">
        <section class="wrapper">
            <!-- row -->
            <h3><i class="fa fa-angle-right"></i>客户详情</h3>
            <div class="row mt" >
                <c:if test="${ all.status eq 200 and not empty all.date}">
                <div class="col-md-12">
                    <div class="content-panel" id = "h">
                        <c:if test="${not empty all.date}">
                            <h4><i class="fa fa-angle-right"></i>  客户详情</h4>
                            <table class="table table-striped table-advance table-hover">
                                    <%--<h4><i class="fa fa-angle-right"></i>  全部商品</h4>--%>
                                <hr>
                                <thead>
                                <tr>
                                    <th >客户ID</th>
                                    <th>客户账户</th>
                                    <th>客户邮箱</th>
                                    <th>客户电话</th>
                                    <th>密保问题</th>
                                    <th>密保答案</th>
                                    <th>客户等级</th>
                                    <th>客户IP</th>
                                    <th>创建时间</th>
                                    <th>更新a时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td >${all.date.id}</td>
                                    <td>${all.date.username}</td>
                                    <td>${all.date.email}</td>
                                    <td>${all.date.phone}</td>
                                    <td>${all.date.question}</td>
                                    <td>${all.date.answer}</td>
                                    <c:if test="${all.date.role eq 0}">
                                        <td>青铜</td>
                                    </c:if>
                                    <c:if test="${all.date.role eq 1}">
                                        <td>白银</td>
                                    </c:if>
                                    <c:if test="${all.date.role eq 2}">
                                        <td>黄金</td>
                                    </c:if>
                                    <c:if test="${all.date.role eq 3}">
                                        <td>铂金</td>
                                    </c:if>
                                    <c:if test="${all.date.role eq 4}">
                                        <td>钻石</td>
                                    </c:if>
                                    <td>${all.date.ip}</td>
                                    <td >${all.date.create_time}</td>
                                    <td >${all.date.update_time}</td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        </c:if>
                    </div>
                    <!-- /content-panel -->
                </div>
                <!-- /col-md-12 -->
                <%--第二个表--%>
            </div>
            <div id="foot"></div>
        </section>
        <c:if test="${empty all.date}">
            <h3 style="margin-left: 20px">暂无详情~~</h3>
        </c:if>
    </section>

</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.nicescroll.js" type="text/javascript"></script>
<!--common script for all pages-->
<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
<!--script for this page-->
</body>

</html>

