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
            <h3><i class="fa fa-angle-right"></i>具体详情</h3>
            <div class="row mt" >
             <c:if test="${ all.status eq 200 and not empty all.date}">
                <div class="col-md-12">
                    <div class="content-panel" id = "h">
                       <%-- <form  id = "ff" class="form-inline" role="form" action="${pageContext.request.contextPath}/backed/goods/goodssort">
                            <select name="field" class="form-control" >
                                <option value="goods_price" >商品价格</option>
                                <option value="goods_number">商品库存</option>
                            </select>
                            <select name="way" class="form-control" >
                                <option value="asc" >从低到高</option>
                                <option value="desc">从高到低</option>
                            </select>
                            <input type="submit" class="btn btn-theme" value="搜 索"></input>
                        </form>
                        <form class="form-inline" role="form" action="${pageContext.request.contextPath}/backed/goods/selectgoods"  >
                            <div class="form-group" id="a">
                                <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                <input type="text" class="form-control" id="exampleInputEmail2" placeholder="商品名称/描述/颜色" name="selectgoods">
                            </div>
                            <input type="submit" class="btn btn-theme" value="搜 索"></input>
                        </form>--%>
                            <c:if test="${not empty all.date.customer}">
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
                                    <td >${all.date.customer.id}</td>
                                    <td>${all.date.customer.username}</td>
                                    <td>${all.date.customer.email}</td>
                                    <td>${all.date.customer.phone}</td>
                                    <td>${all.date.customer.question}</td>
                                    <td>${all.date.customer.answer}</td>
                                    <c:if test="${all.date.customer.role eq 0}">
                                        <td>青铜</td>
                                    </c:if>
                                    <c:if test="${all.date.customer.role eq 1}">
                                        <td>白银</td>
                                    </c:if>
                                    <c:if test="${all.date.customer.role eq 2}">
                                        <td>黄金</td>
                                    </c:if>
                                    <c:if test="${all.date.customer.role eq 3}">
                                        <td>铂金</td>
                                    </c:if>
                                    <c:if test="${all.date.customer.role eq 4}">
                                        <td>钻石</td>
                                    </c:if>
                                    <td>${all.date.customer.ip}</td>
                                    <td >${all.date.customer.create_time}</td>
                                    <td >${all.date.customer.update_time}</td>
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
                <c:if test="${not empty all.date.order}">
                <div class="col-md-12 mt">
                    <div class="content-panel">
                            <h4><i class="fa fa-angle-right"></i>  客户订单</h4>
                            <table class="table table-striped table-advance table-hover">
                                    <%--<h4><i class="fa fa-angle-right"></i>  全部商品</h4>--%>
                                <hr>
                                <thead>
                                <tr>
                                    <th >订单编号</th>
                                    <th>实际付款金额</th>
                                    <th>支付类型</th>
                                    <th>运费</th>
                                    <th>订单状态</th>
                                    <th>支付时间</th>
                                    <th>发货时间</th>
                                    <th>交易完成时间</th>
                                    <th>交易关闭时间</th>
                                    <th>创建时间</th>
                                    <th>更新时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td >${all.date.order.order_no}</td>
                                    <td>${all.date.order.payment}</td>
                                    <td>${all.date.order.payment_type}</td>
                                    <td>${all.date.order.postage}</td>
                                    <c:if test="${ all.date.order.status eq 0}">
                                        <td class="center hidden-phone">已取消</td>
                                    </c:if>
                                    <c:if test="${ all.date.order.status eq 10}">
                                        <td class="center hidden-phone">未付款</td>
                                    </c:if>
                                    <c:if test="${ all.date.order.status eq 20}">
                                        <td class="center hidden-phone">已付款</td>
                                    </c:if>
                                    <c:if test="${ all.date.order.status eq 40}">
                                        <td class="center hidden-phone">已发货</td>
                                    </c:if>
                                    <c:if test="${ all.date.order.status eq 50}">
                                        <td class="center hidden-phone">交易成功</td>
                                    </c:if>
                                    <c:if test="${ all.date.order.status eq 60}">
                                        <td class="center hidden-phone">交易关闭</td>
                                    </c:if>
                                    <td>${all.date.order.payment_time}</td>
                                    <td>${all.date.order.send_time}</td>
                                    <td>${all.date.order.end_time}</td>
                                    <td>${all.date.order.close_time}</td>
                                    <td>${all.date.order.create_time}</td>
                                    <td>${all.date.order.update_time}</td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
                <%--第三个表--%>
                <c:if test="${not empty all.date.orderItem}">
                <div class="col-md-12 mt">
                    <div class="content-panel">
                            <h4><i class="fa fa-angle-right"></i>  客户订单详情</h4>
                            <table class="table table-striped table-advance table-hover">
                                    <%--<h4><i class="fa fa-angle-right"></i>  全部商品</h4>--%>
                                <hr>
                                <thead>
                                <tr>
                                    <th>商品ID</th>
                                    <th>用户ID</th>
                                    <th>订单编号</th>
                                    <th>商品名称</th>
                                    <th>商品图片</th>
                                    <th>商品单价</th>
                                    <th>商品数量</th>
                                    <th>商品总价</th>
                                    <th>创建时间</th>
                                    <th>更新时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${all.date.orderItem}" var="g">
                                <tr>
                                    <td >${g.product_id}</td>
                                    <td >${g.user_id}</td>
                                    <td >${g.order_no}</td>
                                    <td>${g.product_name}</td>
                                    <td>${g.product_image}</td>
                                    <td>${g.current_unit_price}</td>
                                    <td>${g.quantity}</td>
                                    <td>${g.total_price}</td>
                                    <td>${g.create_time}</td>
                                    <td>${g.update_time}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
                <%--地址表--%>
               <c:if test="${not empty all.date.shipping}">
                <div class="col-md-12 mt">
                    <div class="content-panel">
                            <h4><i class="fa fa-angle-right"></i>  客户地址</h4>
                            <table class="table table-striped table-advance table-hover">
                                    <%--<h4><i class="fa fa-angle-right"></i>  全部商品</h4>--%>
                                <hr>
                                <thead>
                                <tr>
                                    <th>用户ID</th>
                                    <th>收货姓名</th>
                                    <th>收货固定电话</th>
                                    <th>收货移动电话</th>
                                    <th>省份</th>
                                    <th>城市</th>
                                    <th>区/县</th>
                                    <th>详细地址</th>
                                    <th>邮编</th>
                                    <th>创建时间</th>
                                    <th>更新时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td >${all.date.shipping.user_id}</td>
                                    <td>${all.date.shipping.receiver_name}</td>
                                    <td>${all.date.shipping.receiver_phone}</td>
                                    <td>${all.date.shipping.receiver_mobile}</td>
                                    <td>${all.date.shipping.receiver_province}</td>
                                    <td>${all.date.shipping.receiver_city}</td>
                                    <td>${all.date.shipping.receiver_district}</td>
                                    <td>${all.date.shipping.receiver_address}</td>
                                    <td>${all.date.shipping.receiver_zip}</td>
                                    <td>${all.date.shipping.create_time}</td>
                                    <td>${all.date.shipping.update_time}</td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>

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
