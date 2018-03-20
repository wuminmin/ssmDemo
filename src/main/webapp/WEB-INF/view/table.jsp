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

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="${pageContext.request.contextPath}/static/css/plugins/dataTables/dataTables.bootstrap.css"
          rel="stylesheet">

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

                    <div class="ibox-tools alert">
                        <a class="btn btn-warning btn-xs" type="button"
                           href="${pageContext.request.contextPath}/user/table">管理系统账号</a>
                        <a class="btn btn-primary btn-xs" type="button"
                           href="${pageContext.request.contextPath}/table/record">增加记录</a>
                        <a class="btn btn-primary btn-xs" type="button"
                           href="${pageContext.request.contextPath}/table/excel">导出记录</a>
                        <a class="btn btn-primary btn-xs" type="button"
                           href="${pageContext.request.contextPath}/table/map">地图展示</a>
                        <a class="btn btn-danger btn-xs" type="button"
                           href="${pageContext.request.contextPath}/loginOut">退出登录</a>
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

                        <c:if test="${!empty complaints}">
                            <c:forEach items="${complaints}" var="complaint">
                                <tr>
                                    <td>${complaint.id}</td>
                                    <td>${complaint.yingyebu}</td>
                                    <td>${complaint.didian}</td>
                                    <td>${complaint.jingdu}</td>
                                    <td>${complaint.weidu}</td>
                                    <td>${complaint.fugaiyonghushu}</td>
                                    <td>${complaint.gudingdianhuashu}</td>
                                    <td>${complaint.tietaqingkuang}</td>
                                    <td>${complaint.jiejuefangan}</td>
                                    <td>${complaint.date}</td>
                                    <td>${complaint.chulijieguo}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>

                    </table>
                    <tfoot>

                    <form role="form" class="form-inline" action="${pageContext.request.contextPath}/table/delete">
                        <div class="form-group btn-xs">
                            <input class=" btn-xs" type="number" placeholder="请输入要删除的序号" id="deleteId" name="deleteId"
                                   class="form-control">
                        </div>
                        <button class="btn btn-danger btn-xs" type="submit">删除记录</button>
                    </form>

                    <br>

                    <form role="form" class="form-inline" action="${pageContext.request.contextPath}/table/batchimport" method="post" enctype="multipart/form-data"
                          onsubmit="return check();">
                        <div class="form-group btn-xs">

                            <input class=" btn-xs"  id="excel_file" type="file" name="filename" accept="xlsx"/>

                        </div>
                        <input class="btn btn-primary btn-xs"  id="excel_button" type="submit" value="导入Excel"/>
                        <%--<font id="importMsg" color="red"><%=importMsg%>--%>
                        <%--</font>--%>
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
<script type="text/javascript">
    function check() {
        var excel_file = $("#excel_file").val();
        if (excel_file == "" || excel_file.length == 0) {
            alert("请选择文件路径！");
            return false;
        } else {
            return true;
        }
    }

    $(document).ready(function () {
        var msg = "";
        if ($("#importMsg").text() != null) {
            msg = $("#importMsg").text();
        }
        if (msg != "") {
            alert(msg);
        }
    });
</script>
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
