<%--
  Created by IntelliJ IDEA.
  User: 12985
  Date: 2020/2/25
  Time: 22:04
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
        .w{
            font-size: 24px;
            font-weight: bold;
            color:#4ECDC4;
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
                <li><a class="logout" href="${pageContext.request.contextPath}/login.jsp">Logout</a></li>
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
                <p class="centered"><a href="profile.html"><img src="${pageContext.request.contextPath}/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
                <h5 class="centered">${user.username}</h5>
                <li class="sub-menu">
                    <a class="active" href="${pageContext.request.contextPath}/backed/users/get_home">
                        <i class="fa fa-desktop"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
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
                    <a href="javascript:;">
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
    <c:if test="${not empty home && home.status eq 200}">
    <section id="main-content">
        <section class="wrapper site-min-height">
            <div class="row mt mb">
                <div class="col-lg-12">
                    <br>
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="dmbox">
                            <div class="service-icon">
                                <a class="" href="#"><i class="dm-icon fa fa-rmb fa-3x"></i></a>
                            </div>
                            <h4>昨日总收入</h4>
                            <p class="w">${home.date.totalPrice}</p>
                        </div>
                    </div>
                    <!-- end dmbox -->
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="dmbox">
                            <div class="service-icon">
                                <a class="" href="${pageContext.request.contextPath}/backed/goods/goods_number_sort"><i class="dm-icon fa fa-warning fa-3x"></i></a>
                            </div>
                            <h4>库存最少商品</h4>
                            <p class="w">${home.date.goodName}</p>
                        </div>
                    </div>
                    <!-- end dmbox -->
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="dmbox">
                            <div class="service-icon">
                                <a class="" href="${pageContext.request.contextPath}/backed/order/success_order"><i class="dm-icon fa fa-tasks fa-3x"></i></a>
                            </div>
                            <h4>已完成订单</h4>
                            <p class="w">${home.date.success}</p>
                        </div>
                    </div>
                    <!-- end dmbox -->
                </div>
                <!--  /col-lg-12 -->
            </div>
            <!-- /row -->
            <div class="row mt mb">
                <div class="col-lg-12">
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="dmbox">
                            <div class="service-icon">
                                <a class="" href="${pageContext.request.contextPath}/backed/order/success_order/wait_order"><i class="dm-icon fa fa-truck fa-3x"></i></a>
                            </div>
                            <h4>待发货商品数目</h4>
                            <p class="w">${home.date.pending}</p>
                        </div>
                    </div>
                    <!-- end dmbox -->
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="dmbox">
                            <div class="service-icon">
                                <a class="" href="${pageContext.request.contextPath}/backed/order/success_order/send_order"><i class="dm-icon fa fa-truck fa-3x"></i></a>
                            </div>
                            <h4>已发货商品</h4>
                            <p class="w">${home.date.shipped}</p>
                        </div>
                    </div>
                    <!-- end dmbox -->
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div class="dmbox">
                            <div class="service-icon">
                                <a class="" href="${pageContext.request.contextPath}/backed/order/success_order/out_order"><i class="dm-icon fa fa-truck fa-3x"></i></a>
                            </div>
                            <h4>昨日售出商品数目</h4>
                            <p class="w">${home.date.out}</p>
                        </div>
                    </div>

                    <!-- end dmbox -->
                </div>
                <!--  /col-lg-12 -->
            </div>
        </section>
        <!-- /wrapper -->
    </section>
    </c:if>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            <p>
                &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
            </p>
            <div class="credits">
                More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
            </div>
            <a href="blank.html#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.ui.touch-punch.min.js"></script>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.nicescroll.js" type="text/javascript"></script>
<!--common script for all pages-->
<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
<!--script for this page-->

</body>

</html>
