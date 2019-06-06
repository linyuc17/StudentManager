<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/" %>
<%--
  Created by IntelliJ IDEA.
  User: Linyc
  Date: 2019/3/20
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息管理系统</title>
    <link type="text/css" href="/css/main.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/1.0.8/iconfont.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <script>
        function check() {
            var sName = $("#sName").val();
            var courseName = $("#courseName").val();
            var selectionStatus = $("#selectionStatus").val();
            if(sName=="" && courseName=="" && selectionStatus==""){
                alert("输入不能为空...");
                return false;
            }
        }
    </script>
</head>
<body>

<div class="app-title">
    <div>
        <a>&nbsp;</a>
        <h1><i class="fa fa-th-list">Selection Table</i></h1>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="tile">
            <div class="tile-body">
                <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                    <%--
                        操作栏
                    --%>
                    <div class="row">
                        <div class="col-sm-12 col-md-6"><div class="dataTables_length" id="sampleTable_length">
                            <label>Show
                                <select onchange="window.location=this.value;" name="select"
                                        aria-controls="sampleTable" class="form-control form-control-sm">
                                    <option value="#" >${rows}</option>
                                    <option value="/selection/list?rows=5">5</option>
                                    <option value="/selection/list?rows=10">10</option>
                                    <option value="/selection/list?rows=20">20</option>
                                    <option value="/selection/list?rows=50">50</option>
                                </select> entries&nbsp;</label>
                            <div class="btn-group">
                                <a href="/selection/add" class="btn btn-primary">
                                    <i class="Hui-iconfont">&#xe600;</i></a>
                                <a href="/selection/list" class="btn btn-primary">
                                    <i class="Hui-iconfont">&#xe68f;</i></a>
                            </div>
                        </div></div>
                        <div class="col-sm-12 col-md-6"><div id="sampleTable_filter" class="dataTables_filter">
                        <label>
                            <form action="${pageContext.request.contextPath}/selection/list" method="post" onsubmit="return check()">

                                <input type="text" id="sName" class="form-control form-control-sm" name="sName"  value="${sName}" placeholder="学生姓名" aria-controls="sampleTable">
                                <input type="text" id="courseName" class="form-control form-control-sm" name="courseName" value="${courseName}" placeholder="课程名称" aria-controls="sampleTable">
                                <input type="text" id="selectionStatus" class="form-control form-control-sm" name="selectionStatus" value="${selectionStatus}" placeholder="选课状态" aria-controls="sampleTable">
                                <input type="submit" class="btn btn-primary" value="Search">
                            </form>
                        </label>
                        </div></div></div>
                        <%--
                            显示表单数据
                        --%>
                    <form action="${pageContext.request.contextPath}/selection/deletes" method="post">
                    <div class="row"><div class="col-sm-12">
                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                            <tr role="row">
                                <th style="width: 26px;">选择</th>
                                <th style="width: 66px;">序号</th>
                                <th style="width: 100px;">选课号</th>
                                <th style="width: 100px;">学号</th>
                                <th style="width: 116px;">学生姓名</th>
                                <th style="width: 100px;">课程编号</th>
                                <th style="width: 182px;">课程名称</th>
                                <th style="width: 182px;">选课时间</th>
                                <th style="width: 100px;">选课状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="se" items="${page.rows}" varStatus="sta" begin="0" step="1">
                            <tr role="row" class="odd"
                                <c:if test="${sta.count%2==1}">bgcolor="#B0C4DE"</c:if>>
                                <td>
                                    <div class="animated-checkbox"><label>
                                        <input type="checkbox" id="ids" name="ids" value="${se.selection_id}"><span class="label-text"></span>
                                    </label></div></td>
                                <td class="sorting_1">${sta.count}</td>
                                <td>${se.selection_id}</td>
                                <td>${se.sno}</td>
                                <td>${se.sName}</td>
                                <td>${se.course_id}</td>
                                <td>${se.course_name}</td>
                                <td>${se.selection_time}</td>
                                <td>
                                    <c:if test="${se.selection_status == 0}">待处理</c:if>
                                    <c:if test="${se.selection_status == 1}">已通过</c:if>
                                    <c:if test="${se.selection_status == 2}">未通过</c:if>
                                </td>
                                <td>
                                        <c:if test="${se.selection_status == 0}">
                                            <a title="通过" style="text-decoration:none" href="javascript:;"
                                               onclick="selection_pass(this,${se.selection_id})">
                                                <i class="Hui-iconfont" style="font-size:20px">&#xe6e1;</i>&nbsp;&nbsp;</a>
                                            <a title="拒绝" style="text-decoration:none" href="javascript:;"
                                               onclick="selection_refuse(this,${se.selection_id})">
                                                <i class="Hui-iconfont" style="font-size:20px">&#xe6dd;</i>&nbsp;&nbsp;</a>
                                        </c:if>
                                </td>

                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div></div>
                        <%--
                            信息部分，分页按钮
                        --%>
                        <div class="row"><div class="col-sm-12 col-md-5">

                        <div class="dataTables_info" id="sampleTable_info" role="status" aria-live="polite">
                            <input class="btn btn-primary btn-sm" type="submit" value="多选删除">&nbsp;
                            Showing ${start+1} to<c:if test="${(start+rows) >= count}"> ${count} </c:if>
                            <c:if test="${(start+rows) < count}"> ${start+rows} </c:if>
                            of ${count} entries

                        </div>
                        </div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                            <div style="float:right">
                                <ul class="pagination">
                                    <itheima:page url="${pageContext.request.contextPath}/selection/list"/>
                                </ul>
                            </div>
                </div></div></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script>

<script type="text/javascript">
    /*通过选课-确认*/
    function selection_pass(obj, id) {
        layer.confirm('确认通过该选课吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理
            $.ajax({
                type: 'post',
                dataType: 'json',
                url: '/selection/updateStatus',
                data: {id: id.valueOf(), status: 1},
            });
            $(obj).remove();
            layer.msg('选课已通过', {icon: 6, time: 1000});
            setTimeout("location.reload();", 1000);
        });
    }
    function selection_refuse(obj, id) {
        layer.confirm('确认拒绝该选课吗？', function (index) {
            //此处请求后台程序，下方是成功后的前台处理
            $.ajax({
                type: 'post',
                dataType: 'json',
                url: '/selection/updateStatus',
                data: {id: id.valueOf(), status: 2},
            });
            $(obj).remove();
            layer.msg('选课已拒绝', {icon: 6, time: 1000});
            setTimeout("location.reload();", 1000);
        });
    }
</script>
</body>
</html>
