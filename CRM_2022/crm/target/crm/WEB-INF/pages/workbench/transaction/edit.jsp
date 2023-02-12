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

<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="jquery/bs_typeahead/bootstrap3-typeahead.min.js"></script>


	<script type="text/javascript">
		$(function(){

			//填充修改的交易数据
			editTran();

			//自动补全插件
			$("#edit-customerName").typeahead({
				//静态数据
				// source:['中华人民共和国','美利坚共和国','大不列颠英国']
				//动态数据
				source:function(jquery,process){
					$.ajax({
						url:'workbench/transaction/queryAllCustomerNameByName.do',
						data:{
							//jquery自动从文本框中获取输入的文本
							customerName:jquery
						},
						type:'post',
						datatype:'json',
						success:function(data){
							//process函数将{'','',''}数据转为['','','']
							process(data);
						}
					});
				}
			});

			//填充计算的可能性
			$("#edit-stage").change(computerPossibility);

			//给"保存"按钮添加单击事件
			$("#saveEditTranBtn").click(function(){
				var id = "${tran.id}";
				var owner = $("#edit-owner").val();
				var money = $("#edit-money").val();
				var name = $("#edit-name").val();
				var expectedDate = $("#edit-expectedDate").val();
				var customerName = $("#edit-customerName").val();
				var stage = $("#edit-stage").val();
				var type = $("#edit-type").val();
				var source = $("#edit-source").val();
				var activityId = $("#create-activityId").val();
				var contactsId = $("#create-contactsId").val();
				var description = $("#edit-description").val();
				var contactSummary = $("#edit-contactSummary").val();
				var nextContactTime = $("#edit-nextContactTime").val();
				//表单验证

				$.ajax({
					url:'workbench/tran/saveEditTran.do',
					data:{
						id:id,
						owner:owner,
						money:money,
						name:name,
						expectedDate:expectedDate,
						customerName:customerName,
						stage:stage,
						type:type,
						source:source,
						activityId:activityId,
						contactsId:contactsId,
						description:description,
						contactSummary:contactSummary,
						nextContactTime:nextContactTime
					},
					type:'post',
					datatype:'json',
					success:function(data){
						if(data.code=="1"){
							window.location.href="workbench/transaction/index.do";
						}else {
							alert(data.message);
						}
					}
				});
			});

			//给"关联市场活动"按钮添加单击事件
			$("#bundActivityBtn").click(function(){
				//清空模态窗口
				// $("#searchActivityTxt").val("");
				// $("#tbody").html("");
				//以下代码的解除关联有bug，疑似remove不能动态绑定
				var searchActivityTxt=$("#searchActivityTxt").val();
				if(searchActivityTxt!=""){
					$("#searchActivityTxt").keyup();
				}
				$("#selectActivityModel").modal("show");

			});

			//给市场活动搜索框添加键盘弹起事件
			$("#searchActivityTxt").keyup(function(){
				var activityName=this.value;
				$.ajax({
					url:'workbench/transaction/queryActivityForDetailByActivityName.do',
					data:{
						activityName:activityName,
					},
					type:'post',
					datatype:'json',
					success:function(data){
						var htmlStr="";
						$.each(data,function(index,obj){
							htmlStr+="<tr id=\"tr_"+obj.id+"\">";
							htmlStr+="	<td><input type=\"checkbox\" value='"+obj.id+"'/></td>";
							htmlStr+="	<td>"+obj.name+"</td>";
							htmlStr+="	<td>"+obj.startDate+"</td>";
							htmlStr+="	<td>"+obj.endDate+"</td>";
							htmlStr+="	<td>"+obj.owner+"</td>";
							htmlStr+="</tr>";
						});
						$("#tbody").html(htmlStr);
					}
				});
			});

			//给"关联"按钮添加单击事件
			$("#saveBundActivityBtn").click(function (){
				//获取列表中所有被选中的checkbox
				var checkedIds = $("#tbody input[type='checkbox']:checked");
				if(checkedIds.size()==0){
					alert("请选择要关联的市场活动");
					return;
				}
				if(checkedIds.size()>1){
					alert("请选择一个市场活动");
					return;
				}
				var activityId=""
				$.each(checkedIds,function(){
					activityId+=this.value;
				});
				$.ajax({
					url:'workbench/activity/queryActivityById.do',
					data: {
						id:activityId
					},
					type:'post',
					datetype:'json',
					success:function(data){
						$("#create-activityName").val(data.name);
					}
				});
				$("#create-activityId").val(activityId);

				$("#selectActivityModel").modal("hide");


			});

			//给"关联联系人"按钮添加单击事件
			$("#bundContactsBtn").click(function(){
				//清空模态窗口
				// $("#searchActivityTxt").val("");
				// $("#tbody").html("");
				//以下代码的解除关联有bug，疑似remove不能动态绑定
				var searchContactsTxt=$("#searchContactsTxt").val();
				if(searchContactsTxt!=""){
					$("#searchContactsTxt").keyup();
				}
				$("#selectContactsModel").modal("show");

			});

			//给联系人搜索框添加键盘弹起事件
			$("#searchContactsTxt").keyup(function(){
				var contactsName=this.value;
				$.ajax({
					url:'workbench/transaction/queryContactsForDetailByContactsName.do',
					data:{
						contactsName:contactsName,
					},
					type:'post',
					datatype:'json',
					success:function(data){
						var htmlStr="";
						$.each(data,function(index,obj){
							htmlStr+="<tr id=\"tr_"+obj.id+"\">";
							htmlStr+="	<td><input type=\"checkbox\" value='"+obj.id+"'/></td>";
							htmlStr+="	<td>"+obj.fullname+"</td>";
							htmlStr+="	<td>"+obj.email+"</td>";
							htmlStr+="	<td>"+obj.mphone+"</td>";
							htmlStr+="</tr>";
						});
						$("#tbody_bundContacts").html(htmlStr);
					}
				});
			});

			//给联系人的"关联"按钮添加单击事件
			$("#saveBundContactsBtn").click(function (){
				//获取列表中所有被选中的checkbox
				var checkedIds = $("#tbody_bundContacts input[type='checkbox']:checked");
				if(checkedIds.size()==0){
					alert("请选择要关联的联系人");
					return;
				}
				if(checkedIds.size()>1){
					alert("请选择一个联系人");
					return;
				}
				var contactsId=""
				$.each(checkedIds,function(){
					contactsId+=this.value;
				});
				$.ajax({
					url:'workbench/contacts/querycontactsById.do',
					data: {
						id:contactsId
					},
					type:'post',
					datetype:'json',
					success:function(data){
						$("#create-contactsName").val(data.fullname);
					}
				});


				$("#create-contactsId").val(contactsId);

				$("#selectContactsModel").modal("hide");


			});






			//根据阶段计算可能性
			function computerPossibility(){

				// var stageValue=$(this).find("option:selected").text();
				var stageValue=$("#edit-stage option:selected").text();
				if(stageValue==""){
					$("#edit-possibility").val("");
					return;
				}
				$.ajax({
					url:'workbench/transaction/getPossibilityByStage.do',
					data:{
						stageValue:stageValue
					},
					type:'post',
					datatype:'json',
					success:function(data){
						$("#edit-possibility").val(data);
					}
				});

			}

			function editTran(){
				$("#edit-id").val("${tran.id}");
				$("#edit-owner").val("${tran.owner}");
				$("#edit-money").val("${tran.money}");
				$("#edit-name").val("${tran.name}");
				$("#edit-expectedDate").val("${tran.expectedDate}");
				$("#edit-customerName").val("${tran.customerId}");
				$("#edit-stage").val("${tran.stage}");
				$("#edit-type").val("${tran.type}");
				$("#edit-source").val("${tran.source}");
				$("#create-activityName").val("${tran.activityId}");
				$("#create-contactsName").val("${tran.contactsId}");
				$("#edit-description").val("${tran.description}");
				$("#edit-contactSummary").val("${tran.contactSummary}");
				$("#edit-nextContactTime").val("${tran.nextContactTime}");
				computerPossibility();
			}

		})
	</script>
</head>
<body>
<!-- 查找市场活动模态窗口 -->
<div class="modal fade" id="selectActivityModel" role="dialog">
	<div class="modal-dialog" role="document" style="width: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">查找市场活动</h4>
			</div>
			<div class="modal-body">
				<div class="btn-group" style="position: relative; top: 18%; left: 8px;">
					<form class="form-inline" role="form">
						<div class="form-group has-feedback">
							<input type="text" id="searchActivityTxt" class="form-control" style="width: 300px;" placeholder="请输入市场活动名称，支持模糊查询">
							<span class="glyphicon glyphicon-search form-control-feedback"></span>
						</div>
					</form>
				</div>
				<table id="activityTable3" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
					<thead>
					<tr style="color: #B3B3B3;">
						<td></td>
						<td>名称</td>
						<td>开始日期</td>
						<td>结束日期</td>
						<td>所有者</td>
					</tr>
					</thead>
					<tbody id="tbody">
					<%--							<tr>--%>
					<%--								<td><input type="radio" name="activity"/></td>--%>
					<%--								<td>发传单</td>--%>
					<%--								<td>2020-10-10</td>--%>
					<%--								<td>2020-10-20</td>--%>
					<%--								<td>zhangsan</td>--%>
					<%--							</tr>--%>
					<%--							<tr>--%>
					<%--								<td><input type="radio" name="activity"/></td>--%>
					<%--								<td>发传单</td>--%>
					<%--								<td>2020-10-10</td>--%>
					<%--								<td>2020-10-20</td>--%>
					<%--								<td>zhangsan</td>--%>
					<%--							</tr>--%>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="saveBundActivityBtn">关联</button>
			</div>
		</div>
	</div>
</div>
<!-- 查找联系人模态窗口 -->
<div class="modal fade" id="selectContactsModel" role="dialog">
	<div class="modal-dialog" role="document" style="width: 80%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">查找联系人</h4>
			</div>
			<div class="modal-body">
				<div class="btn-group" style="position: relative; top: 18%; left: 8px;">
					<form class="form-inline" role="form">
						<div class="form-group has-feedback">
							<input type="text" id="searchContactsTxt" class="form-control" style="width: 300px;" placeholder="请输入联系人名称，支持模糊查询">
							<span class="glyphicon glyphicon-search form-control-feedback"></span>
						</div>
					</form>
				</div>
				<table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
					<thead>
					<tr style="color: #B3B3B3;">
						<td></td>
						<td>名称</td>
						<td>邮箱</td>
						<td>手机</td>
					</tr>
					</thead>
					<tbody id="tbody_bundContacts">
					<%--							<tr>--%>
					<%--								<td><input type="radio" name="activity"/></td>--%>
					<%--								<td>李四</td>--%>
					<%--								<td>lisi@bjpowernode.com</td>--%>
					<%--								<td>12345678901</td>--%>
					<%--							</tr>--%>
					<%--							<tr>--%>
					<%--								<td><input type="radio" name="activity"/></td>--%>
					<%--								<td>李四</td>--%>
					<%--								<td>lisi@bjpowernode.com</td>--%>
					<%--								<td>12345678901</td>--%>
					<%--							</tr>--%>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-primary" id="saveBundContactsBtn">关联</button>
			</div>
		</div>
	</div>
</div>


<%--	<!-- 查找市场活动 -->	--%>
<%--	<div class="modal fade" id="findMarketActivity" role="dialog">--%>
<%--		<div class="modal-dialog" role="document" style="width: 80%;">--%>
<%--			<div class="modal-content">--%>
<%--				<div class="modal-header">--%>
<%--					<button type="button" class="close" data-dismiss="modal">--%>
<%--						<span aria-hidden="true">×</span>--%>
<%--					</button>--%>
<%--					<h4 class="modal-title">查找市场活动</h4>--%>
<%--				</div>--%>
<%--				<div class="modal-body">--%>
<%--					<div class="btn-group" style="position: relative; top: 18%; left: 8px;">--%>
<%--						<form class="form-inline" role="form">--%>
<%--						  <div class="form-group has-feedback">--%>
<%--						    <input type="text" class="form-control" style="width: 300px;" placeholder="请输入市场活动名称，支持模糊查询">--%>
<%--						    <span class="glyphicon glyphicon-search form-control-feedback"></span>--%>
<%--						  </div>--%>
<%--						</form>--%>
<%--					</div>--%>
<%--					<table id="activityTable3" class="table table-hover" style="width: 900px; position: relative;top: 10px;">--%>
<%--						<thead>--%>
<%--							<tr style="color: #B3B3B3;">--%>
<%--								<td></td>--%>
<%--								<td>名称</td>--%>
<%--								<td>开始日期</td>--%>
<%--								<td>结束日期</td>--%>
<%--								<td>所有者</td>--%>
<%--							</tr>--%>
<%--						</thead>--%>
<%--						<tbody>--%>
<%--							<tr>--%>
<%--								<td><input type="radio" name="activity"/></td>--%>
<%--								<td>发传单</td>--%>
<%--								<td>2020-10-10</td>--%>
<%--								<td>2020-10-20</td>--%>
<%--								<td>zhangsan</td>--%>
<%--							</tr>--%>
<%--							<tr>--%>
<%--								<td><input type="radio" name="activity"/></td>--%>
<%--								<td>发传单</td>--%>
<%--								<td>2020-10-10</td>--%>
<%--								<td>2020-10-20</td>--%>
<%--								<td>zhangsan</td>--%>
<%--							</tr>--%>
<%--						</tbody>--%>
<%--					</table>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
	</div>

<%--	<!-- 查找联系人 -->	--%>
<%--	<div class="modal fade" id="findContacts" role="dialog">--%>
<%--		<div class="modal-dialog" role="document" style="width: 80%;">--%>
<%--			<div class="modal-content">--%>
<%--				<div class="modal-header">--%>
<%--					<button type="button" class="close" data-dismiss="modal">--%>
<%--						<span aria-hidden="true">×</span>--%>
<%--					</button>--%>
<%--					<h4 class="modal-title">查找联系人</h4>--%>
<%--				</div>--%>
<%--				<div class="modal-body">--%>
<%--					<div class="btn-group" style="position: relative; top: 18%; left: 8px;">--%>
<%--						<form class="form-inline" role="form">--%>
<%--						  <div class="form-group has-feedback">--%>
<%--						    <input type="text" class="form-control" style="width: 300px;" placeholder="请输入联系人名称，支持模糊查询">--%>
<%--						    <span class="glyphicon glyphicon-search form-control-feedback"></span>--%>
<%--						  </div>--%>
<%--						</form>--%>
<%--					</div>--%>
<%--					<table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">--%>
<%--						<thead>--%>
<%--							<tr style="color: #B3B3B3;">--%>
<%--								<td></td>--%>
<%--								<td>名称</td>--%>
<%--								<td>邮箱</td>--%>
<%--								<td>手机</td>--%>
<%--							</tr>--%>
<%--						</thead>--%>
<%--						<tbody>--%>
<%--							<tr>--%>
<%--								<td><input type="radio" name="activity"/></td>--%>
<%--								<td>李四</td>--%>
<%--								<td>lisi@bjpowernode.com</td>--%>
<%--								<td>12345678901</td>--%>
<%--							</tr>--%>
<%--							<tr>--%>
<%--								<td><input type="radio" name="activity"/></td>--%>
<%--								<td>李四</td>--%>
<%--								<td>lisi@bjpowernode.com</td>--%>
<%--								<td>12345678901</td>--%>
<%--							</tr>--%>
<%--						</tbody>--%>
<%--					</table>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
	
	
	<div style="position:  relative; left: 30px;">
		<h3>修改交易</h3>
	  	<div style="position: relative; top: -40px; left: 70%;">
			<button type="button" class="btn btn-primary" id="saveEditTranBtn">保存</button>
			<button type="button" class="btn btn-default" onclick="window.history.back()">取消</button>
		</div>
		<hr style="position: relative; top: -40px;">
	</div>
	<form class="form-horizontal" role="form" style="position: relative; top: -30px;">
		<div class="form-group">
			<label for="edit-owner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<select class="form-control" id="edit-owner">
					<c:forEach items="${userList}" var="u">
						<option value="${u.id}">${u.name}</option>
					</c:forEach>
				</select>
			</div>
			<label for="edit-money" class="col-sm-2 control-label">金额</label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="edit-money">
			</div>
		</div>
		
		<div class="form-group">
			<label for="edit-name" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="edit-name">
			</div>
			<label for="edit-expectedDate" class="col-sm-2 control-label">预计成交日期<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="edit-expectedDate">
			</div>
		</div>
		
		<div class="form-group">
			<label for="edit-customerName" class="col-sm-2 control-label">客户名称<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="edit-customerName" placeholder="支持自动补全，输入客户不存在则新建">
			</div>
			<label for="edit-stage" class="col-sm-2 control-label">阶段<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
			  <select class="form-control" id="edit-stage">
			  	<option></option>
				  <c:forEach items="${stageList}" var="sl">
					  <option value="${sl.id}">${sl.value}</option>
				  </c:forEach>
			  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="edit-type" class="col-sm-2 control-label">类型</label>
			<div class="col-sm-10" style="width: 300px;">
				<select class="form-control" id="edit-type">
				  <option></option>
					<c:forEach items="${transactionTypeList}" var="tt">
						<option value="${tt.id}">${tt.value}</option>
					</c:forEach>
				</select>
			</div>
			<label for="edit-possibility" class="col-sm-2 control-label">可能性</label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="edit-possibility" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="edit-source" class="col-sm-2 control-label">来源</label>
			<div class="col-sm-10" style="width: 300px;">
				<select class="form-control" id="edit-source">
				  <option></option>
					<c:forEach items="${sourceList}" var="s">
						<option value="${s.id}">${s.value}</option>
					</c:forEach>
				</select>
			</div>
			<label for="create-activityName" class="col-sm-2 control-label">市场活动源&nbsp;&nbsp;<a href="javascript:void(0);" id="bundActivityBtn"><span class="glyphicon glyphicon-search"></span></a></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="hidden" id="create-activityId" value="">
				<input type="text" class="form-control" id="create-activityName" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-contactsName" class="col-sm-2 control-label">联系人名称&nbsp;&nbsp;<a href="javascript:void(0);" id="bundContactsBtn"><span class="glyphicon glyphicon-search"></span></a></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="hidden" id="create-contactsId" value="">
				<input type="text" class="form-control" id="create-contactsName" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label for="edit-description" class="col-sm-2 control-label">描述</label>
			<div class="col-sm-10" style="width: 70%;">
				<textarea class="form-control" rows="3" id="edit-description"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
			<div class="col-sm-10" style="width: 70%;">
				<textarea class="form-control" rows="3" id="edit-contactSummary"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="edit-nextContactTime">
			</div>
		</div>
		
	</form>
</body>
</html>