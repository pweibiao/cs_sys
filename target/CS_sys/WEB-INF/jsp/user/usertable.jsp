<%--
  Created by IntelliJ IDEA.
  User: pwb
  Date: 2020/4/8
  Time: 9:38 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>table模块</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js"></script>
<script>
    layui.use(['table','form','layer'], function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,method:'post'
            ,url: '../User/table' //数据接口
            ,page: true
            ,limit:15
            ,limits:[2,5,10]
            ,cols: [[ //表头
                {field: 'id', title: '人员编号', width:120, sort: true, fixed: 'left'}
                ,{field: 'name', title: '名称',  sort: true}
                ,{field: 'dept', title: '权限', sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,parseDate:function (res) {
                console.log(res);
                return{
                    "code":res.code,
                    "msg":res.msg,
                    "count":res.data.total,
                    data:res.data
                };
            },
            request:{
                pageName:'page'
                ,limitName:'size'
            },

        });

        table.on('tool(test)',function (obj) {
            var data = obj.data;
            if (obj.event == 'del') {
                layer.confirm('确定删除？', function (index) {
                    obj.del();
                    layer.close(index);
                    $.ajax({
                        url: "../User/dodelete",
                        type: "POST",
                        data: {'id': data.id},
                        success: function (result) {
                            if (result.code == 100) {
                                layer.close(index);
                            } else {
                                layer.msg("删除失败");
                            }
                        }
                    });
                });
            }
        });

    });
</script>
</body>
</html>
