<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>公司线索数量饼状图</title>
    <script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="jquery/echarts/echarts.min.js"></script>

    <script type="text/javascript">
        $(function(){
            $.ajax({
                url:'workbench/chart/clue/queryCountOfCompanyByCompany.do',
                type:'post',
                datatype:'json',
                success:function(data){
                    //调用echarts函数，显示图标
                    var myChart=echarts.init(document.getElementById("main"));
                    var option = {
                        title:{
                            text: "公司线索数量饼状图",
                            subtext: "忠实公司",
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} <br/>{b} : {c} ({d}%)'
                        },
                        legend: {
                            top: 'top'
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
                                name: '线索数量',
                                type: 'pie',
                                radius: [50, 250],
                                center: ['50%', '50%'],
                                roseType: 'area',
                                itemStyle: {
                                    borderRadius: 8
                                },
                                data: data
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
