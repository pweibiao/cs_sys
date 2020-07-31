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
            <button id="addBtn" class="layui-btn" lay-submit lay-filter="formDemo">创建订单</button>
            <button id="insertBtn" class="layui-btn" lay-submit lay-filter="formDemo">添加订单项目</button>
        </div>
    </div>
<br/><h3>您的订单记录</h3>
<table id="demo" lay-filter="demo"></table>
<br/><h3>订单项目详情</h3>
<table id="distable" lay-filter="distable"></table>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/js/jquery-1.8.3.js"></script>
<script>
    layui.use(['table','form','layer'], function(){
        var table = layui.table;
        var userName = "${session}";
        //第一个实例
        table.render({
            elem: '#demo'

            ,method:'post'
            ,url: '../Order/userTable?username='+userName //数据接口
            ,page: true
            ,limit:15
            ,limits:[4,7,15]
            ,cols: [[ //表头
                {field: 'id', title: '订单编号', width:120, sort: true, fixed: 'left'}
                ,{field: 'orderTime', title: '订单日期',  sort: true}
                ,{field: 'total', title: '订单总价（元）' }
                ,{field: 'username', title: '操作人员', sort: true}
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
            }

        });
        table.on('row(demo)',function (obj) {
            var data = obj.data;

            table.render({
                elem: '#distable'
                ,method:'post'
                ,url: '../OrderItem/table?id='+data.id //数据接口
                ,page: false
                ,cols: [[ //表头
                    {field: 'goodsName', title: '商品名称', sort: true}
                    ,{field: 'quantity', title: '商品数量',  sort: true}
                    ,{field: 'total', title: '价格（元）' }

                ]]
                ,parseDate:function (res) {
                    console.log(res);
                    return{
                        "code":res.code,
                        "msg":res.msg,
                        "count":res.count,
                        data:res.data
                    };
                },
                request:{
                    pageName:'page'
                    ,limitName:'size'
                },

            });



        });

        $("#addBtn").click(function () {
            $.ajax({
                url:"../Order/Add"
                ,data:{
                    "userName":userName
                }
                ,success:function (result) {
                    layer.msg("创建成功！订单编号为"+result.extendInfo.addSuccess , {
                        time:6000,
                        btn:['确定']
                    },function () {
                        window.location.href = document.location;
                    });
                }
            });
        });

        $("#insertBtn").click(function () {
            layer.open({
                type: 1,
                title: "订单详情添加",
                area: ['420px', '330px'],
                content: $("#insertFrom"),
                end:function () {
                    window.location.href = document.location;
                }
            });
            layui.form.on('submit(decisionAdd)',function (msg) {
                $.ajax({
                    url:"../OrderItem/save"
                    ,type:"POST"
                    ,contentType:"application/json;charset=UTF-8"
                    ,dataType:"json"
                    ,data:JSON.stringify(msg.field)
                    ,success:function (result) {
                        if (result.code == 100){
                            layer.msg("添加成功");
                        }else{
                            layer.msg(result.extendInfo.login_error);
                        }
                    }
                });
            });
        });
    });
</script>
    <div class="layui-row " id="insertFrom" style="display:none">
        <div class="layui-col-md10">
            <form class="layui-form layui-from-pane" method="post" action="" style="margin-top:20px" >
                <div class="layui-form-item">
                    <label class="layui-form-label">订单编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="orderId"  required  lay-verify="required" autocomplete="off" placeholder="请输入要添加的具体订单编号" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="goodsId"  required  lay-verify="required" autocomplete="off" placeholder="请输入商品编号" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">商品数量</label>
                    <div class="layui-input-block">
                        <input type="text" name="quantity"  required  lay-verify="required" autocomplete="off" placeholder="请输入商品数量" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item" style="margin-top:40px">
                    <div class="layui-input-block">
                        <button class="layui-btn " lay-submit lay-filter="decisionAdd">确认添加</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
