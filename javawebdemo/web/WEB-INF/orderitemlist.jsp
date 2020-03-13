<%--
  Created by IntelliJ IDEA.
  User: 12985
  Date: 2020/3/7
  Time: 18:57
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
    <link href="${pageContext.request.contextPath}/lib/advanced-datatable/css/demo_page.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/lib/advanced-datatable/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/advanced-datatable/css/DT_bootstrap.css" />
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
                    <a  href="${pageContext.request.contextPath}/backed/users/get_home">
                        <i class="fa fa-desktop"></i>
                        <span>首页</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a  href="javascript:;">
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
            <h3><i class="fa fa-angle-right"></i> 订单商品详情</h3>
            <div class="row mb">
                <!-- page start-->
                <div class="content-panel">
                    <div class="adv-table">
                        <c:if test="${not empty olist.date}">
                            <table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
                                <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>商品名称</th>
                                    <th class="hidden-phone">商品数量</th>
                                    <th class="hidden-phone">商品单价</th>
                                    <th class="hidden-phone">商品总价</th>
                                    <th class="hidden-phone">所属客户</th>
                                    <th class="hidden-phone">创建时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${olist.date}" var="o">
                                    <tr class="gradeA">
                                        <td><a href="${pageContext.request.contextPath}/backed/order/get_one_order?orderNo=${o.order_no}">${o.order_no}</a></td>
                                        <td>${o.product_name}</td>
                                        <td class="hidden-phone">${o.quantity}</td>
                                        <td class="center hidden-phone">${o.current_unit_price}</td>
                                        <td class="center hidden-phone">${o.total_price}</td>
                                        <td class="center hidden-phone">${o.cname}</td>
                                        <td class="center hidden-phone">${o.create_time}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
                <!-- page end-->
            </div>
            <!-- /row -->
        </section>
        <!-- /wrapper -->
    </section>

    <!--footer end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/lib/advanced-datatable/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.scrollTo.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/lib/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/advanced-datatable/js/DT_bootstrap.js"></script>
<!--common script for all pages-->
<script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
<!--script for this page-->
<script type="text/javascript">
    /* Formating function for row details */
    /*  function fnFormatDetails(oTable, nTr) {
          var aData = oTable.fnGetData(nTr);
          var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
          sOut += '<tr><td>Rendering engine:</td><td>' + aData[1] + ' ' + aData[4] + '</td></tr>';
          sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
          sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
          sOut += '</table>';

          return sOut;
      }*/

    $(document).ready(function() {
        /*
         * Insert a 'details' column to the table
         */
        var nCloneTh = document.createElement('th');
        var nCloneTd = document.createElement('td');
        // nCloneTd.innerHTML = '<img src="${pageContext.request.contextPath}/lib/advanced-datatable/images/details_open.png">';
        nCloneTd.className = "center";

        $('#hidden-table-info thead tr').each(function() {
            this.insertBefore(nCloneTh, this.childNodes[0]);
        });

        $('#hidden-table-info tbody tr').each(function() {
            this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
        });

        /*
         * Initialse DataTables, with no sorting on the 'details' column
         */
        var oTable = $('#hidden-table-info').dataTable({
            "aoColumnDefs": [{
                "bSortable": false,
                "aTargets": [0]
            }],
            "aaSorting": [
                [1, 'asc']
            ]
        });

        /* Add event listener for opening and closing details
         * Note that the indicator for showing which row is open is not controlled by DataTables,
         * rather it is done here
         */
        $('#hidden-table-info tbody td img').live('click', function() {
            var nTr = $(this).parents('tr')[0];
            if (oTable.fnIsOpen(nTr)) {
                /!* This row is already open - close it *!/
                this.src = "${pageContext.request.contextPath}/lib/advanced-datatable/media/images/details_open.png";
                oTable.fnClose(nTr);
            } else {
                /!* Open this row *!/
                this.src = "${pageContext.request.contextPath}/lib/advanced-datatable/images/details_close.png";
                oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
            }
        });
    });
</script>
</body>

</html>
