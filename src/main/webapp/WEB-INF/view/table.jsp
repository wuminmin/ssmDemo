<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>池州电信移动用户投诉管理系统</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${pageContext.request.contextPath}/static/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>移动用户投诉处理情况</h5>
                    <div class="ibox-tools">
                        <%--<a class="collapse-link">--%>
                            <%--<i class="fa fa-chevron-up"></i>--%>
                        <%--</a>--%>
                        <%--<a class="dropdown-toggle" data-toggle="dropdown" href="table_data_tables.html#">--%>
                            <%--<i class="fa fa-wrench"></i>--%>
                        <%--</a>--%>
                        <%--<ul class="dropdown-menu dropdown-user">--%>
                            <%--<li><a href="table_data_tables.html#">选项1</a>--%>
                            <%--</li>--%>
                            <%--<li><a href="table_data_tables.html#">选项2</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<a class="close-link">--%>
                            <%--<i class="fa fa-times"></i>--%>
                        <%--</a>--%>
                        <a href=""><导出EXCEL></导出EXCEL></a>
                    </div>
                </div>
                <div class="ibox-content">

                    <table class="table table-striped table-bordered table-hover dataTables-example">
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
                        <%--<c:forEach items="${userlists}" var="usr">--%>
                            <%--<tr class="gradeX">--%>
                                <%--<td>${usr.id}</td>--%>
                                <%--<td>${usr.username}</td>--%>
                                <%--<td>${usr.password}</td>--%>
                                <%--<td class="center">${usr.phonenum}</td>--%>
                                <%--<td class="center">${usr.addr}</td>--%>
                            <%--</tr>--%>
                        <%--</c:forEach>--%>

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
                        <tfoot>
                        </tfoot>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js?v=3.3.6"></script>



    <script src="${pageContext.request.contextPath}/static/js/plugins/jeditable/jquery.jeditable.js"></script>

    <!-- Data Tables -->
    <script src="${pageContext.request.contextPath}/static/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- 自定义js -->
    <%--<script src="${pageContext.request.contextPath}/static/js/content.js?v=1.0.0"></script>--%>


    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function () {
            $('.dataTables-example').dataTable();

            /* Init DataTables */
            var oTable = $('#editable').dataTable();

            /* Apply the jEditable handlers to the table */
            oTable.$('td').editable('../example_ajax.php', {
                "callback": function (sValue, y) {
                    var aPos = oTable.fnGetPosition(this);
                    oTable.fnUpdate(sValue, aPos[0], aPos[1]);
                },
                "submitdata": function (value, settings) {
                    return {
                        "row_id": this.parentNode.getAttribute('id'),
                        "column": oTable.fnGetPosition(this)[2]
                    };
                },

                "width": "90%",
                "height": "100%"
            });


        });

        function fnClickAddRow() {
            $('#editable').dataTable().fnAddData([
                "Custom row",
                "New row",
                "New row",
                "New row",
                "New row"]);

        }
    </script>

    <%--<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>--%>
    <!--统计代码，可删除-->

</body>

</html>
