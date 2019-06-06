<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/" %>
<%--
  Created by IntelliJ IDEA.
  User: Linyc
  Date: 2019/6/6
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
</head>
<body>

<div class="app-title">
    <div>
        <a>&nbsp;</a>
        <h1><i class="fa fa-th-list">My Course</i></h1>
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
                            <div class="btn-group">
                                <a href="/student/myCourse" class="btn btn-primary">
                                    <i class="Hui-iconfont">&#xe68f;</i></a>
                            </div>
                        </div></div>
                        <div class="col-sm-12 col-md-6"><div id="sampleTable_filter" class="dataTables_filter">
                        </div></div></div>
                        <%--
                            显示表单数据
                        --%>
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
                                <th style="width: 100px;">上课地点</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="co" items="${courses}" varStatus="sta" begin="0" step="1">
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
                                <td>待定</td>
                                <td>无</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
