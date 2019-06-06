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
    <script>
        var courseIdRegex = /^\w[0-9]{4,7}$/;
        var courseNameRegex = /^\w[0-9a-zA-Z]{1,9}$/;
        var teacherNameRegex = /^\w{2,4}$/;
        //var emailRegex = /^\w+@\w+(\.\w+)+$/;   //真实姓名：   var realNameRegex = /^[\u4e00-\u9fa5]{2,5}$/;
        function check() {
            var courseId = $("#course_id").val();
            var courseName = $("#course_name").val();
            var teacherName = $("#teacher_name").val();
            if(courseId=="" || courseName=="" || teacherName==""){
                alert("请把表单信息填写完整...");
                return false;
            }
            var flag = true;
            if(!courseIdRegex.test(courseId) || !courseNameRegex.test(courseName) || !teacherNameRegex.test(teacherName)){
                alert("请按要求填写表单...");
                flag = false;
            }
            return flag;
        }
        function byId(id){  //自定义方法，用于获取传递过来的ID值对应的节点对象
            return document.getElementById(id);
        }
        function checkcourseId(node){ //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范
            //校验用户名
            var courseId = node.value;  //得到传递过来的节点对象的值
            if(!courseIdRegex.test(courseId)){  //验证是否符合节点对应的正则表达式
                byId("courseId_span").style.color = "red"; //不符合，相应内容变成红色
            }else{
                byId("courseId_span").style.color = "green";  //符合，相应内容变成绿色
            }
        }
        function checkcourseName(node){
            var courseName = node.value;
            if(!courseNameRegex.test(courseName)){
                byId("courseName_span").style.color = "red";
            }else{
                byId("courseName_span").style.color = "green";
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
    </script>
</head>
<body>
    <div class="col-md-6">
        <div class="tile">
            <h3 class="tile-title">Please fill out this form</h3>
            <div class="tile-body">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/course/${url}" method="post" onsubmit="return check()">
                    <div class="form-group row">
                        <label class="control-label col-md-3">课程号</label>
                        <div class="col-md-8">
                            <input id="course_id" class="form-control" type="text" name="course_id" value="${course.course_id}"
                                   onblur="checkcourseId(this)"
                                   <c:if test="${url == 'update'}">readonly="readonly"</c:if>>
                            <c:if test=""></c:if>
                            <span id="courseId_span">5-8个数字</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">课程名称</label>
                        <div class="col-md-8">
                            <input id="course_name" class="form-control" type="text" name="course_name" value="${course.course_name}"
                                   onblur="checkcourseName(this)">
                            <span id="courseName_span">2-10个字符、数字</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">任课老师</label>
                        <div class="col-md-8">
                            <input id="teacher_name" class="form-control " type="text" name="teacher_name" value="${course.teacher_name}"
                                   onblur="checkteacherName(this)"
                            <span id="teacherName_span">2-4个字符</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">上课时间</label>
                        <div class="col-md-8">
                            <input id= "course_time"class="form-control" type="text" name="course_time" value="${course.course_time}"
                                   placeholder="可为空">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">课程性质</label>
                        <div class="col-md-8">
                            <input id="course_nature" class="form-control " type="text" name="course_nature" value="${course.course_nature}"
                                   placeholder="可为空">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">学分</label>
                        <div class="col-md-8">
                            <input id="course_credit" class="form-control" type="text" name="course_credit"
                                   value="${course.course_credit}" placeholder="可为空">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">课程余量</label>
                        <div class="col-md-8">
                            <input id="course_allowance" class="form-control " type="text" name="course_allowance"
                                   value="${course.course_allowance}" placeholder="可为空">
                        </div>
                    </div>
                    <div class="tile-footer">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-3">
                                <input class="btn btn-primary" type="submit" value="提交">&nbsp;&nbsp;&nbsp;
                                <a class="btn btn-secondary" href="/course/list">
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
