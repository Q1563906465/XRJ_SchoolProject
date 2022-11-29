<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>市场活动成效统计玫瑰图</title>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/echarts/echarts.min.js"></script>

    <script type="text/javascript">
        $(function(){
            $.ajax({
                url:'workbench/chart/activity/queryCountOfBundByActivity.do',
                type:'post',
                datatype:'json',
                success:function(data){
                    //调用echarts函数，显示图标
                    var myChart=echarts.init(document.getElementById("main"));
                    var option = {
                        title: {
                            text: '市场活动成效统计图',
                            subtext: '收益分布',
                            left: 'center'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} <br/>{b} : {c} ({d}%)'
                        },
                        legend: {
                            left: 'center',
                            top: 'bottom',
                            data: [
                                'rose1',
                                'rose2',
                                'rose3',
                                'rose4',
                                'rose5',
                                'rose6',
                                'rose7',
                                'rose8'
                            ]
                        },
                        toolbox: {
                            show: true,
                            feature: {
                                mark: { show: true },
                                dataView: { show: true, readOnly: false },
                                restore: { show: true },
                                saveAsImage: { show: true }
                            }
                        },
                        series: [
                            {
                                name: '联系人-市场活动数',
                                type: 'pie',
                                radius: [20, 140],
                                center: ['25%', '50%'],
                                roseType: 'radius',
                                itemStyle: {
                                    borderRadius: 5
                                },
                                label: {
                                    show: false
                                },
                                emphasis: {
                                    label: {
                                        show: true
                                    }
                                },
                                data: data.funnelVOContactsList
                            },
                            {
                                name: '线索-市场活动数',
                                type: 'pie',
                                radius: [20, 140],
                                center: ['75%', '50%'],
                                roseType: 'area',
                                itemStyle: {
                                    borderRadius: 5
                                },
                                data: data.funnelVOClueList
                            }
                        ]
                    };

                    myChart.setOption(option);
                }
            });




        });
    </script>
</head>

<body>
<div id="main" style="height: 800px; width: 1000px;"></div>
</body>
</html>
