<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>客户和联系人的交易统计柱形图</title>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/echarts/echarts.min.js"></script>

    <script type="text/javascript">
        $(function(){
            $.ajax({
                url:'workbench/chart/transaction/queryCountOfTranByContactsId.do',
                type:'post',
                datatype:'json',
                success:function(data){
                    var nameData = [];
                    var valueData = [];
                    for(var i = 0; i < data.length; i++){
                        var item = data[i];
                        nameData.push(item.name);
                        valueData.push(item.value);
                    }
                    //调用echarts函数，显示图标
                    var myChart=echarts.init(document.getElementById("main"));
                    var option = {
                        title: {
                            text: '客户和联系人的交易统计柱状图',
                            subtext: '忠实统计'
                        },
                        tooltip: {
                            trigger: 'axis'
                        },
                        legend: {
                            data: ['交易']
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                dataView: { show: true, readOnly: false },
                                magicType: { show: true, type: ['line', 'bar'] },
                                restore: { show: true },
                                saveAsImage: { show: true }
                            }
                        },
                        calculable: true,
                        xAxis: [
                            {
                                type: 'category',
                                // prettier-ignore
                                data: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                            }
                        ],
                        yAxis: [
                            {
                                type: 'value'
                            }
                        ],
                        series: [
                            {
                                name: '交易',
                                type: 'bar',
                                data: [
                                    2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3
                                ],
                                markPoint: {
                                    data: [
                                        { type: 'max', name: 'Max' },
                                        { type: 'min', name: 'Min' }
                                    ]
                                },
                                markLine: {
                                    data: [{ type: 'average', name: 'Avg' }]
                                },
                                color:{
                                    type: 'linear',
                                    x: 0,
                                    y: 0,
                                    x2: 0,
                                    y2: 1,
                                    colorStops: [{
                                        offset: 0, color: '#73c0de' // 0% 处的颜色
                                    }, {
                                        offset: 1, color: '#91cc75' // 100% 处的颜色
                                    }],
                                    global: false // 缺省为 false
                                }
                            }
                        ]
                    };
                    option.xAxis[0].data = nameData;
                    option.series[0].data = valueData;

                    myChart.setOption(option);
                }
            });




        });
    </script>
</head>

<body>
<div id="main" style="height: 500px; width: 600px;"></div>
</body>
</html>
