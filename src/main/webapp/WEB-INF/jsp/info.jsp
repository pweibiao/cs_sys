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
</head>
<div style="text-align: center">
    <blockquote class="layui-elem-quote ">
        个人信息
    </blockquote>
    <blockquote class="layui-elem-quote ">
        账号:<span id="userName_info"></span>
    </blockquote>
    <blockquote class="layui-elem-quote ">
        权限:<span id="userDept_info"></span>
    </blockquote>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        $ = layui.jquery;

        $("#userName_info").html("${session}");
        $("#userDept_info").html("${session1}");
    });
</script>

</body>
</html>
