<%--
  Created by IntelliJ IDEA.
  User: 12985
  Date: 2020/2/28
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            border-radius: 20px;
            padding-top: 20px;
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
                    <a href="${pageContext.request.contextPath}/backed/users/get_home">
                        <i class="fa fa-desktop"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a class="active"  href="javascript:;">
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
    <section id="main-content">
        <section class="wrapper">
            <h3><i class="fa fa-angle-right"></i> 添加商品</h3>
            <!-- BASIC FORM VALIDATION -->
            <div class="row mt">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <div class="form-panel" id="a">
                        <form role="form" class="form-horizontal style-form" action="${pageContext.request.contextPath}/backed/goods/addgoods">
                            <div class="form-group has-success">
                                <label class="col-lg-2 control-label">商品名称：</label>
                                <div class="col-lg-9">
                                    <input type="text" placeholder="请输入商品名称" id="f-name" class="form-control" name="goodsname">
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="form-group has-success">
                                <label class="col-lg-2 control-label">商品价格：</label>
                                <div class="col-lg-9">
                                    <input type="text" placeholder="请输入商品价格" id="l-name" class="form-control" name="price" >
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="form-group has-success">
                                <label class="col-lg-2 control-label">商品库存：</label>
                                <div class="col-lg-9">
                                    <input type="number" placeholder="请输入商品库存" id="f-name" class="form-control" name="number">
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="form-group has-success">
                                <label class="col-lg-2 control-label">商品颜色：</label>
                                <div class="col-lg-3">
                                    <input type="text" placeholder="请输入商品颜色" id="f-name" class="form-control" name="color" >
                                    <p class="help-block"></p>
                                </div>
                                <label class="col-lg-2 control-label">商品折扣：</label>
                                <div class="col-lg-3">
                                    <input type="text" placeholder="请输入商品折扣" id="f-name" class="form-control" name="discount" >
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="form-group has-success">
                                <label class="col-lg-2 control-label">商品描述：</label>
                                <div class="col-lg-9">
                                    <input type="text" placeholder="请输入商品描述" id="f-name" class="form-control" name="description">
                                    <p class="help-block"></p>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="newsletter" class="control-label col-lg-2 col-sm-3">是否上架：</label>
                                <div class="col-lg-10 col-sm-9">
                                    <input type="checkbox" style="width: 20px" class="checkbox form-control" id="newsletter" name="checked" checked="checked"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <input class="btn btn-theme" type="reset" value="重新输入"></input>
                                    <input class="btn btn-theme" type="submit" value="添加商品"></input>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /form-panel -->
                </div>
                <!-- /col-lg-12 -->
            </div>

        </section>
        <!-- /wrapper -->
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
<script src="${pageContext.request.contextPath}/lib/form-validation-script.js"></script>

</body>

</html>

