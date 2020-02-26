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
        <div class="nav notify-row" id="top_menu">

        </div>
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
                    <a href="javascript:;">
                        <i class="fa fa-desktop"></i>
                        <span>商品管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/backed/goods/getall">全部商品</a></li>
                        <li><a href="buttons.html">增加商品</a></li>
                        <li><a href="panels.html">Panels</a></li>
                        <li><a href="font_awesome.html">Font Awesome</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>Components</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="grids.html">Grids</a>
                        </li>
                        <li>
                            <a href="calendar.html">Calendar</a>
                        </li>
                        <li>
                            <a href="gallery.html">Gallery</a>
                        </li>
                        <li>
                            <a href="todo_list.html">Todo List</a>
                        </li>
                        <li>
                            <a href="dropzone.html">Dropzone File Upload</a>
                        </li>
                        <li>
                            <a href="inline_editor.html">Inline Editor</a>
                        </li>
                        <li>
                            <a href="file_upload.html">Multiple File Upload</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>Extra Pages</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="blank.html">Blank Page</a>
                        </li>
                        <li>
                            <a href="login.html">Login</a>
                        </li>
                        <li>
                            <a href="lock_screen.html">Lock Screen</a>
                        </li>
                        <li>
                            <a href="profile.html">Profile</a>
                        </li>
                        <li>
                            <a href="invoice.html">Invoice</a>
                        </li>
                        <li>
                            <a href="pricing_table.html">Pricing Table</a>
                        </li>
                        <li>
                            <a href="faq.html">FAQ</a>
                        </li>
                        <li>
                            <a href="404.html">404 Error</a>
                        </li>
                        <li>
                            <a href="500.html">500 Error</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>Forms</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="form_component.html">Form Components</a>
                        </li>
                        <li>
                            <a href="advanced_form_components.html">Advanced Components</a>
                        </li>
                        <li>
                            <a href="form_validation.html">Form Validation</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a class="active" href="javascript:;">
                        <i class="fa fa-th"></i>
                        <span>Data Tables</span>
                    </a>
                    <ul class="sub">
                        <li class="active">
                            <a href="basic_table.html">Basic Table</a>
                        </li>
                        <li>
                            <a href="responsive_table.html">Responsive Table</a>
                        </li>
                        <li>
                            <a href="advanced_table.html">Advanced Table</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="inbox.html">
                        <i class="fa fa-envelope"></i>
                        <span>Mail </span>
                        <span class="label label-theme pull-right mail-info">2</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>Charts</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="morris.html">Morris</a>
                        </li>
                        <li>
                            <a href="chartjs.html">Chartjs</a>
                        </li>
                        <li>
                            <a href="flot_chart.html">Flot Charts</a>
                        </li>
                        <li>
                            <a href="xchart.html">xChart</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-comments-o"></i>
                        <span>Chat Room</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="lobby.html">Lobby</a>
                        </li>
                        <li>
                            <a href="chat_room.html"> Chat Room</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="google_maps.html">
                        <i class="fa fa-map-marker"></i>
                        <span>Google Maps </span>
                    </a>
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
                    <div class="content-panel">
                <c:if test="${not empty glist.date}">
                        <table class="table table-striped table-advance table-hover">
                            <h4><i class="fa fa-angle-right"></i>  全部商品</h4>
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
                                <td>
                                    <button onclick="toType2(this)" class="btn btn-success btn-xs"><i class="fa fa-sort-up"></i></button>
                                    <button onclick="toType(this)" class="btn btn-primary btn-xs"><i class="fa fa-sort-desc"></i></button>
                                    <button onclick="todelete(this)" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></a></button>
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
            <!-- /row -->
        </section>
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
    function toType(but) {
        var a = $(but).parent().parent().children().first().text();
        $.get(
            "/backed/goods/totype",
            {goods_id:a},
            function (date) {
                alert(date)
                if(date>0){
                    $(but).parent().parent().children().first().nextAll(".type").text(1);
                }
            }
        )
    }
    //上架
    function toType2(but) {
        var a = $(but).parent().parent().children().first().text();
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
</script>
</body>

</html>
