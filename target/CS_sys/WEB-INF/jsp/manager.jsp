<%--
  Created by IntelliJ IDEA.
  User: pwb
  Date: 2020/4/2
  Time: 7:55 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page  contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>便民超市收银系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="UTF-8"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js">
        $(document).ready(function () {
            $("dd>a").click(function (e) {
                e.preventDefault();
                $("#iframeMain").attr("src",$(this).attr("href"));
            });
        });
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-bg-cyan">
        <div class="layui-logo ">便民超市收银系统</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <span id="LoginName"></span>
            </li>
            <li class="layui-nav-item"><a href="../">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-cyan" >
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree layui-bg-orange"  lay-shrink="" lay-filter="test">
                <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
                <li class="layui-nav-item ">
                    <a href="javascript:;">交易订单</a>
                    <dl class="layui-nav-child">
                        <dd id="order_info"><a href="javascript:;">订单信息</a></dd>
                        <dd id="order_create"><a href="javascript:;">订单创建</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="javascript:;">商品</a>
                    <dl class="layui-nav-child">
                        <dd id="goods_info"><a href="javascript:;">商品信息</a></dd>
                        <dd id="goods_add"><a href="javascript:;">商品添加</a></dd>
                        <dd id="goods_delete"><a href="javascript:;">商品管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="javascript:;">财务</a>
                    <dl class="layui-nav-child">
                        <dd id="order_all"><a href="javascript:;">交易订单报表</a></dd>
                        <dd id="goods_all"><a href="javascript:;">商品信息报表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="javascript:;">系统设置</a>
                    <dl class="layui-nav-child">
                        <dd id="user_info"><a href="javascript:;">个人信息</a></dd>
                        <dd id="user_save"><a href="javascript:;">安全管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="javascript:;">人员管理</a>
                    <dl class="layui-nav-child">
                        <dd id="csuser_info"><a href="javascript:;">人员信息</a></dd>
                        <dd id="csuser_add"><a href="javascript:;">人员添加</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <iframe id="iframeMain" src="" frameborder="0" style="border:#d2d2d2 8px solid;" height="100%" width="100%"></iframe>
    </div>
    <div class="layui-footer">
        © 欢迎使用本系统，祝您使用愉快！
    </div>

</div>

<script>
    layui.use(['laypage','element','form','layer','jquery'], function(){

        $("#LoginName").html("${session}");

        var element = layui.element;
        //执行一个laypage实例
        laypage.render({
            elem:'test1'//ID without #
            ,count:50 //数据总数，从服务端得到
            ,limit:3//每页显示条数
        });
    });

    $("#goods_info").click(function () {
        $("#iframeMain").attr("src","../Goods/Retable");
    });
    $("#goods_delete").click(function () {
        $("#iframeMain").attr("src","../Goods/deletetable");
    });
    $("#goods_add").click(function () {
        $("#iframeMain").attr("src","../Goods/addtable");
    });
    $("#order_info").click(function () {
        $("#iframeMain").attr("src","../OrderItem/Retable");
    });
    $("#order_create").click(function () {
        $("#iframeMain").attr("src","../OrderItem/Addtable");
    });
    $("#order_all").click(function () {
        $("#iframeMain").attr("src","../OrderItem/allTake");
    });
    $("#goods_all").click(function () {
        $("#iframeMain").attr("src","../Goods/allTake");
    });
    $("#user_info").click(function () {
        $("#iframeMain").attr("src","../Login/info");
    });
    $("#user_save").click(function () {
        $("#iframeMain").attr("src","../Login/save");
    });
    $("#csuser_info").click(function () {
        $("#iframeMain").attr("src","../User/usertable");
    });
    $("#csuser_add").click(function () {
        $("#iframeMain").attr("src","../User/addtable")
    });

</script>
</body>
</html>
