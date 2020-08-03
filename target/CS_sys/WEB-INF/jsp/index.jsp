<%--
  Created by IntelliJ IDEA.
  User: pwb
  Date: 2020/4/2
  Time: 12:39 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page  contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>便民超市收银系统</title>
    <link rel="icon" type="image/png" href="favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/login.css">
    <script type="text/javascript">
        function showTime(){
            nowtime=new Date();
            year=nowtime.getFullYear();
            month=nowtime.getMonth()+1;
            date=nowtime.getDate();
            document.getElementById("mytime").innerText=year+"年"+month+"月"+date+" "+nowtime.toLocaleTimeString();
        }

        setInterval("showTime()",1000);

    </script>
</head>
<body class="layui-bg-cyan">

<div class="admin-login-block">
    <div class="admin-login-text">
        <span>便民超市收银系统</span>
    </div>
    <div class="login-font">
        <span>系统登录</span>
    </div>
    <div class="admin-login-form">
        <form id="login_form" class="layui-form" method="post" action="" lay-filter="login">
            <div class="layui-form-item">
                <div class="layui-input-block admin-login-input">
                    <input id="username" type="text" name="userName" required lay-verify="required"
                           placeholder="登录账号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block admin-login-input">
                    <input id="password" type="password" name="passWord" required lay-verify="required"
                           placeholder="登录密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block admin-login-input">
                    <button onclick="" id="loginBtn" class="layui-btn admin-login-btn" lay-submit lay-filter="login">登录</button>
                </div>
            </div>
        </form>
        <div class="admin-login-copy">
            <p>&copy; <span id="mytime"></span></p>
        </div>
    </div>
</div>

<script src="layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js"></script>
<script>

    $(function () {
        $("#loginBtn").click(function () {
            $.ajax({
                url:"./Login/dologin",
                type:"POST",
                data:$("#login_form").serialize(),
                success:function (result) {
                    if (result.code == 100){//user权限
                        window.location.href="./Login/main";
                    }else if (result.code == 101){//owner权限
                        window.location.href="./Login/ownermain";
                    }else if (result.code == 102){//admin权限
                        window.location.href="./Login/admin";
                    }
                    else {
                        layer.msg(result.extendInfo.login_error,{
                            time:6000,
                            btn:['确定']
                        });
                    }
                }

            });
        });
    });
</script>
</body>
</html>