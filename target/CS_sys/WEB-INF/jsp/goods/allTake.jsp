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
<br/><br/>
<div class="layui-form-item">
    <div class="layui-input-block">
        <button class="layui-btn" lay-submit lay-filter="formDemo" name="button_export" onclick=preview(1)>打印</button>
    </div>
</div>
<script language="JavaScript">
    function preview(oper){

        if(oper < 10) {

            bdhtml =window.document.body.innerHTML;//获取当前页的html代码

            sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域

            eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域

            prnhtml =bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html

            prnhtml = prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html

            window.document.body.innerHTML= prnhtml;

            window.print();

            window.document.body.innerHTML =bdhtml;

        } else{

            window.print();

        }

    }
</script>
<br/><br/>
<!--startprint1-->
<table id="demo" lay-filter="test"></table>
<!--endprint1-->
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,method:'post'
            ,url: '../Goods/easytable' //数据接口
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

        });

    });
</script>
</body>
</html>
