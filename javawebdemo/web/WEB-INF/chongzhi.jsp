<%--
  Created by IntelliJ IDEA.
  User: 12985
  Date: 2020/2/25
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-tasks"></i>
                        <span class="badge bg-theme">4</span>
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">You have 4 pending tasks</p>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Dashio Admin Panel</div>
                                    <div class="percent">40%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Complete (success)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Database Update</div>
                                    <div class="percent">60%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Product Development</div>
                                    <div class="percent">80%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Payments Sent</div>
                                    <div class="percent">70%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                        <span class="sr-only">70% Complete (Important)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="external">
                            <a href="#">See All Tasks</a>
                        </li>
                    </ul>
                </li>
                <!-- settings end -->
                <!-- inbox dropdown start-->
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-theme">5</span>
                    </a>
                    <ul class="dropdown-menu extended inbox">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">You have 5 new messages</p>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="img/ui-zac.jpg"></span>
                                <span class="subject">
                  <span class="from">Zac Snider</span>
                  <span class="time">Just now</span>
                  </span>
                                <span class="message">
                  Hi mate, how is everything?
                  </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="img/ui-divya.jpg"></span>
                                <span class="subject">
                  <span class="from">Divya Manian</span>
                  <span class="time">40 mins.</span>
                  </span>
                                <span class="message">
                  Hi, I need your help with this.
                  </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="img/ui-danro.jpg"></span>
                                <span class="subject">
                  <span class="from">Dan Rogers</span>
                  <span class="time">2 hrs.</span>
                  </span>
                                <span class="message">
                  Love your new Dashboard.
                  </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="img/ui-sherman.jpg"></span>
                                <span class="subject">
                  <span class="from">Dj Sherman</span>
                  <span class="time">4 hrs.</span>
                  </span>
                                <span class="message">
                  Please, answer asap.
                  </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">See all messages</a>
                        </li>
                    </ul>
                </li>
                <!-- inbox dropdown end -->
                <!-- notification dropdown start-->
                <li id="header_notification_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-bell-o"></i>
                        <span class="badge bg-warning">7</span>
                    </a>
                    <ul class="dropdown-menu extended notification">
                        <div class="notify-arrow notify-arrow-yellow"></div>
                        <li>
                            <p class="yellow">You have 7 new notifications</p>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                Server Overloaded.
                                <span class="small italic">4 mins.</span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="label label-warning"><i class="fa fa-bell"></i></span>
                                Memory #2 Not Responding.
                                <span class="small italic">30 mins.</span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                                Disk Space Reached 85%.
                                <span class="small italic">2 hrs.</span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="label label-success"><i class="fa fa-plus"></i></span>
                                New User Registered.
                                <span class="small italic">3 hrs.</span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">See all notifications</a>
                        </li>
                    </ul>
                </li>
                <!-- notification dropdown end -->
            </ul>
            <!--  notification end -->
        </div>
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
                    <a href="javascript:;" class="active">
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
        <section class="wrapper site-min-height">
                <div id="login-page">
                    <div class="container">
                        <form class="form-login" action="${pageContext.request.contextPath}/backed/users/changepassword">
                            <h2 class="form-login-heading">重置密码</h2>
                            <div class="login-wrap">
                                <input type="hidden" value="${uid}" name="um">
                                旧密码：<input  type="text" class="form-control" placeholder="请输入旧密码" autofocus name="oldPassword">
                                <br>
                                新密码：<input  type="password" class="form-control" placeholder="请输入新密码" name="newPassword">
                                <br>
                                <label class="checkbox"></label>
                                <input   class="btn btn-theme btn-block"  type="submit" value="重  置"> </input>
                                <hr>
                            </div>
                        </form>
                    </div>
                </div>
        </section>
        <!-- /wrapper -->
    </section>

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
