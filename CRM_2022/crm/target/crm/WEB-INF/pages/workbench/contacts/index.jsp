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
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="jquery/bs_pagination-master/localization/en.js"></script>

<script type="text/javascript">

	$(function(){
		
		//定制字段
		$("#definedColumns > li").click(function(e) {
			//防止下拉菜单消失
	        e.stopPropagation();
	    });

		//加载线索页面后，查询页面线索信息
		queryContactsByConditionForPage(1,10);
		//对容器加载日历-工具函数
		$("#create-nextContactTime").datetimepicker({
			language:'zh-CN',
			format:'yyyy-mm-dd',
			minView:'month',
			initialDate:new Date(),
			autoclose:true,
			todayBtn:true,
			clearBtn:true
		});

		//给列表中所有checkBox添加点击事件    (给固有元素的子标签——动态元素添加鼠标单击事件）
		$("#tbodyContacts").on("click","input[type='checkbox']",function(){
			//如果列表中所有的checkbox全部选中则"全选"按钮选中
			if($("#tbodyContacts input[type='checkbox']:checked").size()==$("#tbodyContacts input[type='checkbox']").size()){
				$("#checkAll").prop("checked",true);
			}else{
				$("#checkAll").prop("checked",false);
			}
		});

		//给"全选"按钮添加单击事件
		$("#checkAll").click(function(){
			//"全选"按钮选中则列表中所有checkbox选中，否则全不选中
			$("#tbodyContacts input[type='checkbox']").prop("checked",this.checked);
		});

		//给"创建"按钮添加单击事件
		$("#createContactsBtn").click(function(){
			//初始化
			$("#createContactsForm")[0].reset();
			//弹出模态窗口
			$("#createContactsModal").modal("show");
		});

		//给"保存"按钮添加单击事件
		$("#saveCreateContactsBtn").click(function(){
			var fullname		=$("#create-fullname").val();
			var appellation		=$("#create-appellation option:selected")[0].value;
			var owner			=$("#create-owner").val();
			var source			=$("#create-source option:selected")[0].value;
			var job				=$.trim($("#create-job").val());
			var mphone			=$.trim($("#create-mphone").val());
			var email			=$.trim($("#create-email").val());
			var customerId		=$.trim($("#create-customerNameList").text());
			var description		=$.trim($("#create-description").val());
			var contactSummary	=$.trim($("#create-contactSummary").val());
			var nextContactTime	=$.trim($("#create-nextContactTime").val());
			var address			=$.trim($("#create-address").val());


			$.ajax({
				url:'workbench/contacts/saveCreateContacts.do',
				data:{
					fullname		:fullname		,
					appellation		:appellation		,
					owner			:owner			,
					source			:source			,
					job				:job				,
					mphone			:mphone			,
					email			:email			,
					customerId		:customerId		,
					description		:description		,
					contactSummary	:contactSummary	,
					nextContactTime	:nextContactTime	,
					address			:address
				},
				type:'post',
				datatype:'json',
				success:function(data){
					if(data.code=="1"){
						$("#createContactsModal").modal("hide");
						//刷新线索页面，显示第一页数据，保持每页显示条数不变
						queryContactsByConditionForPage(1,$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
					}else{
						alert(data.message);
						$("#createContactsModal").modal("show");
					}
				}
			});
		});

		//给创建模块的客户文本框添加键盘弹起事件
		$("#create-customer").keyup(function(){
			var customerName=this.value;
			$.ajax({
				url:'workbench/contacts/queryAllCustomerByName.do',
				data:{
					customerName:customerName,
				},
				type:'post',
				datatype:'json',
				success:function(data){
					$("#create-customerNameList").empty();
					var htmlStr="";
					$.each(data,function(index,obj){
						htmlStr+="<option value=\""+obj.name+"\">"+obj.id+"</option>";
					});
					$("#create-customerNameList").append(htmlStr);
				}
			});
		});
		//给修改模块的客户文本框添加键盘弹起事件
		$("#edit-customer").keyup(function(){
			var customerName=this.value;
			$.ajax({
				url:'workbench/contacts/queryAllCustomerByName.do',
				data:{
					customerName:customerName,
				},
				type:'post',
				datatype:'json',
				success:function(data){
					$("#create-customerNameList").empty();
					var htmlStr="";
					$.each(data,function(index,obj){
						htmlStr+="<option value=\""+obj.name+"\">"+obj.id+"</option>";
					});
					$("#create-customerNameList").append(htmlStr);
				}
			});
		});

		//给"查询"按钮添加单击事件
		$("#queryContactsBtn").click(function(){
			queryContactsByConditionForPage(1,$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
		});

		//给"删除"按钮添加点击事件
		$("#deleteContactsBtn").click(function (){
			//收集市场活动的ids
			var checkedIds = $("#tbodyContacts input[type='checkbox']:checked");
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
					url:'workbench/contacts/deleteContactsByIds.do',
					data:ids,
					type:'post',
					datatype:'json',
					success:function (data){
						if(data.code=="1"){
							queryContactsByConditionForPage(1,$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
						}else{
							alert(data.message);
						}
					}
				});
			}
		});

		//给"修改"按钮添加点击事件
		$("#editContactsBtn").click(function (){
			var checkedIds = $("#tbodyContacts input[type='checkbox']:checked");
			if(checkedIds.size()==0){
				alert("请选择修改的市场活动");
				return;
			}
			if(checkedIds.size()>1){
				alert("每次只能修改一条市场活动");
				return;
			}
			var id = checkedIds[0].value;
			$.ajax({
				url:'workbench/contacts/querycontactsById.do',
				data:{
					id:id
				},
				type:'post',
				datatype:'json',
				success:function(data){
					//显示模态窗口的信息
					$("#edit-id").val(data.id);
					// $("#edit-owner").val(data.owner);
					$("#edit-source").val(data.source);
					$("#edit-fullname").val(data.fullname);
					$("#edit-appellation").val(data.appellation);
					$("#edit-job").val(data.job);
					$("#edit-mphone").val(data.mphone);
					$("#edit-email").val(data.email);
					$("#edit-customer").val(data.customerId);
					$("#edit-description").val(data.description);
					$("#edit-contactSummary").val(data.contactSummary);
					$("#edit-nextContactTime").val(data.nextContactTime);
					$("#edit-address").val(data.address);
					//弹出修改市场活动的模态窗口
					$("#editContactsModal").modal("show");
				}
			});
		});

		//给"更新"按钮添加单击事件
		$("#saveEditContactsBtn").click(function(){
			//收集修改的市场活动信息参数
			var id=$("#edit-id").val();
			var owner=$("#edit-owner").val();
			var source=$("#edit-source").val();
			var customerId=$.trim($("#create-customerNameList").text());
			var fullname=$("#edit-fullname").val();
			var appellation=$("#edit-appellation").val();
			var email=$.trim($("#edit-email").val());
			var mphone=$.trim($("#edit-mphone").val());
			var job=$.trim($("#edit-job").val());
			var description=$.trim($("#edit-description").val());
			var contactSummary=$.trim($("#edit-contactSummary").val());
			var nextContactTime=$.trim($("#edit-nextContactTime").val());
			var address=$.trim($("#edit-address").val());

			$.ajax({
				url:'workbench/contacts/saveEditContacts.do',
				data:{
					id:id,
					owner:owner,
					source:source,
					customerId:customerId,
					fullname:fullname,
					appellation:appellation,
					email:email,
					mphone:mphone,
					job:job,
					description:description,
					contactSummary:contactSummary,
					nextContactTime:nextContactTime,
					address:address
				},
				type:'post',
				datatype:'json',
				success:function(data){
					if(data.code=="1"){
						$("#editContactsModal").modal("hide");
						queryContactsByConditionForPage($("#demo_pag1").bs_pagination("getOption","currentPage"),$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
					}else{
						alert(data.message);
						$("#editContactsModal").modal("show");
					}
				}
			});
		});




		//根据条件分页查询线索函数
		function queryContactsByConditionForPage(pageNo,pageSize){
			var owner	=$("#query-owner").val();
			var fullname=$("#query-fullname").val();
			var customer=$("#query-customer").val();
			var source	=$("#query-source").val();

			$.ajax({
				url:'workbench/contacts/queryContactsByConditionForPage.do',
				data:{
					owner	:owner	,
					fullname:fullname,
					customer:customer,
					source	:source,
					pageNo:pageNo,
					pageSize:pageSize
				},
				type:'post',
				datatype:'json',
				success:function(data){
					//遍历活动列表
					var htmlStr = "";
					$.each(data.contactsList,function(index,obj){
						htmlStr+="<tr>"
						htmlStr+="	<td><input type=\"checkbox\" value=\""+obj.id+"\"/></td>"
						htmlStr+="	<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='workbench/contacts/detailContacts.do?id="+obj.id+"';\">"+obj.fullname+"</a></td>"
						htmlStr+="	<td>"+obj.customerId+"</td>"
						htmlStr+="	<td>"+obj.owner+"</td>"
						htmlStr+="	<td>"+obj.source+"</td>"
						htmlStr+="</tr>"
					});
					$("#tbodyContacts").html(htmlStr);

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
							queryContactsByConditionForPage(pageObj.currentPage,pageObj.rowsPerPage);
						}
					});
				}
			});
		}
		
	});
	
</script>
</head>
<body>

	
	<!-- 创建联系人的模态窗口 -->
	<div class="modal fade" id="createContactsModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" onclick="$('#createContactsModal').modal('hide');">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabelx">创建联系人</h4>
				</div>
				<div class="modal-body">
					<form id="createContactsForm" class="form-horizontal" role="form" >
					
						<div class="form-group">
							<label for="create-owner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-owner">
									<c:forEach items="${userList}" var="u">
										<option value="${u.id}">${u.name}</option>
									</c:forEach>
								</select>
							</div>
							<label for="create-source" class="col-sm-2 control-label">线索来源</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-source">
								  <option></option>
								  <option>广告</option>
									<c:forEach items="${sourceList}" var="sl">
										<option value="${sl.id}">${sl.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-fullname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-fullname">
							</div>
							<label for="create-appellation" class="col-sm-2 control-label">称呼</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-appellation">
								  <option></option>
									<c:forEach items="${appellationList}" var="app">
										<option value="${app.id}">${app.value}</option>
									</c:forEach>
								</select>
							</div>
							
						</div>
						
						<div class="form-group">
							<label for="create-job" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-job">
							</div>
							<label for="create-mphone" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-mphone">
							</div>
						</div>
						
						<div class="form-group" style="position: relative;">
							<label for="create-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-email">
							</div>
<%--							<label for="create-birth" class="col-sm-2 control-label">生日</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<input type="text" class="form-control" id="create-birth">--%>
<%--							</div>--%>
						</div>
						
						<div class="form-group" style="position: relative;">
							<label for="create-customer" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-customer" list="create-customerNameList" placeholder="支持自动补全">
								<datalist id="create-customerNameList">
								</datalist>
							</div>
						</div>
						
						<div class="form-group" style="position: relative;">
							<label for="create-description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="create-description"></textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>
						
						<div style="position: relative;top: 15px;">
							<div class="form-group">
								<label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
								<div class="col-sm-10" style="width: 81%;">
									<textarea class="form-control" rows="3" id="create-contactSummary"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
								<div class="col-sm-10" style="width: 300px;">
									<input type="text" class="form-control" id="create-nextContactTime" readonly>
								</div>
							</div>
						</div>

                        <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="create-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="create-address"></textarea>
                                </div>
                            </div>
                        </div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="saveCreateContactsBtn">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改联系人的模态窗口 -->
	<div class="modal fade" id="editContactsModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel1">修改联系人</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<input type="hidden" id="edit-id">
						<div class="form-group">
							<label for="edit-owner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-owner">
									<c:forEach items="${userList}" var="u">
										<option value="${u.id}">${u.name}</option>
									</c:forEach>
								</select>
							</div>
							<label for="edit-source" class="col-sm-2 control-label">来源</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-source">
								  <option></option>
									<c:forEach items="${sourceList}" var="sl">
										<option value="${sl.id}">${sl.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-fullname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-fullname" value="李四">
							</div>
							<label for="edit-appellation" class="col-sm-2 control-label">称呼</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-appellation">
								  <option></option>
									<c:forEach items="${appellationList}" var="app">
										<option value="${app.id}">${app.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-job" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-job" value="CTO">
							</div>
							<label for="edit-mphone" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-mphone" value="12345678901">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-email" value="lisi@bjpowernode.com">
							</div>
<%--							<label for="edit-birth" class="col-sm-2 control-label">生日</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<input type="text" class="form-control" id="edit-birth">--%>
<%--							</div>--%>
						</div>
						
						<div class="form-group">
							<label for="edit-customer" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-customer" list="create-customerNameList" placeholder="支持自动补全，输入客户" value="动力节点">
<%--								<datalist id="edit-customerNameList"></datalist>--%>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="edit-description">这是一条线索的描述信息</textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>
						
						<div style="position: relative;top: 15px;">
							<div class="form-group">
								<label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
								<div class="col-sm-10" style="width: 81%;">
									<textarea class="form-control" rows="3" id="edit-contactSummary"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
								<div class="col-sm-10" style="width: 300px;">
									<input type="text" class="form-control" id="edit-nextContactTime">
								</div>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="edit-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="edit-address">北京大兴区大族企业湾</textarea>
                                </div>
                            </div>
                        </div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="saveEditContactsBtn">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>联系人列表</h3>
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
				      <div class="input-group-addon">姓名</div>
				      <input class="form-control" type="text" id="query-fullname">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">客户名称</div>
				      <input class="form-control" type="text" id="query-customer">
				    </div>
				  </div>
				  
				  <br>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">来源</div>
				      <select class="form-control" id="query-source">
						  <option></option>
						  <c:forEach items="${sourceList}" var="sl">
							  <option value="${sl.id}">${sl.value}</option>
						  </c:forEach>
						</select>
				    </div>
				  </div>
				  
<%--				  <div class="form-group">--%>
<%--				    <div class="input-group">--%>
<%--				      <div class="input-group-addon">生日</div>--%>
<%--				      <input class="form-control" type="text">--%>
<%--				    </div>--%>
<%--				  </div>--%>
				  
				  <button type="button" class="btn btn-default" id="queryContactsBtn">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 10px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" id="createContactsBtn"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" class="btn btn-default" id="editContactsBtn"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" class="btn btn-danger" id="deleteContactsBtn"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				
				
			</div>
			<div style="position: relative;top: 20px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" id="checkAll"/></td>
							<td>姓名</td>
							<td>客户名称</td>
							<td>所有者</td>
							<td>来源</td>
<%--							<td>生日</td>--%>
						</tr>
					</thead>
					<tbody id="tbodyContacts">
<%--						<tr>--%>
<%--							<td><input type="checkbox" /></td>--%>
<%--							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">李四</a></td>--%>
<%--							<td>动力节点</td>--%>
<%--							<td>zhangsan</td>--%>
<%--							<td>广告</td>--%>
<%--							<td>2000-10-10</td>--%>
<%--						</tr>--%>
<%--                        <tr class="active">--%>
<%--                            <td><input type="checkbox" /></td>--%>
<%--                            <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">李四</a></td>--%>
<%--                            <td>动力节点</td>--%>
<%--                            <td>zhangsan</td>--%>
<%--                            <td>广告</td>--%>
<%--                            <td>2000-10-10</td>--%>
<%--                        </tr>--%>
					</tbody>
				</table>
				<div id="demo_pag1"></div>
			</div>
			
<%--			<div style="height: 50px; position: relative;top: 10px;">--%>
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