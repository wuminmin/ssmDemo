<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>池州电信移动用户投诉管理系统</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.css?v=4.1.0" rel="stylesheet">
    

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">


        <br/>
        <!-- Panel Other -->
        <div class="ibox float-e-margins">

            <div class="ibox-title">
                <h5>池州电信移动用户投诉管理系统</h5>

                <%--<div class="ibox-tools">--%>
                    <%--<a class="collapse-link">--%>
                        <%--<i class="fa fa-chevron-up"></i>--%>
                    <%--</a>--%>
                    <%--<a class="dropdown-toggle" data-toggle="dropdown" href="#">--%>
                        <%--<i class="fa fa-wrench"></i>--%>
                    <%--</a>--%>
                    <%--<ul class="dropdown-menu dropdown-user">--%>
                        <%--<li><a href="#">选项1</a>--%>
                        <%--</li>--%>
                        <%--<li><a href="#">选项2</a>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                    <%--<a class="close-link">--%>
                        <%--<i class="fa fa-times"></i>--%>
                    <%--</a>--%>
                <%--</div>--%>
            </div>

            <br/>

            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <!-- Example Card View -->
                        <div class="example-wrap">
                            <h4 class="example-title">投诉处理情况</h4>
                            <div class="example">
                                <table data-toggle="table" data-url="js/demo/bootstrap_table_test2.json" data-card-view="true" data-mobile-responsive="true">
                                    <thead>
                                    <tr>
                                        <th data-field="id">序号</th>
                                        <th data-field="name">营业部</th>
                                        <th data-field="star">地名点</th>
                                        <th data-field="license">经度</th>
                                        <th data-field="description">纬度</th>
                                        <th data-field="url">覆盖用户数</th>
                                        <th data-field="url">目前固话数</th>
                                        <th data-field="url">附近铁塔情况</th>
                                        <th data-field="url">拟定解决方案</th>
                                        <th data-field="url">日期</th>
                                        <th data-field="url">处理最终结果</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${!empty complaints}">
                                        <c:forEach items="${complaints}" var="complaints">
                                            <tr>
                                                <td>${complaints.id}</td>
                                                <td>${complaints.yingyebu}</td>
                                                <td>${complaints.didian}</td>
                                                <td>${complaints.jingdu}</td>
                                                <td>${complaints.weidu}</td>
                                                <td>${complaints.fugaiyonghushu}</td>
                                                <td>${complaints.gudingdianhuashu}</td>
                                                <td>${complaints.tietaqingkuang}</td>
                                                <td>${complaints.jiejuefangan}</td>
                                                <td>${complaints.date}</td>
                                                <td>${complaints.chulijieguo}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- End Example Card View -->
                    </div>

                    <div class="col-sm-12">
                        <!-- Example Events -->
                        <div class="example-wrap">
                            <%--<h4 class="example-title">事件</h4>--%>
                            <div class="example">
                                <%--<div class="alert alert-success" id="examplebtTableEventsResult" role="alert">--%>
                                <%--事件结果--%>
                                <%--</div>--%>
                                <div class="btn-group hidden-xs" id="exampleTableEventsToolbar" role="group">
                                    <button type="button" class="btn btn-outline btn-default" href="${pageContext.request.contextPath}/record">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                    </button>
                                    <%--<button type="button" class="btn btn-outline btn-default">--%>
                                    <%--<i class="glyphicon glyphicon-heart" aria-hidden="true"></i>--%>
                                    <%--</button>--%>
                                    <%--<button type="button" class="btn btn-outline btn-default">--%>
                                    <%--<i class="glyphicon glyphicon-trash" aria-hidden="true"></i>--%>
                                    <%--</button>--%>
                                </div>
                                <%--<table id="exampleTableEvents" data-height="400" data-mobile-responsive="true">--%>
                                <%--<thead>--%>
                                <%--<tr>--%>
                                <%--<th data-field="state" data-checkbox="true"></th>--%>
                                <%--<th data-field="id">ID</th>--%>
                                <%--<th data-field="name">名称</th>--%>
                                <%--<th data-field="price">价格</th>--%>
                                <%--</tr>--%>
                                <%--</thead>--%>
                                <%--</table>--%>
                            </div>
                        </div>
                        <!-- End Example Events -->
                    </div>
                </div>
            </div>

        </div>
        <!-- End Panel Other -->
    </div>


    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <%--<script src="${pageContext.request.contextPath}/static/js/content.js?v=1.0.0"></script>--%>


    <!-- Bootstrap table -->
    <script src="${pageContext.request.contextPath}/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>

    <!-- Peity -->
    <script src="js/demo/bootstrap-table-demo.js"></script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->

</body>

</html>
