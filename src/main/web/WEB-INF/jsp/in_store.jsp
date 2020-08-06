<%--
  Created by IntelliJ IDEA.
  User: leiyangyang
  Date: 2020/8/3
  Time: 14:56
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>


    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <script type="text/javascript"
            src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <![endif]-->
</head>
<body onload="load(page)">
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                            </th>
                            <th>入库编号</th>
                            <th>商品编号</th>
                            <th>商品名称</th>
                            <th>员工编号</th>
                            <th>入库日期</th>
                            <th>入库数量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="td">

                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <a href="#" class="num" id="firstPage">首页</a>
                            <a href="#" class="num" id="prePage">上一页</a>
                            <div style="display: inline-block" id="pageBtns"></div>
                            <a href="#" class="num" id="nextPage">下一页</a>
                            <a href="#" class="num" id="endPage">尾页</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--    修改--模态框--%>
<%--<div class="modal fade" id="update" style="top:100px " aria-labelledby="exampleModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--头部-->
            <div class="modal-header" style="background-color: silver; height: 20px;" >
            </div>
            <div class="modal-body">
                <table class="table" border="0">
                    <tr>
                        <td>入库编号</td>
                        <td><input type="text" id="inId"></td>
                    </tr>
                    <tr>
                        <td>商品编号</td>
                        <td><input type="text" id="goodsId"></td>
                    </tr>

                    <tr>
                        <td>商品名称</td>

                        <td><input type="text" id="goodsName"></td>

                    <tr>
                    <tr>
                        <td>员工编号</td>
                        <td><input type="text" id="empId"></td>
                    </tr>
                    <tr>
                        <td>入库日期</td>
                        <td><input type="date" id="inDate"></td>
                    </tr>
                    <tr>
                        <td>入库数量</td>
                        <td><input type="text" id="inNum"></td>
                    </tr>

                    <td><span style="color:red" id="info"></span></td>

                    <td colspan="2"><button type="button" class="btn btn-secondary" onclick="save()">保存</button></td>


                    </tr>
                </table>
            </div>

        </div>
    </div>
</div>--%>
<div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalTitle"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body" id="modal-body">
                <form>
                    <div class="form-group" id="showId">
                        <label for="inId" class="col-form-label">入库编号</label>
                        <input type="text" class="form-control" id="inId" readonly>
                    </div>
                    <div class="form-group">
                        <label for="goodsId" class="col-form-label">商品编号</label>
                        <input type="text" class="form-control" id="goodsId">
                    </div>
                    <div class="form-group">
                        <label for="goodsName" class="col-form-label">商品名称</label>
                        <input type="text" class="form-control" id="goodsName">
                    </div>
                    <div class="form-group">
                        <label for="empId" class="col-form-label">员工编号</label>
                        <input type="text" class="form-control" id="empId">
                    </div>
                    <div class="form-group">
                        <label for="inDate" class="col-form-label">入库日期</label>
                        <input type="date" class="form-control" id="inDate">
                    </div>
                    <div class="form-group">
                        <label for="inNum" class="col-form-label">入库数量</label>
                        <input type="text" class="form-control" id="inNum">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"  onclick="save()">保存</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>

    //页码信息
    var page = 1;
    var prePage;
    var nextPage;
    var firstPage;
    var endPage;
    var pageSize;


    function load(page) {
        $.get({
            url: "/isc/selectByEmpIdInStore.ajax",
            data:{
                page:page
            },
            success: function (data) {
                console.log(data.list);
                var html = "";
                for (var i = 0; i < data.list.length; i++) {
                    html += "<tr>" +
                        "<td>" + " <input type='checkbox' name='id' value='" + data.list[i].inId + " '  lay-skin='primary'> " + "</td>"
                        + "<td>" + data.list[i].inId + "</td>" +
                        "<td>" + data.list[i].goodsId + "</td>" +
                        "<td>" + data.list[i].goodsName + "</td>" +
                        "<td>" + data.list[i].empId + "</td>" +
                        "<td>" + data.list[i].inDate + "</td>" +
                        "<td>" + data.list[i].inNum + "</td>" +
                        "<td class='td-manage'>\n" +
                        "<a title='修改' onclick=updateInStore(this)\n" +
                        "href='javascript:;'>\n" +
                        "<i class='layui-icon layui-icon-edit'></i>\n" +
                       " </a>\n" +
                        "<a title='删除' onclick=deleteInStore(this)\n" +
                        "href='javascript:;'>\n" +
                        "<i class='layui-icon layui-icon-delete'></i>\n" +
                        " </a>\n" +
                        "</td>\n" +
                        "</tr>"
                }
                $("#td").html(html);

                page = data.nowPage;
                prePage = data.prePage;
                nextPage = data.nextPage;
                firstPage = data.firstPage;
                endPage = data.endPage;
                pageSize = data.pageSize;

                html = "";
                for (i = 1; i <= endPage; i++) {
                    html += "&nbsp;<a href='#' onclick=pageBtnClick(" + i + ") class='num' id='pageid" + i + "'>" + i + "</a>"
                }
                $("#pageBtns").html(html);

                $("[id=pageid" + page + "]").prop("style", "color: #0000FF");

            }
        })
    }

    //首页
    $("#firstPage").click(function () {

        page = firstPage;
        load(page);
    });

    //上一页
    $("#prePage").click(function () {

        page = prePage;
        load(page);
    });

    //下一页
    $("#nextPage").click(function () {

        page = nextPage;
        load(page);
    });

    //尾页
    $("#endPage").click(function () {
        page = endPage;
        load(page);
    });
    //点击页码按钮
    function pageBtnClick(pageid) {
        page = pageid;
        load(page);
    }






    function deleteInStore(obj) {
        var inId = $(obj).parent().parent().find("td").eq(1).text();
        var inNum = $(obj).parent().parent().find("td").eq(6).text();
        console.log(inNum);
        $.get({
            url: "/isc/deleteInStoreByInid.ajax",
            data: {"inId": inId, "inNum": inNum},
            datatype:"json",
            success: function (data) {
                if (data > 0) {
                    layer.msg("删除成功");
                    load();
                } else {
                    layer.msg("删除失败");
                    load();
                }
            }
        })
    }
    var storeName;
    function updateInStore(obj) {
        var inId = $(obj).parent().parent().find("td").eq(1).text();
        var goodsId = $(obj).parent().parent().find("td").eq(2).text();
        var inNum = $(obj).parent().parent().find("td").eq(6).text();
        var empId = $(obj).parent().parent().find("td").eq(4).text();
        var inDate = $(obj).parent().parent().find("td").eq(5).text();
        var goodsName = $(obj).parent().parent().find("td").eq(3).text();
        $("#update").modal("show");
        $.post({
            url: "/isc/selectAllStore.ajax",
            success: function (data) {
                console.log(data)
                var html = "";
                $("#goodsName").val(goodsName);
                $("#inId").val(inId);
                $("#goodsId").val(goodsId);
                $("#inNum").val(inNum);
                $("#empId").val(empId);
                $("#inDate").val(inDate);


            }
        })

    }

    function add() {

        $("#update").modal("show");
        $.post({
            url: "/isc/selectAllStore.ajax",
            success: function (data) {
                console.log(data)
                var html = "";
                for (var i = 0; i < data.length; i++) {
                    html += "<option id='selected' name='opt' value='" + data[i].storeName + "'>" + data[i].storeName + "</option>";
                    /*if (goodsName==data[i].goodsName){*/
                    $(".selector").find("option[value='" + storeName + "']").attr("selected", true);
                }
                $("#goodsName").html(html);
            }
        })
    }

    function save() {
        var inId = $("#inId").val();
        var goodsId = $("#goodsId").val();
        var inNum = $("#inNum").val();
        var empId = $("#empId").val();
        var inDate = $("#inDate").val();
        var goodsName = $("#goodsName").val();

        $.get({
            if(){
                url:"/isc/addInstore.ajax"
            },

            url:"/isc/updateInstore.ajax",
            datatype: "json",
            data:{
                "inId":inId,
                "goodsId":goodsId,
                "inNum":inNum,
                "empId":empId,
                "inDate":inDate,
                "goodsName":goodsName
            },
            success:function (data) {
                if(data>0){
                    layer.msg("修改成功")
                    $("#update").modal("hide");
                    load();
                }else {
                    layer.msg("修改失败");
                    $("#update").modal("hide");
                    load();
                }
            }
        })
    }


    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;




        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});

            } else {
                $(obj).attr('title', '启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    function delAll(argument) {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？' + ids.toString(), function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</html>
