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
            var sno = $("#sno").val();
            var sName = $("#sName").val();
            var address = $("#address").val();
            if(sno=="" && sName=="" && address==""){
                alert("你好像忘了点什么...");
                return false;
            }
        }
    </script>
</head>
<body>

<div class="app-title">
    <div>
        <a>&nbsp;</a>
        <h1><i class="fa fa-th-list">Student Table</i></h1>
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
                                    <option value="/student/list?rows=5">5</option>
                                    <option value="/student/list?rows=10">10</option>
                                    <option value="/student/list?rows=20">20</option>
                                    <option value="/student/list?rows=50">50</option>
                                </select> entries&nbsp;</label>
                            <div class="btn-group">
                                <a href="/student/add" class="btn btn-primary">
                                    <i class="Hui-iconfont">&#xe600;</i></a>
                                <a href="/student/list" class="btn btn-primary">
                                    <i class="Hui-iconfont">&#xe68f;</i></a>
                            </div>
                        </div></div>
                        <div class="col-sm-12 col-md-6"><div id="sampleTable_filter" class="dataTables_filter">
                        <label>
                            <form action="${pageContext.request.contextPath}/student/list" method="post" onsubmit="return check()">

                                <input type="text" id="sno" class="form-control form-control-sm" name="sno"  value="${sno}" placeholder="学号" aria-controls="sampleTable">
                                <input type="text" id="sName" class="form-control form-control-sm" name="sName" value="${sName}" placeholder="姓名" aria-controls="sampleTable">
                                <input type="text" id="address" class="form-control form-control-sm" name="address" value="${address}" placeholder="地址" aria-controls="sampleTable">
                                <input type="submit" class="btn btn-primary" value="Search">
                            </form>
                        </label>
                        </div></div></div>
                        <%--
                            显示表单数据
                        --%>
                    <form action="${pageContext.request.contextPath}/student/deletes" method="post">
                    <div class="row"><div class="col-sm-12">
                        <table class="table table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                            <tr role="row">
                                <th style="width: 26px;">选择</th>
                                <th style="width: 100px;">序号</th>
                                <th style="width: 116px;">学号</th>
                                <th style="width: 66px;">照片</th>
                                <th style="width: 116px;">姓名</th>
                                <th style="width: 116px;">性别</th>
                                <th style="width: 132px;">电话号码</th>
                                <th style="width: 302px;">地址</th>
                                <th style="width: 116px;">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="st" items="${page.rows}" varStatus="sta" begin="0" step="1">
                            <tr role="row" class="odd"
                                <%--<c:if test="${sta.count%2==0}">bgcolor="#6495ED"</c:if>--%>
                                <c:if test="${sta.count%2==1}">bgcolor="#B0C4DE"</c:if>>
                                <td>
                                    <div class="animated-checkbox"><label>
                                        <input type="checkbox" id="ids" name="ids" value="${st.sno}"><span class="label-text"></span>
                                    </label></div></td>
                                <td class="sorting_1">${sta.count}</td>
                                <td>${st.sno}</td>
                                <td><img src="/upload/student/${st.photo}" width="50" height="50"></td>
                                <td>${st.sName}</td>
                                <td><c:if test="${st.gender == 1}">男</c:if><c:if test="${st.gender == 2}">女</c:if></td>
                                <td>${st.phone}</td>
                                <td>${st.address}</td>
                                <td><a style="text-decoration:none" href="/student/edit?id=${st.sno}"><i class="Hui-iconfont">&#xe6df;</i>&nbsp;&nbsp;</a>
                                    <a style="text-decoration:none" href="/student/delete?id=${st.sno}"><i class="Hui-iconfont">&#xe609;</i>&nbsp;&nbsp;</a></td>
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
                                    <itheima:page url="${pageContext.request.contextPath}/student/list"/>
                                </ul>
                            </div>
                </div></div></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
