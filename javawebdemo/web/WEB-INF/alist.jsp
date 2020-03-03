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
        #login-page{
            display: none;
            position: absolute;
            top:60px;
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
                <h5 id="type" style="display: none">${user.type}</h5>
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
                    <a href="javascript:;" class="active">
                        <i class="fa fa-cogs"></i>
                        <span>管理员</span>
                    </a>
                    <ul class="sub" >
                        <li><a href="${pageContext.request.contextPath}/backed/users/getmsg">我的管理员</a></li>
                        <c:if test="${user.type eq 1}">
                            <li><a href="${pageContext.request.contextPath}/backed/index/addmsg">添加管理员</a></li>
                        </c:if>
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
                        <h4><i class="fa fa-angle-right"></i> 管理员</h4>

                        <c:if test="${not empty msg.date}">
                            <table class="table table-striped table-advance table-hover">
                                    <%--<h4><i class="fa fa-angle-right"></i>  全部商品</h4>--%>
                                <hr>
                                <thead>
                                <tr>
                                    <th style="display:none">管理员序号</th>
                                    <th>账号</th>
                                    <th>邮箱</th>
                                    <th>等级</th>
                                    <th>最后操作人</th>
                                    <th>创建时间</th>
                                    <th>更新时间</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${msg.date}" var="m">
                                <tr>
                                    <td  style="display:none">${m.uid}</td>
                                    <td>${m.username}</td>
                                    <td>${m.email}</td>
                                    <td>${m.user_level}</td>
                                    <td>${m.operator}</td>
                                    <td>${m.create_time}</td>
                                    <td >${m.update_time}</td>
                                    <td>
                                        <c:if test="${user.type eq 1}">
                                            <button onclick="todelete(this)" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                                        </c:if>
                                        <button class="btn btn-danger btn-xs "><a href="${pageContext.request.contextPath}/backed/index/reset?a=${m.uid}"><i class="fa fa-edit "></i></a></button>
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
        <%--//修改密码--%>
        <c:if test="${empty msg.date}">
            <h3 style="margin-left: 20px">没有更多的管理员~</h3>
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
    /* $(".update").click(function(){
         $("#login-page").show();
     });*/
    function todelete(but) {
        var a = $(but).parent().parent().children().first().text();
        alert(a);
        $.get(
            "/backed/users/deleteuser",
            {uid:a},
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
