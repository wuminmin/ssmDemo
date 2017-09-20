<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员账户</title>
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
                    <h5>管理系统账户</h5>
                    <div class="ibox-tools alert">
                        <a class="btn btn-primary btn-xs" type="button" href="${pageContext.request.contextPath}/table/table">返回主页面</a>
                    </div>
                </div>
                <div class="ibox-content">

                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th data-field="id">序号</th>
                            <th data-field="name">用户名</th>
                            <th data-field="star">用户密码</th>
                            <th data-field="license">邮箱</th>
                            <th data-field="description">用户类型</th>
                            <th data-field="url">手机号</th>

                        </tr>
                        </thead>
                        <tbody>

                        <c:if test="${!empty users}">
                            <c:forEach items="${users}" var="users">
                                <tr>
                                    <td>${users.userid}</td>
                                    <td>${users.username}</td>
                                    <td>${users.userpassword}</td>
                                    <td>${users.useremail}</td>
                                    <td>${users.usertype}</td>
                                    <td>${users.userphone}</td>

                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>

                    </table>
                    <tfoot>



                    <form role="form" class="form-inline" action="${pageContext.request.contextPath}/user/add">
                        <div class="form-group btn-xs">
                            <input class=" btn-xs" type="txt" placeholder="请输入要增加的用户名" id="username" name="username" class="form-control">
                        </div>
                        <div class="form-group btn-xs">
                            <input class=" btn-xs" type="txt" placeholder="请输入要增加的密码" id="userpassword" name="userpassword" class="form-control">
                        </div>
                        <div class="form-group btn-xs">
                            <input class=" btn-xs" type="email" placeholder="请输入要增加的邮箱" id="useremail" name="useremail" class="form-control">
                        </div>
                        <%--<div class="form-group btn-xs">--%>
                            <%--<input class=" btn-xs" type="number" placeholder="请输入要增加的类型，默认1" id="usertype" name="usertype" class="form-control">--%>
                        <%--</div>--%>
                        <div class="form-group btn-xs">
                            <input class=" btn-xs" type="number" placeholder="请输入要增加的手机号" id="userphone" name="userphone" class="form-control">
                        </div>
                        <button class="btn btn-primary btn-xs" type="submit">增加记录</button>
                    </form>

                    <br>

                    <form role="form" class="form-inline" action="${pageContext.request.contextPath}/user/delete">
                        <div class="form-group btn-xs">
                            <input class=" btn-xs" type="number" placeholder="请输入要删除的序号" id="deleteId" name="deleteId" class="form-control">
                        </div>
                        <button class="btn btn-danger btn-xs" type="submit">删除记录</button>
                    </form>
                    </tfoot>
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
