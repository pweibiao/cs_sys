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
<form  class="layui-form " action="">
    <br/><br/><br/>
    <h2>重置密码</h2>
    <div class="layui-form-item">
        <label class="layui-form-label">旧密码</label>
        <div class="layui-input-inline">
            <input id="goods_name" type="text" name="oldPassword" required  lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
        </div>
    </div><br/>
    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input id="goods_inventory" type="text" name="password" required  lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
        </div>
    </div><br/>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-inline">
            <input id="goods_price" type="text" name="repassword" required  lay-verify="required" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
        </div>
    </div><br/>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即修改</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        $ = layui.jquery;
        layui.form.on('submit(formDemo)', function(data){
            if (data.password != data.repassword){
                layui.layer.alert("密码不匹配，重新输入",{time:20000});
            }else {
                $.ajax({
                    url: "../Login/change",
                    type: "POST",
                    data: {
                        "oldPassword": data.field.oldPassword,
                        "password": data.field.password
                    },
                    success: function (result) {
                        if (result.code == 100) {
                            layui.layer.alert("修改成功！");
                        } else {
                            layui.layer.alert(result.extendInfo.login_error, {time: 20000});
                        }
                    }
                });
            }
        });
    });
</script>

</body>
</html>
