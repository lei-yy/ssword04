<%--
  Created by IntelliJ IDEA.
  User: leiyangyang
  Date: 2020/8/4
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="goodsId" class="layui-form-label">
                    <span class="x-red">*</span>商品编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="goodsId" name="goodsId" required="" lay-verify="" autocomplete="off"
                           class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span></div>
            </div>
            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    <span class="x-red">*</span>商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="name" required="" lay-verify="nikename" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="typeId" class="layui-form-label">
                    <span class="x-red">*</span>商品类型编号</label>
                <div class="layui-input-inline">
                    <select name="typeId" id="typeId">

                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux"></div>

            </div>
            <div class="layui-form-item">
                <label for="producerId" class="layui-form-label">
                    <span class="x-red">*</span>生产商编号</label>
                <div class="layui-input-inline">
                    <select name="producerId" id="producerId">

                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="cost" class="layui-form-label">
                    <span class="x-red">*</span>进价</label>
                <div class="layui-input-inline">
                    <input type="text" id="cost" name="cost" required="" lay-verify="repass" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="storeId" class="layui-form-label">
                    <span class="x-red">*</span>库存编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="storeId" name="storeId" required="" lay-verify="repass" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="produceDate" class="layui-form-label">
                    <span class="x-red">*</span>生产日期</label>
                <div class="layui-input-inline">
                    <input type="date" id="produceDate" name="produceDate" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="expireDate" class="layui-form-label">
                    <span class="x-red">*</span>过期时间</label>
                <div class="layui-input-inline">
                    <input type="date" id="expireDate" name="expireDate" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="gNum" class="layui-form-label">
                    <span class="x-red">*</span>当前批次库存</label>
                <div class="layui-input-inline">
                    <input type="text" id="gNum" name="gNum" required="" lay-verify="repass" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="state" class="layui-form-label">
                    <span class="x-red">*</span>状态</label>
                <div class="layui-input-inline">
                    <input type="text" id="state" name="state" required="" lay-verify="repass" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">完成</button>
            </div>
            <br>
            <br>
            <br>
        </form>
    </div>
</div>
<script>
    var data = eval('(' + parent.store + ')');
    console.log(data.ProducerOpt)
    console.log(data.TypeOpt)
    $("#typeId").html(data.TypeOpt);
    $("#producerId").html(data.ProducerOpt);
    $("#name").val(data.storeName);
    $("#storeId").val(data.storeId);
    $("#gNum").val(data.num);
    layui.use(['form', 'layer'],
        function () {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;


            //监听提交
            form.on('submit(add)',
                function (data) {
                    console.log(data.field);
                    $.get({
                        url: "/sc/addInGoods.ajax",
                        data: data.field
                    })


                    //发异步，把数据提交给php
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                    /*layer.alert("增加成功", {
                            icon: 6
                        },
                        function() {
                            // 获得frame索引
                        });*/

                    return false;
                });

        });</script>
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>
