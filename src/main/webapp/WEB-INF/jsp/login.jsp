<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2019/6/2
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/1.0.8/iconfont.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <script>
        function check() {
            var username = $("#username").val();
            var password = $("#password").val();
            if(username=="" && password==""){
                alert("请将登录信息填写完整...");
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="  pace-done"><div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
    <div class="pace-progress-inner"></div>
</div>
    <div class="pace-activity"></div></div>
<section class="material-half-bg">
    <div class="cover"></div>
</section>
<section class="login-content">
    <div class="logo">
        <h1>aaaacl</h1>
    </div>
    <div class="login-box">
        <form class="login-form" action="/userLogin" method="post" onsubmit="return check()">
            <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>SIGN IN</h3>
            <div class="form-group">
                <label class="control-label">用户名</label>
                <input class="form-control" id="username" type="text"  name="username" placeholder="username" autofocus="">
            </div>
            <div class="form-group">
                <label class="control-label">密码</label>
                <input class="form-control" id="password" type="password" name="password" placeholder="password">
            </div>
            <div class="form-group">
                <div class="utility">
                    <div class="animated-checkbox">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="form-check-input" type="radio" name="userType" value="1" checked="checked">管理员
                        </label>
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="form-check-input" type="radio" name="userType" value="2" >学生
                        </label>
                    </div>
                    <p class="semibold-text mb-2"><a href="#" data-toggle="flip">Forgot Password ?</a></p>

                </div>
                <a style="color: #96000e">${msg}</a>
            </div>
            <div class="form-group btn-container">
                <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>SIGN IN</button>
            </div>
        </form>
        <form class="forget-form" action="index.html">
            <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>Forgot Password ?</h3>
            <div class="form-group">
                <label class="control-label">EMAIL</label>
                <input class="form-control" type="text" placeholder="Email">
            </div>
            <div class="form-group btn-container">
                <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>RESET</button>
            </div>
            <div class="form-group mt-3">
                <p class="semibold-text mb-0"><a href="#" data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> Back to Login</a></p>
            </div>
        </form>
    </div>
</section>
<!-- Essential javascripts for application to work-->
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="/js/plugins/pace.min.js"></script>
<script type="text/javascript">
    // Login Page Flipbox control
    $('.login-content [data-toggle="flip"]').click(function() {
        $('.login-box').toggleClass('flipped');
        return false;
    });
</script>

</body>
</html>
