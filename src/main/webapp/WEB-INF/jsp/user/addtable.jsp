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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/login.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js" type="text/javascript" charset="UTF-8"></script>
</head>
<body>
<form class="layui-form " action="">
    <br/><br/><br/>
    <div class="layui-form-item">
        <label class="layui-form-label">人员用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="name" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div><br/>
    <div class="layui-form-item">
        <label class="layui-form-label">初始密码</label>
        <div class="layui-input-inline">
            <input type="text" name="password" required  lay-verify="required" placeholder="请输入初始密码" autocomplete="off" class="layui-input">
        </div>
    </div><br/>
    <div class="layui-form-item">
        <label class="layui-form-label">权限</label>
        <div class="layui-input-inline">
            <select name="dept" lay-verify="required">
                <option value=""></option>
                <option value="user">员工</option>
                <option value="owner">老板</option>
                <option value="admin">管理员</option>
            </select>
        </div>
    </div><br/>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">添加</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js"></script>
<script>

    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function(data){
            $.ajax({
                url:"../User/doadd",
                type:"POST",
                contentType:"application/json;charset=UTF-8",
                dataType:"json",
                data:JSON.stringify(data.field),
                success:function (result) {
                    if (result.code == 100){
                        layer.msg("添加成功",{time:5000,btn:["确定"]});
                    }else{
                        layer.msg(result.extendInfo.login_error);
                    }
                }
            });
        });
    });


</script>
</body>
</html>
