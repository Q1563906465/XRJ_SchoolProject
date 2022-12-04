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
            showContactsGraph();
            showCustomerGraph();

            //展示联系人关联的交易统计图标
            function showContactsGraph(){
                $.ajax({
                    url:'workbench/chart/transaction/queryCountOfTranByContactsId.do',
                    type:'post',
                    datatype:'json',
                    success:function(data){
                        var nameData = [];
                        var valueData = [];
                        for(var i = 0; i < data[0].length; i++){
                            var item = data[0][i];
                            nameData.push(item.name);
                            valueData.push(item.value);
                        }
                        //调用echarts函数，显示图标
                        var myChart=echarts.init(document.getElementById("main"));
                        var option = {
                            title: {
                                text: '联系人的交易统计柱状图',
                                subtext: '联系人忠实统计'
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
                                        2, 5, 7, 23, 25, 76, 135, 162, 32, 20, 6, 3
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
                                    itemStyle: {
                                        //通常情况下：
                                        normal:{
                                            //每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                                            color: function (params){
                                                var colorList = ['rgb(164,205,238)','rgb(42,170,227)','rgb(25,46,94)','rgb(195,229,235)','rgb(142,170,127)','rgb(125,46,94)','rgb(195,129,135)'];
                                                return colorList[(data[0].length - params.dataIndex)%7];
                                            }
                                        },
                                        //鼠标悬停时：
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
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
            }

            //展示客户关联的交易统计图标
            function showCustomerGraph(){
                $.ajax({
                    url:'workbench/chart/transaction/queryCountOfTranByContactsId.do',
                    type:'post',
                    datatype:'json',
                    success:function(data){
                        var nameData = [];
                        var valueData = [];
                        for(var i = 0; i < data[1].length; i++){
                            var item = data[1][i];
                            nameData.push(item.name);
                            valueData.push(item.value);
                        }
                        //调用echarts函数，显示图标
                        var myChart=echarts.init(document.getElementById("main2"));
                        var option = {
                            title: {
                                text: '客户的交易统计柱状图',
                                subtext: '客户忠实统计'
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
                            xAxis: {
                                type: 'category',
                                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [
                                {
                                    data: [120, 200, 150, 80, 70, 110, 130],
                                    type: 'bar',
                                    markPoint: {
                                        data: [
                                            { type: 'max', name: 'Max' },
                                            { type: 'min', name: 'Min' }
                                        ]
                                    },
                                    markLine: {
                                        data: [{ type: 'average', name: 'Avg' }]
                                    },
                                    itemStyle: {
                                        //通常情况下：
                                        normal:{
                                            //每个柱子的颜色即为colorList数组里的每一项，如果柱子数目多于colorList的长度，则柱子颜色循环使用该数组
                                            color: function (params){
                                                var colorList = ['rgb(164,205,238)','rgb(42,170,227)','rgb(25,46,94)','rgb(195,229,235)','rgb(142,170,127)','rgb(125,46,94)','rgb(195,129,135)'];
                                                return colorList[params.dataIndex%7];
                                            }
                                        },
                                        //鼠标悬停时：
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    },

                                }
                            ]
                        };
                        option.xAxis.data = nameData;
                        option.series[0].data = valueData;

                        myChart.setOption(option);
                    }
                });
            }




        });
    </script>
</head>

<body>
<div id="main" style="height: 500px; width: 1000px;"></div>
<div id="main2" style="height: 500px; width: 1000px;"></div>
</body>
</html>
