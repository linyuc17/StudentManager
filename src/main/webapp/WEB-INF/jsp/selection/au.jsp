<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Linyc
  Date: 2019/3/24
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息编辑</title>
    <link rel="stylesheet" href="/css/main.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}../js/jquery-3.1.1.min.js"></script>
    <%--<script>
        var selectionIdRegex = /^\w[0-9]{4,7}$/;
        var selectionNameRegex = /^\w[0-9a-zA-Z]{1,9}$/;
        var teacherNameRegex = /^\w{2,4}$/;
        //var emailRegex = /^\w+@\w+(\.\w+)+$/;   //真实姓名：   var realNameRegex = /^[\u4e00-\u9fa5]{2,5}$/;
        function check() {
            var selectionId = $("#selection_id").val();
            var selectionName = $("#selection_name").val();
            var teacherName = $("#teacher_name").val();
            if(selectionId=="" || selectionName=="" || teacherName==""){
                alert("请把表单信息填写完整...");
                return false;
            }
            var flag = true;
            if(!selectionIdRegex.test(selectionId) || !selectionNameRegex.test(selectionName) || !teacherNameRegex.test(teacherName)){
                alert("请按要求填写表单...");
                flag = false;
            }
            return flag;
        }
        function byId(id){  //自定义方法，用于获取传递过来的ID值对应的节点对象
            return document.getElementById(id);
        }
        function checkselectionId(node){ //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范
            //校验用户名
            var selectionId = node.value;  //得到传递过来的节点对象的值
            if(!selectionIdRegex.test(selectionId)){  //验证是否符合节点对应的正则表达式
                byId("selectionId_span").style.color = "red"; //不符合，相应内容变成红色
            }else{
                byId("selectionId_span").style.color = "green";  //符合，相应内容变成绿色
            }
        }
        function checkselectionName(node){
            var selectionName = node.value;
            if(!selectionNameRegex.test(selectionName)){
                byId("selectionName_span").style.color = "red";
            }else{
                byId("selectionName_span").style.color = "green";
            }
        }
        function checkteacherName(node){
            var teacherName = node.value;
            if(!teacherNameRegex.test(teacherName)){
                byId("teacherName_span").style.color = "red";
            }else{
                byId("teacherName_span").style.color = "green";
            }
        }
    </script>--%>
</head>
<body>
    <div class="col-md-6">
        <div class="tile">
            <h3 class="tile-title">Please fill out this form</h3>
            <div class="tile-body">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/selection/${url}" method="post" onsubmit="return check()">
                    <div class="form-group row">
                        <label class="control-label col-md-3">选课号</label>
                        <div class="col-md-8">
                            <input id="selection_id" class="form-control" type="text" name="selection_id" value="${selection.selection_id}"
                                   <%--onblur="checkselectionId(this)"--%>
                                   <c:if test="${url == 'update'}">readonly="readonly"</c:if>>
                            <c:if test=""></c:if>
                            <%--<span id="selectionId_span">5-8个数字</span>--%>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">学号</label>
                        <div class="col-md-8">
                            <input id="sno" class="form-control" type="text" name="sno" value="${selection.sno}">
                                   <%--onblur="checkselectionName(this)">
                            <span id="sno_span">2-10个字符、数字</span>--%>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">学生姓名</label>
                        <div class="col-md-8">
                            <input id="sName" class="form-control " type="text" name="sName" value="${selection.sName}">
                                   <%--onblur="checkteacherName(this)"
                            <span id="sName_span">2-4个字符</span>--%>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">课程编号</label>
                        <div class="col-md-8">
                            <input id= "course_id"class="form-control" type="text" name="course_id" value="${selection.course_id}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">课程名称</label>
                        <div class="col-md-8">
                            <input id="course_name" class="form-control " type="text" name="course_name" value="${selection.course_name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">选课状态</label>
                        <div class="col-md-9">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="selection_status" value="0" checked="checked">待处理
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="selection_status" value="1">已通过
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="selection_status" value="2">未通过
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="tile-footer">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-3">
                                <input class="btn btn-primary" type="submit" value="提交">&nbsp;&nbsp;&nbsp;
                                <a class="btn btn-secondary" href="/selection/list">
                                    <i class="fa fa-fw fa-lg fa-times-circle"></i>
                                    Cancel
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
