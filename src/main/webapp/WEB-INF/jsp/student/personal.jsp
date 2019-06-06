<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/6/6
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link type="text/css" href="/css/main.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/1.0.8/iconfont.css" />
</head>
<body>
<div class="col-lg-6">
    <h2 class="mb-3 line-head" id="nav-breadcrumbs">Personal Information</h2>
    <div class="bs-component">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active">照片</li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <img src="/upload/student/${student.photo}" width="100" height="100">
            <%--<div class="btn-group">
                <a href="/student/edit?id=${student.sno}" class="btn btn-primary">
                    <i class="Hui-iconfont">&#xe600;</i></a>
            </div>--%>
        </ol>
        <ol class="breadcrumb">
            <li class="breadcrumb-item active">学号</li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            ${student.sno}
        </ol>
        <ol class="breadcrumb">
            <li class="breadcrumb-item active">姓名</li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            ${student.sName}
        </ol>
        <ol class="breadcrumb">
            <li class="breadcrumb-item active">性别</li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <c:if test="${student.gender == 1}">男</c:if>
            <c:if test="${student.gender == 2}">女</c:if>
        </ol>
        <ol class="breadcrumb">
            <li class="breadcrumb-item active">电话</li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            ${student.phone}
        </ol>
        <ol class="breadcrumb">
            <li class="breadcrumb-item active">地址</li><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            ${student.address}
        </ol>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="/student/edit?id=${student.sno}" class="btn btn-primary">修改资料</a>
                <a href="/student/edit?id=${student.sno}" class="btn btn-primary">修改密码</a>
        </ol>
    </div>
</div>

</body>
</html>
