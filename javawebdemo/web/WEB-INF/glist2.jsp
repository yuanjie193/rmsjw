<%--
  Created by IntelliJ IDEA.
  User: 12985
  Date: 2020/2/26
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <!-- row -->
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel" id = "h">
                        <h4><i class="fa fa-angle-right"></i> 全部商品</h4>
                        <form  id = "ff" class="form-inline" role="form" action="${pageContext.request.contextPath}/backed/goods/goodssort">
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
                        </form>

                        <c:if test="${not empty glist.date}">
                            <table class="table table-striped table-advance table-hover">
                                    <%--<h4><i class="fa fa-angle-right"></i>  全部商品</h4>--%>
                                <hr>
                                <thead>
                                <tr>
                                    <th style="display:none">商品序号</th>
                                    <th>商品名称</th>
                                    <th>商品价格</th>
                                    <th>商品描述</th>
                                    <th>商品库存</th>
                                    <th>商品颜色</th>
                                    <th>商品折扣</th>
                                    <th>在售/下架</th>
                                    <th>最后操作人</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${glist.date}" var="g">
                                <tr>
                                    <td style="display:none">${g.goods_id}</td>
                                    <td>${g.goods_name}</td>
                                    <td>${g.goods_price}</td>
                                    <td>${g.goods_description}</td>
                                    <td>${g.goods_number}</td>
                                    <td>${g.goods_color}</td>
                                    <td>${g.goods_discount}</td>
                                    <td class="type">${g.goods_type}</td>
                                    <td >${g.username}</td>
                                    <td>
                                        <button onclick="toType2(this)" class="btn btn-success btn-xs"><i class="fa fa-sort-up"></i></button>
                                        <button onclick="toType(this)" class="btn btn-primary btn-xs"><i class="fa fa-sort-desc"></i></button>
                                        <c:if test="${user.type eq 1}">
                                        <button onclick="todelete(this)" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                                        </c:if>
                                            <%--<button  onclick="toupdate(this)" id = "button" class="btn btn-danger btn-xs"><i class="fa fa-edit "></i></button>--%>
                                        <button   id = "button" class="btn btn-danger btn-xs"><a href="${pageContext.request.contextPath}/backed/goods/selectonegoods?goods_id=${g.goods_id}"><i class="fa fa-edit "></i></a></button>
                                    </td>
                                </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                        </c:if>
                    </div>
                    <!-- /content-panel -->
                </div>
                <!-- /col-md-12 -->
            </div>

        </section>
        <c:if test="${empty glist.date}">
            <h3 style="margin-left: 20px">没有更多的商品~</h3>
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
<script>
   /* $("#button").click(function(){
        $("#b").toggle();
    });
    $("#button").click(function(){
        $("#h").toggle();
    });*/

    function toType(but) {
        var a = $(but).parent().parent().children().first().text();
        var b = $(but).parent().parent().children().first().nextAll(".type").text();
        if(b==1){
            alert("商品已下架！")
        }
        $.get(
            "/backed/goods/totype",
            {goods_id:a},
            function (date) {
                if(date>0){
                    $(but).parent().parent().children().first().nextAll(".type").text(1);
                }
            }
        )
    }
    //上架
    function toType2(but) {
        var a = $(but).parent().parent().children().first().text();
        var b = $(but).parent().parent().children().first().nextAll(".type").text();
        if(b==0){
            alert("商品已上架！")
        }
        $.get(
            "/backed/goods/totype",
            {goods_id:a},
            function (date) {
                if(date>0){
                    $(but).parent().parent().children().first().nextAll(".type").text(0);
                }
            }
        )
    }
    function todelete(but) {
        var a = $(but).parent().parent().children().first().text();
        alert(a);
        $.get(
            "/backed/goods/deletegoods",
            {goods_id:a},
            function (date) {
                if(date>0){
                    alert(date),
                    $(but).parent().parent().remove();
                }
            }
        )
    }
    /*function toupdate(but) {
        var a = $(but).parent().parent().children().first().text();
        $.get(
            "/backed/goods/selectonegoods",
            {goods_id:a},
            function (date) {
                if(date ) {
                    alert(有参数)
                }
            }
        )
    }*/
</script>
</body>

</html>
