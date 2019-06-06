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
            var courseId = $("#courseId").val();
            var courseName = $("#courseName").val();
            var teacherName = $("#teacherName").val();
            if(courseId=="" && courseName=="" && teacherName==""){
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
        <h1><i class="fa fa-th-list">Course Table</i></h1>
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
                                    <option value="/course/list?rows=5">5</option>
                                    <option value="/course/list?rows=10">10</option>
                                    <option value="/course/list?rows=20">20</option>
                                    <option value="/course/list?rows=50">50</option>
                                </select> entries&nbsp;</label>
                            <div class="btn-group">
                                <c:if test="${userType == 1}">
                                    <a href="/course/add" class="btn btn-primary">
                                        <i class="Hui-iconfont">&#xe600;</i></a>
                                </c:if>
                                <a href="/course/list" class="btn btn-primary">
                                    <i class="Hui-iconfont">&#xe68f;</i></a>
                            </div>
                        </div></div>
                        <div class="col-sm-12 col-md-6"><div id="sampleTable_filter" class="dataTables_filter">
                        <label>
                            <form action="${pageContext.request.contextPath}/course/list" method="post" onsubmit="return check()">

                                <input type="text" id="courseId" class="form-control form-control-sm" name="courseId"  value="${courseId}" placeholder="课程号" aria-controls="sampleTable">
                                <input type="text" id="courseName" class="form-control form-control-sm" name="courseName" value="${courseName}" placeholder="课程名称" aria-controls="sampleTable">
                                <input type="text" id="teacherName" class="form-control form-control-sm" name="teacherName" value="${teacherName}" placeholder="任课老师" aria-controls="sampleTable">
                                <input type="submit" class="btn btn-primary" value="Search">
                            </form>
                        </label>
                        </div></div></div>
                        <%--
                            显示表单数据
                        --%>
                    <form action="${pageContext.request.contextPath}/course/deletes" method="post">
                    <div class="row"><div class="col-sm-12">
                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                            <tr role="row">
                                <th style="width: 26px;">选择</th>
                                <th style="width: 66px;">序号</th>
                                <th style="width: 100px;">课程号</th>
                                <th style="width: 116px;">课程名称</th>
                                <th style="width: 116px;">任课老师</th>
                                <th style="width: 182px;">上课时间</th>
                                <th style="width: 182px;">课程性质</th>
                                <th style="width: 100px;">学分</th>
                                <th style="width: 100px;">课程余量</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="co" items="${page.rows}" varStatus="sta" begin="0" step="1">
                            <tr role="row" class="odd"
                                <%--<c:if test="${sta.count%2==0}">bgcolor="#6495ED"</c:if>--%>
                                <c:if test="${sta.count%2==1}">bgcolor="#B0C4DE"</c:if>>
                                <td>
                                    <div class="animated-checkbox"><label>
                                        <input type="checkbox" id="ids" name="ids" value="${co.course_id}"><span class="label-text"></span>
                                    </label></div></td>
                                <td class="sorting_1">${sta.count}</td>
                                <td>${co.course_id}</td>
                                <td>${co.course_name}</td>
                                <td>${co.teacher_name}</td>
                                <td>${co.course_time}</td>
                                <td>${co.course_nature}</td>
                                <td>${co.course_credit}</td>
                                <td>${co.course_allowance}</td>
                                <c:if test="${userType == 1}">
                                    <td>
                                        <a style="text-decoration:none" href="/course/edit?id=${co.course_id}"><i class="Hui-iconfont">&#xe6df;</i>&nbsp;&nbsp;</a>
                                        <a style="text-decoration:none" href="/course/delete?id=${co.course_id}"><i class="Hui-iconfont">&#xe609;</i>&nbsp;&nbsp;</a>
                                    </td>
                                </c:if>
                                <c:if test="${userType != 1}">
                                    <td>
                                        <a title="选择" style="text-decoration:none" href="javascript:;"
                                           onclick="course_sure(this,${co.course_id})">
                                            <i class="Hui-iconfont" style="font-size:20px">&#xe6e1;</i>&nbsp;&nbsp;</a>
                                    </td>
                                </c:if>

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
                            <c:if test="${userType == 1}">
                                <input class="btn btn-primary btn-sm" type="submit" value="多选删除">
                            </c:if>
                            &nbsp;
                            Showing ${start+1} to<c:if test="${(start+rows) >= count}"> ${count} </c:if>
                            <c:if test="${(start+rows) < count}"> ${start+rows} </c:if>
                            of ${count} entries

                        </div>
                        </div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                            <div style="float:right">
                                <ul class="pagination">
                                    <itheima:page url="${pageContext.request.contextPath}/course/list"/>
                                </ul>
                            </div>
                </div></div></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
    /*确认选择该课程*/
    function course_sure(obj, id) {
        layer.confirm('确认选择课程号为'+id.valueOf()+"的课程吗？", function (index) {
            $.ajax({
                type: 'post',
                dataType: 'json',
                url: '/student/addCourse',
                data: {id: id.valueOf()}
            });
            $(obj).remove();
            layer.msg('成功选择该课程', {icon: 6, time: 1000});
            setTimeout("location.reload();", 1000);
        });
    }
</script>
</body>
</html>
