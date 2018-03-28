
<%--
  Created by IntelliJ IDEA.
  User: TyurinTsien
  Date: 17/05/2017
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>小CEO移动网盲点管理系统 登录</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico"> <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <%--<h1 class="logo-name"></h1>--%>
                    <img src="${pageContext.request.contextPath}/static/img/dianxin.jpg"/>
            </div>
            <h3>小CEO移动网盲点管理系统</h3>

            <form class="m-t" role="form" action="${pageContext.request.contextPath}/loginCheck" method="post">
                <div class="form-group">
                    <input type="txt" name="userTel" class="form-control" placeholder="用户名" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="userPwd" class="form-control" placeholder="密码" required="">
                </div>

                <%--<div class="form-group">--%>
                    <%--<div class="col-sm-8 form-group" style="padding-left: 0px;padding-right: 0px;">--%>
                        <%--<input name="VerifyCode" type="text" class="form-control"--%>
                               <%--placeholder="验证码" required="">--%>
                    <%--</div>--%>
                    <%--<a class="col-sm-4 form-group" href='#' onclick="javascript:changeImg()">--%>
                        <%--<img id="imageCode" src="${pageContext.request.contextPath}/verCode/getImage">--%>
                    <%--</a>--%>
                <%--</div>--%>

                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
                <br>
                <p class="text-muted text-center">
                    <a href="${pageContext.request.contextPath}/record">我要记录</a>
                </p>
            </form>
        </div>
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js?v=3.3.6"></script>
    <script>
        function changeImg() {
            $("#imageCode").attr("src", "${pageContext.request.contextPath}/verCode/getImage?date=" + new Date());
        }
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->

</body>

</html>
