<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
<meta charset="UTF-8">
<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/echarts/echarts.min.js"></script>

	<script type="text/javascript">
		$(function(){
			showCustomerGraph();
			showContactsGraph();
			showTranStageGraph();

			function showTranStageGraph(){
				$.ajax({
					url:'workbench/chart/transaction/queryCountOfTranGroupByStage.do',
					type:'post',
					datatype:'json',
					success:function(data){
						//调用echarts函数，显示图标
						var myChart=echarts.init(document.getElementById("top_right"));
						var option = {
							title: {
								text: '交易统计图表',

							},
							tooltip: {
								trigger: 'item',
								formatter: '{a} <br/>{b} : {c}'
							},
							toolbox: {
								feature: {
									dataView: { readOnly: true },
									restore: {},
									saveAsImage: {}
								}
							},
							legend: {
								data: ['Show', 'Click', 'Visit', 'Inquiry', 'Order']
							},
							series: [
								{
									name: '交易数量',
									type: 'funnel',
									left: '10%',
									width: '80%',
									label: {
										formatter: '{b}'
									},
									labelLine: {
										show: true
									},
									itemStyle: {
										opacity: 0.7
									},
									emphasis: {
										label: {
											position: 'inside',
											formatter: '{b}: {c}'
										}
									},
									data: data
								}
							]
						};
						myChart.setOption(option);
					}
				});
			}

			//展示联系人关联的交易统计图表
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
						var myChart=echarts.init(document.getElementById("bottom_left"));
						var option = {
							title: {
								text: '联系人的交易统计柱状图',

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
												var colorList = ['rgb(153,204,245)','rgb(48,179,238)','rgb(9,79,241)','rgb(183,235,245)','rgb(142,170,127)','rgb(125,46,94)','rgb(195,129,135)'];
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

								}
							]
						};
						option.xAxis.data = nameData;
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
						var myChart=echarts.init(document.getElementById("bottom_right"));
						var option = {
							title: {
								text: '客户的交易统计柱状图',

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


		})
	</script>
</head>
<body>
<div id="main" style="height: 650px;width: 900px;background: url(image/home_bg.png) center center no-repeat;">

	<div id="top" style="height: 50%;width: 100%;">
		<div id="top_left" style="height: 100%;width: 50%;float: left;"></div>
		<div id="top_right" style="height: 100%;width: 50%;float: right;"></div>
	</div>

	<div id="bottom" style="height: 50%;width: 100%;">
		<div id="bottom_left" style="height: 100%;width: 50%;float: left;"></div>
		<div id="bottom_right" style="height: 100%;width: 50%;float: right;"></div>
	</div>
</div>
</body>
</html>