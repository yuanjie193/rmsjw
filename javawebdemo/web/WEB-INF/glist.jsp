<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/1/14/0014
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="errorpage.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            margin: 0;
        }
        #left{
            width: 30%;
            height: 100%;
            float: left;
            background-color: burlywood;
        }
        #right{
            width: 70%;
            float: right;
            background-color: chocolate;
        }
    </style>
</head>
<body>
<div id="left">
    <p>
        <a href="/backed/index/home">首页</a>
    </p>
    <h1>欢迎${us.username}登录</h1>
    <a href="/backed/goods/getall">获取所有商品数据</a>
</div>
<div id="right">
    <form action="/backed/goods/selectgoods" method="post">
        <input type="text" placeholder="搜索商品" name ="selectgoods">
        <input type="submit" value="搜索" onclick="togoods()">
    </form>

    <c:if test="${not empty glist.date}">
        <table>
            <tr>
                <th>序号</th>
                <th>商品名称</th>
                <th>商品图片</th>
                <th>商品价格</th>
                <th>商品描述</th>
                <th>商品折扣</th>
                <th>商品数量</th>
                <th>商品颜色</th>
                <th>商品在售</th>
                <th>建表时间</th>
                <th>更新时间</th>
            </tr>
            <c:forEach items="${glist.date}" var="g">
                <tr>
                    <td>${g.goods_id}</td>
                    <td>${g.goods_name}</td>
                    <td>${g.goods_photo}</td>
                    <td>${g.goods_price}</td>
                    <td>${g.goods_description}</td>
                    <td>${g.goods_discount}</td>
                    <td>${g.goods_number}</td>
                    <td>${g.goods_color}</td>
                    <td class="type">${g.goods_type}</td>
                    <td>${g.creat_time}</td>
                    <td>${g.update_time}</td>
                    <td>
                        <button onclick="toType(this)">下架</button>
                        <button>修改</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
         <c:if test="${not empty sg.date}">
                <table>
                    <tr>
                        <th>序号</th>
                        <th>商品名称</th>
                        <th>商品图片</th>
                        <th>商品价格</th>
                        <th>商品描述</th>
                        <th>商品折扣</th>
                        <th>商品数量</th>
                        <th>商品颜色</th>
                        <th>商品在售</th>
                        <th>建表时间</th>
                        <th>更新时间</th>
                    </tr>
                    <c:forEach items="${sg.date}" var="gs">
                        <tr>
                            <td>${gs.goods_id}</td>
                            <td>${gs.goods_name}</td>
                            <td>${gs.goods_photo}</td>
                            <td>${gs.goods_price}</td>
                            <td>${gs.goods_description}</td>
                            <td>${gs.goods_discount}</td>
                            <td>${gs.goods_number}</td>
                            <td>${gs.goods_color}</td>
                            <td>${gs.goods_type}</td>
                            <td>${gs.creat_time}</td>
                            <td>${gs.update_time}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

</div>
<%--<c:if test="${empty glist.date}">--%>
    <%--没有更多的商品--%>
<%--</c:if>--%>
</body>
<script src = "${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<%--<script src = "../js/jquery-3.3.1.js"></script>--%>
<script>
    function toType(but) {
        var a = $(but).parent().parent().children().first().text();
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
   function togoods(){


   }
</script>
</html>
