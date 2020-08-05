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
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <![endif]--></head>

<body>

<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="storeId" class="layui-form-label">
                    <span class="x-red">*</span>库存编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="storeId" name="storeId" required="" lay-verify="" autocomplete="off" class="layui-input"></div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span></div></div>
            <div class="layui-form-item">
                <label for="storeName" class="layui-form-label">
                    <span class="x-red">*</span>商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="storeName" name="storeName" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="num" class="layui-form-label">
                    <span class="x-red">*</span>入库数量</label>
                <div class="layui-input-inline">
                    <input type="text" id="num" name="num" required="" lay-verify="repass" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="uNum" class="layui-form-label">
                    <span class="x-red">*</span>库存上限</label>
                <div class="layui-input-inline">
                    <input type="text" id="uNum" name="uNum" required="" lay-verify="repass" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="dNum" class="layui-form-label">
                    <span class="x-red">*</span>库存下限</label>
                <div class="layui-input-inline">
                    <input type="text" id="dNum" name="dNum" required="" lay-verify="repass" autocomplete="off" class="layui-input"></div>
            </div>

            <div class="layui-form-item">
                <label  class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add"  lay-submit="">下一步</button></div>

        </form>
    </div>
</div>
<script>


    var info = eval('(' + parent.store + ')');
    $("#storeId").val(info.storeId);
    $("#storeName").val(info.storeName);
    $("#uNum").val(info.uNum);
    $("#dNum").val(info.dNum);



    layui.use(['form', 'layer'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        /*form.verify({
            nikename: function(value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function(value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });*/

        //监听提交
        form.on('submit(add)',
            function(data) {


                //发异步，把数据提交给php
                var index;
                index = parent.layer.getFrameIndex(window.name);

                layer.alert("增加成功", {
                        icon: 6
                    },
                    function() {

                        // 获得frame索引
                        //关闭当前frame
                        parent.location.reload();
                        parent.layer.close(index);
                        $.get({
                            url:"/sc/addInStore.ajax",
                            data:data.field
                        })
                    });
                store = JSON.stringify({
                    TypeOpt: info.TypeOpt,
                    ProducerOpt:info.ProducerOpt,
                    storeId:info.storeId,
                    storeName:info.storeName,
                    num:$("#num").val()
                })
                xadmin.open('添加商品信息','/sc/addGoods.do',1100,650);



                return false;
            });

    });</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>
