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
        var snoRegex = /^\w[0-9]{4,9}$/;
        var sNameRegex = /^\w[0-9a-zA-Z_]{2,9}$/;
        var passwordRegex = /^\w{6,10}$/;
        //var emailRegex = /^\w+@\w+(\.\w+)+$/;   //真实姓名：   var realNameRegex = /^[\u4e00-\u9fa5]{2,5}$/;
        function check() {
            var sno = $("#sno").val();
            var sName = $("#sName").val();
            var password = $("#password").val();
            if(sno=="" || sName=="" || password==""){
                alert("请把表单信息填写完整...");
                return false;
            }
            var flag = true;
            if(!snoRegex.test(sno) || !sNameRegex.test(sName) || !passwordRegex.test(password)){
                alert("请按要求填写表单...");
                flag = false;
            }
            return flag;
        }
        function byId(id){  //自定义方法，用于获取传递过来的ID值对应的节点对象
            return document.getElementById(id);
        }
        function checksno(node){ //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范
            //校验用户名
            var sno = node.value;  //得到传递过来的节点对象的值
            if(!snoRegex.test(sno)){  //验证是否符合节点对应的正则表达式
                byId("sno_span").style.color = "red"; //不符合，相应内容变成红色
            }else{
                byId("sno_span").style.color = "green";  //符合，相应内容变成绿色
            }
        }
        function checksName(node){
            var sName = node.value;
            if(!sNameRegex.test(sName)){
                byId("sName_span").style.color = "red";
            }else{
                byId("sName_span").style.color = "green";
            }
        }
        function checkpassword(node){
            var password = node.value;
            if(!passwordRegex.test(password)){
                byId("password_span").style.color = "red";
            }else{
                byId("password_span").style.color = "green";
            }
        }
    </script>
</head>
<body>
    <div class="col-md-6">
        <div class="tile">
            <h3 class="tile-title">Please fill out this form</h3>
            <div class="tile-body">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/${url}" method="post" onsubmit="return check()">
                    <div class="form-group row">
                        <label class="control-label col-md-3">学号</label>
                        <div class="col-md-8">
                            <input id="sno" class="form-control" type="text" name="sno" value="${student.sno}"
                                   placeholder="Enter sno" onblur="checksno(this)"
                                   <c:if test="${url == 'updateStudent'}">readonly="readonly"</c:if>>
                            <c:if test=""></c:if>
                            <span id="sno_span">5-8个数字</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">用户名</label>
                        <div class="col-md-8">
                            <input id="sName" class="form-control" type="text" name="sName" value="${student.sName}"
                                   placeholder="Enter sName" onblur="checksName(this)">
                            <span id="sName_span">3-10个字母、数字或下划线</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">密码</label>
                        <div class="col-md-8">
                            <input id="password" class="form-control " type="text" name="password" value="${student.password}"
                                   placeholder="Enter password" onblur="checkpassword(this)"
                                   <c:if test="${url == 'updateStudent'}">readonly="readonly"</c:if>>
                            <span id="password_span">6-10个字符</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">性别</label>
                        <div class="col-md-9">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="gender" value="1" checked="checked">男
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="gender" value="2">女
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">电话</label>
                        <div class="col-md-8">
                            <input id= "phone"class="form-control" type="text" name="phone" value="${student.phone}"
                                   placeholder="可为空">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3">地址</label>
                        <div class="col-md-8">
                            <input id="address" class="form-control " type="text" name="address" value="${student.address}"
                                   placeholder="可为空">
                        </div>
                    </div>
                    <div class="tile-footer">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-3">
                                <input class="btn btn-primary" type="submit" value="提交">&nbsp;&nbsp;&nbsp;
                                <a class="btn btn-secondary" href="/studentList">
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
