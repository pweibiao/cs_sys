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
    <a class="layui-btn layui-btn-mini layui-btn-xs" lay-event="edit">编辑</a>
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
            ,url: '../Goods/table' //数据接口
            ,page: true
            ,limit:15
            ,limits:[2,5,10]
            ,cols: [[ //表头
                {field: 'id', title: '商品编号', width:120, sort: true, fixed: 'left'}
                ,{field: 'name', title: '名称',  sort: true}
                ,{field: 'inventory', title: '库存', }
                ,{field: 'price', title: '价格（元）', sort: true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
            ]]
            ,loading:false
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

        //监听
        table.on('tool(test)',function (obj) {
            var data = obj.data;
            if(obj.event == 'del'){
                layer.confirm('确定删除？',function (index) {
                    obj.del();
                    layer.close(index);
                    $.ajax({
                        url:"../Goods/dodelete",
                        type:"POST",
                        data:{ 'id' : data.id},
                        success:function (result) {
                            if (result.code == 100){
                                layer.close(index);
                            }else {
                                layer.msg("删除失败");
                            }
                        }
                    });
                });
            }else if (obj.event == 'edit'){
                layer.open({
                    type: 1,
                    title: "修改商品信息",
                    area: ['420px', '330px'],
                    content: $("#popUpdateTest"),
                    end:function () {
                        window.location.href = document.location;
                    }
                });
                layui.form.on('submit(decisionChange)', function(msg){
                    $.ajax({
                        url:'../Goods/doupdate',
                        type:'POST',
                        data:{
                            "id":data.id,
                            "name":msg.field.name,
                            "inventory":msg.field.inventory,
                            "price":msg.field.price
                        },
                        success:function (result) {
                            if(result.code==100){
                                layer.msg("添加成功");
                            }else{
                                layer.msg("修改失败", {icon: 5});
                            }
                        }
                    });
                });
            }
        });

    });
</script>
<div class="layui-row " id="popUpdateTest" style="display:none">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" method="post" action="" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-block">
                    <input type="text" name="name"  required  lay-verify="required" autocomplete="off" placeholder="请输入名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品库存</label>
                <div class="layui-input-block">
                    <input type="text" name="inventory"  required  lay-verify="required" autocomplete="off" placeholder="请输入库存" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品价格</label>
                <div class="layui-input-block">
                    <input type="text" name="price"  required  lay-verify="required" autocomplete="off" placeholder="请输入价格" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn " lay-submit lay-filter="decisionChange">确认修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
