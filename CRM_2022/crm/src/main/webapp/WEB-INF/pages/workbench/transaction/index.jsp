<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
<meta charset="UTF-8">

<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
<link href="jquery/bs_pagination-master/css/jquery.bs_pagination.min.css"  type="text/css" rel="stylesheet" />

<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>

<script type="text/javascript">

	$(function(){
		//给"创建"按钮添加单击事件
		$("#createTranBtn").click(function (){
			window.location.href="workbench/transaction/toSave.do";
		});

		//加载线索页面后，查询页面线索信息
		queryTranByConditionForPage(1,10);


		//给"查询"按钮添加单击事件
		$("#queryTranBtn").click(function(){
			queryTranByConditionForPage(1,$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
		});

		//给列表中所有checkBox添加点击事件    (给固有元素的子标签——动态元素添加鼠标单击事件）
		$("#tbodyTran").on("click","input[type='checkbox']",function(){
			//如果列表中所有的checkbox全部选中则"全选"按钮选中
			if($("#tbodyTran input[type='checkbox']:checked").size()==$("#tbodyTran input[type='checkbox']").size()){
				$("#checkAll").prop("checked",true);
			}else{
				$("#checkAll").prop("checked",false);
			}
		});

		//给"全选"按钮添加单击事件
		$("#checkAll").click(function(){
			//"全选"按钮选中则列表中所有checkbox选中，否则全不选中
			$("#tbodyTran input[type='checkbox']").prop("checked",this.checked);
		});

		//给"删除"按钮添加点击事件
		$("#deleteTranBtn").click(function (){
			//收集市场活动的ids
			var checkedIds = $("#tbodyTran input[type='checkbox']:checked");
			if(checkedIds.size()==0){
				alert("请选择要删除的市场活动");
				return;
			}
			if(window.confirm("确定删除市场活动吗？")){
				var ids = "";
				$.each(checkedIds,function (){
					ids += "id=" + this.value + "&";
				});
				ids = ids.substr(0,ids.length-1);
				$.ajax({
					url:'workbench/tran/deleteTranByIds.do',
					data:ids,
					type:'post',
					datatype:'json',
					success:function (data){
						if(data.code=="1"){
							queryTranByConditionForPage(1,$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
						}else{
							alert(data.message);
						}
					}
				});
			}
		});

		//给"修改"按钮添加点击事件
		$("#editTranBtn").click(function (){
			var checkedIds = $("#tbodyTran input[type='checkbox']:checked");
			if(checkedIds.size()==0){
				alert("请选择修改的市场活动");
				return;
			}
			if(checkedIds.size()>1){
				alert("每次只能修改一条市场活动");
				return;
			}
			var id = checkedIds[0].value;
			window.location.href="workbench/tran/queryTranById.do?id=" + id;
		});











		//根据条件分页查询线索函数
		function queryTranByConditionForPage(pageNo,pageSize){
			var owner			=$("#query-owner").val();
			var name			=$("#query-name").val();
			var customerName	=$("#query-customerName").val();
			var stage			=$("#query-stage").val();
			var type			=$("#query-type").val();
			var source			=$("#query-source").val();
			var contactsName	=$("#query-contactsName").val();



			$.ajax({
				url:'workbench/transaction/queryTranByConditionForPage.do',
				data:{
					owner		:owner		,
					name		:name		,
					customerName:customerName,
					stage		:stage		,
					type		:type		,
					source		:source		,
					contactsName:contactsName,
					pageNo:pageNo,
					pageSize:pageSize
				},
				type:'post',
				datatype:'json',
				success:function(data){
					//遍历活动列表
					var htmlStr = "";
					$.each(data.tranList,function(index,obj){
						htmlStr+="<tr>"
						htmlStr+="	<td><input type=\"checkbox\" value=\""+obj.id+"\"/></td>"
						htmlStr+="	<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='workbench/transaction/detailTran.do?id="+obj.id+"';\">"+obj.name+"</a></td>"
						htmlStr+="	<td>"+obj.customerId+"</td>"
						htmlStr+="	<td>"+obj.stage+"</td>"
						htmlStr+="	<td>"+obj.type+"</td>"
						htmlStr+="	<td>"+obj.owner+"</td>"
						htmlStr+="	<td>"+obj.source+"</td>"
						htmlStr+="	<td>"+obj.contactsId+"</td>"
						htmlStr+="</tr>"
					});
					$("#tbodyTran").html(htmlStr);

					//取消"全选"的选中状态
					$("#checkAll").prop("checked",false);

					//计算总页数
					var totalPages = 1;
					if(data.totalRows%pageSize==0){
						totalPages = data.totalRows/pageSize;
					}else{
						totalPages = parseInt(data.totalRows/pageSize)+1;
					}

					//对容器调用bs_pagination工具函数，显示翻页信息
					$("#demo_pag1").bs_pagination({
						currentPage:pageNo,

						rowsPerPage:pageSize,
						totalRows:data.totalRows,
						totalPages:totalPages,//总页数，必填参数

						visiblePageLinks:5,

						showGoToPage:true,
						showRowsPerPage:true,
						showRowsInfo:true,

						onChangePage:function (event,pageObj){
							queryTranByConditionForPage(pageObj.currentPage,pageObj.rowsPerPage);
						}
					});
				}
			});
		}

		
		
	});
	
</script>
</head>
<body>

	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>交易列表</h3>
			</div>
		</div>
	</div>
	
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
	
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input class="form-control" type="text" id="query-owner">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input class="form-control" type="text" id="query-name">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">客户名称</div>
				      <input class="form-control" type="text" id="query-customerName">
				    </div>
				  </div>
				  
				  <br>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">阶段</div>
					  <select class="form-control" id="query-stage">
					  	<option></option>
						  <c:forEach items="${stageList}" var="s">
							  <option value="${s.id}">${s.value}</option>
						  </c:forEach>
<%--					  	<option>资质审查</option>--%>
<%--					  	<option>需求分析</option>--%>
<%--					  	<option>价值建议</option>--%>
<%--					  	<option>确定决策者</option>--%>
<%--					  	<option>提案/报价</option>--%>
<%--					  	<option>谈判/复审</option>--%>
<%--					  	<option>成交</option>--%>
<%--					  	<option>丢失的线索</option>--%>
<%--					  	<option>因竞争丢失关闭</option>--%>
					  </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">类型</div>
					  <select class="form-control" id="query-type">
					  	<option></option>
						  <c:forEach items="${transactionTypeList}" var="tt">
							  <option value="${tt.id}">${tt.value}</option>
						  </c:forEach>
<%--					  	<option>已有业务</option>--%>
<%--					  	<option>新业务</option>--%>
					  </select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">来源</div>
				      <select class="form-control" id="query-source">
						  <option></option>
						  <c:forEach items="${sourceList}" var="s">
							  <option value="${s.id}">${s.value}</option>
						  </c:forEach>
<%--						  <option>广告</option>--%>
<%--						  <option>推销电话</option>--%>
<%--						  <option>员工介绍</option>--%>
<%--						  <option>外部介绍</option>--%>
<%--						  <option>在线商场</option>--%>
<%--						  <option>合作伙伴</option>--%>
<%--						  <option>公开媒介</option>--%>
<%--						  <option>销售邮件</option>--%>
<%--						  <option>合作伙伴研讨会</option>--%>
<%--						  <option>内部研讨会</option>--%>
<%--						  <option>交易会</option>--%>
<%--						  <option>web下载</option>--%>
<%--						  <option>web调研</option>--%>
<%--						  <option>聊天</option>--%>
						</select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">联系人名称</div>
				      <input class="form-control" type="text" id="query-contactsName">
				    </div>
				  </div>
				  
				  <button type="button" class="btn btn-default" id="queryTranBtn">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 10px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" id="createTranBtn"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" class="btn btn-default" id="editTranBtn"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" class="btn btn-danger" id="deleteTranBtn"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				
				
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" id="checkAll"/></td>
							<td>名称</td>
							<td>客户名称</td>
							<td>阶段</td>
							<td>类型</td>
							<td>所有者</td>
							<td>来源</td>
							<td>联系人名称</td>
						</tr>
					</thead>
					<tbody id="tbodyTran">
<%--						<tr>--%>
<%--							<td><input type="checkbox" /></td>--%>
<%--							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='workbench/transaction/detailTran.do?id=7721b2c049fa4933bc333a7b35aee80b';">龙门-测试交易011</a></td>--%>
<%--							<td>动力节点</td>--%>
<%--							<td>谈判/复审</td>--%>
<%--							<td>新业务</td>--%>
<%--							<td>zhangsan</td>--%>
<%--							<td>广告</td>--%>
<%--							<td>李四</td>--%>
<%--						</tr>--%>
<%--                        <tr class="active">--%>
<%--                            <td><input type="checkbox" /></td>--%>
<%--                            <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">动力节点-交易01</a></td>--%>
<%--                            <td>动力节点</td>--%>
<%--                            <td>谈判/复审</td>--%>
<%--                            <td>新业务</td>--%>
<%--                            <td>zhangsan</td>--%>
<%--                            <td>广告</td>--%>
<%--                            <td>李四</td>--%>
<%--                        </tr>--%>
					</tbody>
				</table>
				<div id="demo_pag1"></div>
			</div>
<%--			--%>
<%--			<div style="height: 50px; position: relative;top: 20px;">--%>
<%--				<div>--%>
<%--					<button type="button" class="btn btn-default" style="cursor: default;">共<b>50</b>条记录</button>--%>
<%--				</div>--%>
<%--				<div class="btn-group" style="position: relative;top: -34px; left: 110px;">--%>
<%--					<button type="button" class="btn btn-default" style="cursor: default;">显示</button>--%>
<%--					<div class="btn-group">--%>
<%--						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">--%>
<%--							10--%>
<%--							<span class="caret"></span>--%>
<%--						</button>--%>
<%--						<ul class="dropdown-menu" role="menu">--%>
<%--							<li><a href="#">20</a></li>--%>
<%--							<li><a href="#">30</a></li>--%>
<%--						</ul>--%>
<%--					</div>--%>
<%--					<button type="button" class="btn btn-default" style="cursor: default;">条/页</button>--%>
<%--				</div>--%>
<%--				<div style="position: relative;top: -88px; left: 285px;">--%>
<%--					<nav>--%>
<%--						<ul class="pagination">--%>
<%--							<li class="disabled"><a href="#">首页</a></li>--%>
<%--							<li class="disabled"><a href="#">上一页</a></li>--%>
<%--							<li class="active"><a href="#">1</a></li>--%>
<%--							<li><a href="#">2</a></li>--%>
<%--							<li><a href="#">3</a></li>--%>
<%--							<li><a href="#">4</a></li>--%>
<%--							<li><a href="#">5</a></li>--%>
<%--							<li><a href="#">下一页</a></li>--%>
<%--							<li class="disabled"><a href="#">末页</a></li>--%>
<%--						</ul>--%>
<%--					</nav>--%>
<%--				</div>--%>
<%--			</div>--%>
			
		</div>
		
	</div>
</body>
</html>