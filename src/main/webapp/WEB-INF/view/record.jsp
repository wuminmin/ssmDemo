<%--
  Created by IntelliJ IDEA.
  User: WMM
  Date: 2017/9/14
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>登记移动用户投诉处理情况</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <%--<div>--%>

            <%--<h1 class="logo-name">H+</h1>--%>

        <%--</div>--%>
        <h3>登记移动用户投诉处理情况</h3>

        <form class="m-t" role="form" action="${pageContext.request.contextPath}/table/add">
            <div class="form-group">
                <input id="yingyebu" name="yingyebu" type="txt" class="form-control" placeholder="营业部" required="">
            </div>
            <div class="form-group">
                <input id="didian" name="didian" type="txt" class="form-control" placeholder="地名点" required="">
            </div>
            <div class="form-group">
                <input id="jingdu" name="jingdu" type="txt" class="form-control" placeholder="经度" required="">
            </div>
            <div class="form-group">
                <input id="weidu" name="weidu" type="txt" class="form-control" placeholder="纬度" required="">
            </div>
            <div class="form-group">
                <input id="fugaiyonghushu" name="fugaiyonghushu" type="txt" class="form-control" placeholder="覆盖用户数" required="">
            </div>
            <div class="form-group">
                <input id="gudingdianhuashu" name="gudingdianhuashu" type="txt" class="form-control" placeholder="目前固话数" required="">
            </div>
            <div class="form-group">
                <input id="tietaqingkuang" name="tietaqingkuang" type="txt" class="form-control" placeholder="附近铁塔情况" required="">
            </div>
            <div class="form-group">
                <input id="jiejuefangan" name="jiejuefangan" type="txt" class="form-control" placeholder="拟定解决方案" required="">
            </div>
            <div class="form-group">
                <input id="chulijieguo" name="chulijieguo" type="txt" class="form-control" placeholder="处理最终结果" required="">
            </div>
            <button type="submit" class="btn btn-success block full-width m-b">登记</button>

            <br>

            <p class="text-muted text-center">
                <a href="${pageContext.request.contextPath}/table/login">回到登录页</a>
            </p>

            <%--<p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>--%>
            <%--</p>--%>

        </form>
    </div>
</div>
<!-- 全局js -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<%--<script src="${pageContext.request.contextPath}/static/js/content.js?v=1.0.0"></script>--%>

<!-- iCheck -->
<script src="${pageContext.request.contextPath}/static/js/plugins/iCheck/icheck.min.js"></script>
<script>
$(document).ready(function () {
$('.i-checks').iCheck({
checkboxClass: 'icheckbox_square-green',
radioClass: 'iradio_square-green',
});
});
</script>

<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->

</body>

</html>
