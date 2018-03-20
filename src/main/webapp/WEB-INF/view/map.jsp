<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }

        #allmap {
            width: 100%;
            height: 100%;
        }

        p {
            margin-left: 5px;
            font-size: 14px;
        }
    </style>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=3.0&ak=75NKDW73M2AYHu1xtPTGjDH1niOLCDbi"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <title>百度地图展示</title>
</head>
<body>
<div id="allmap"></div>
<%--<p>点击标注点，可查看由纯文本构成的简单型信息窗口</p>--%>
</body>
</html>
<script type="text/javascript" charset="UTF-8">

    // 百度地图API功能
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(117.23185, 30.13834);
    //    var marker = new BMap.Marker(point);  // 创建标注
    //    map.addOverlay(marker);              // 将标注添加到地图中
    map.centerAndZoom(point, 15);
    map.enableScrollWheelZoom(true); //启用滚轮放大缩小
    map.setMapType(BMAP_HYBRID_MAP);

    function getJson() {
        $.ajax({
                cache: false,
                type: "get",
                url: "${pageContext.request.contextPath}/table/mapjson",
                scriptCharset: "utf-8",
                async: true,
                success: function (result) {
//                    resjson = JSON.parse(result)
                    console.log(result)
                    resjson = JSON.parse(result);
                    for (var i = 0, l = resjson.length; i < l; i++) {

                        //设置标注的经纬度
                        var marker = new BMap.Marker(new BMap.Point(resjson[i]['jingdu'],resjson[i]['weidu']));

                        //把标注添加到地图上
                        map.addOverlay(marker);
                        var label = new BMap.Label(resjson[i]['didian'],{offset:new BMap.Size(20,-10)});
                        label.setStyle({
                            width: "120px",
                            color: '#fff',
                            background: '#ff8355',
                            border: '1px solid "#ff8355"',
                            borderRadius: "5px",
                            textAlign: "center",
                            height: "26px",
                            lineHeight: "26px"
                        });
                        marker.setLabel(label);


                        var content = "<table>";
                        content = content + "<tr><td>"+resjson[i]['didian']+"</td></tr>";
                        content = content + "<tr><td> "+resjson[i]['jiejuefangan']+"</td></tr>";
                        content = content + "<tr><td> "+resjson[i]['chulijieguo']+"</td></tr>";
                        content += "</table>";
                        var infowindow = new BMap.InfoWindow(content);
                        marker.addEventListener("click",function(){
                            this.openInfoWindow(infowindow);
                        });


//                    console.log(key+':'+resjson[i][key]);
//                        var pointRes = new BMap.Point(resjson[i]['jingdu'], resjson[i]['weidu']);
//                        var markeRres = new BMap.Marker(pointRes);  // 创建标注
//                        var optsRes = {
//                            width: 200,     // 信息窗口宽度
//                            height: 100,     // 信息窗口高度
//                            title: resjson[i]['didian'],
//                            enableMessage: true,//设置允许信息窗发送短息
//                            message: resjson[i]['jiejuefangan']
//                        };
//                        markeRres.setTitle(resjson[i]['didian'])
//                        map.addOverlay(markeRres);
////                        var infoWindow = new BMap.InfoWindow(resjson[i]['jiejuefangan'], optsRes);  // 创建信息窗口对象
////                        markeRres.addEventListener("click", function () {
////                            map.openInfoWindow(infoWindow, pointRes); //开启信息窗口
////                        });
                    }
                },
                error: function () {
                    toastr.error("程序异常!", "提示");
                }
            }
        );
    }

    getJson();
    //    resjson = getJson();

</script>
