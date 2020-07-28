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

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,method:'post'
            ,url: '../Goods/table' //数据接口
            ,page: true
            ,limit:15
            ,limits:[2,5,10]
            ,cols: [[ //表头
                {field: 'id', title: '商品编号', width:120, sort: true, fixed: 'left'}
                ,{field: 'name', title: '名称',  sort: true}
                ,{field: 'inventory', title: '库存', }
                ,{field: 'price', title: '价格（元）', sort: true}
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

    });
</script>
</body>
</html>
