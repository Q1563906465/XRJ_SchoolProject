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
		queryCustomerByConditionForPage(1,10);

		//给列表中所有checkBox添加点击事件    (给固有元素的子标签——动态元素添加鼠标单击事件）
		$("#tbodyCustomer").on("click","input[type='checkbox']",function(){
			//如果列表中所有的checkbox全部选中则"全选"按钮选中
			if($("#tbodyCustomer input[type='checkbox']:checked").size()==$("#tbodyCustomer input[type='checkbox']").size()){
				$("#checkAll").prop("checked",true);
			}else{
				$("#checkAll").prop("checked",false);
			}
		});

		//给"全选"按钮添加单击事件
		$("#checkAll").click(function(){
			//"全选"按钮选中则列表中所有checkbox选中，否则全不选中
			$("#tbodyCustomer input[type='checkbox']").prop("checked",this.checked);
		});



        //给"创建"按钮添加单击事件
        $("#createCustomerBtn").click(function(){
            //初始化
            $("#createCustomerForm")[0].reset();
            //弹出模态窗口
            $("#createCustomerModal").modal("show");
        });

        //给"保存"按钮添加单击事件
        $("#saveCreateCustomerBtn").click(function(){
            var owner=$("#create-owner").val();
            var name=$.trim($("#create-name").val());
            var website=$.trim($("#create-website").val());
            var phone=$.trim($("#create-phone").val());
            var contactSummary=$.trim($("#create-contactSummary").val());
            var nextContactTime=$.trim($("#create-nextContactTime").val());
            var description=$.trim($("#create-description").val());
            var address=$.trim($("#create-address").val());


            $.ajax({
                url:'workbench/customer/saveCreateCustomer.do',
                data:{
                    owner:owner,
                    name:name,
                    website:website,
                    phone:phone,
                    contactSummary:contactSummary,
                    nextContactTime:nextContactTime,
                    description:description,
                    address:address
                },
                type:'post',
                datatype:'json',
                success:function(data){
                    if(data.code=="1"){
                        $("#createCustomerModal").modal("hide");
                        //刷新线索页面，显示第一页数据，保持每页显示条数不变
                        queryCustomerByConditionForPage(1,$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
                    }else{
                        alert(data.message);
                        $("#createCustomerModal").modal("show");
                    }
                }
            });
        });

		//给"查询"按钮添加单击事件
		$("#queryCustomerBtn").click(function(){
			queryCustomerByConditionForPage(1,$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
		});

		//给"修改"按钮添加点击事件
		$("#editCustomerBtn").click(function (){
			var checkedIds = $("#tbodyCustomer input[type='checkbox']:checked");
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
				url:'workbench/customer/queryCustomerById.do',
				data:{
					id:id
				},
				type:'post',
				datatype:'json',
				success:function(data){
					//显示模态窗口的信息
					$("#edit-id").val(data.id);
					$("#edit-owner").val(data.owner);
					$("#edit-name").val(data.name);
					$("#edit-website").val(data.website);
					$("#edit-phone").val(data.phone);
					$("#edit-description").val(data.description);
					$("#edit-contactSummary").val(data.contactSummary);
					$("#edit-nextContactTime").val(data.nextContactTime);
					$("#edit-address").val(data.address);
					//弹出修改市场活动的模态窗口
					$("#editCustomerModal").modal("show");
				}
			});
		});


		//给"更新"按钮添加单击事件
		$("#saveEditCustomerBtn").click(function(){
			//收集修改的市场活动信息参数
			var id=$("#edit-id").val();
			var owner=$("#edit-owner").val();
			var name=$.trim($("#edit-name").val());
			var website=$.trim($("#edit-website").val());
			var phone=$.trim($("#edit-phone").val());
			var contactSummary=$.trim($("#edit-contactSummary").val());
			var nextContactTime=$.trim($("#edit-nextContactTime").val());
			var description=$.trim($("#edit-description").val());
			var address=$.trim($("#edit-address").val());

			$.ajax({
				url:'workbench/customer/saveEditCustomer.do',
				data:{
					id:id,
					owner:owner,
					name:name,
					website:website,
					phone:phone,
					contactSummary:contactSummary,
					nextContactTime:nextContactTime,
					description:description,
					address:address
				},
				type:'post',
				datatype:'json',
				success:function(data){
					if(data.code=="1"){
						$("#editCustomerModal").modal("hide");
						queryCustomerByConditionForPage($("#demo_pag1").bs_pagination("getOption","currentPage"),$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
					}else{
						alert(data.message);
						$("#editCustomerModal").modal("show");
					}
				}
			});
		});

		//给"删除"按钮添加点击事件
		$("#deleteCustomerBtn").click(function (){
			//收集市场活动的ids
			var checkedIds = $("#tbodyCustomer input[type='checkbox']:checked");
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
					url:'workbench/customer/deleteCustomerByIds.do',
					data:ids,
					type:'post',
					datatype:'json',
					success:function (data){
						if(data.code=="1"){
							queryCustomerByConditionForPage(1,$("#demo_pag1").bs_pagination("getOption","rowsPerPage"));
						}else{
							alert(data.message);
						}
					}
				});
			}
		});







		//根据条件分页查询线索函数
		function queryCustomerByConditionForPage(pageNo,pageSize){
			var name=$("#query-name").val();
			var owner=$("#query-owner").val();
			var phone=$("#query-phone").val();
			var website=$("#query-website").val();


			$.ajax({
				url:'workbench/customer/queryCustomerByConditionForPage.do',
				data:{
					name:name,
					owner:owner,
					phone:phone,
					website:website,
					pageNo:pageNo,
					pageSize:pageSize
				},
				type:'post',
				datatype:'json',
				success:function(data){
					//遍历客户列表
					var htmlStr = "";
					$.each(data.customerList,function(index,obj){
						htmlStr+="<tr>";
						htmlStr+="	<td><input type=\"checkbox\" value=\""+obj.id+"\"/></td>";
						htmlStr+="	<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='workbench/customer/detailCustomer.do?id="+obj.id+"';\">"+obj.name+"</a></td>";
						htmlStr+="	<td>"+obj.owner+"</td>";
						htmlStr+="	<td>"+obj.phone+"</td>";
						htmlStr+="	<td>"+obj.website+"</td>";
						htmlStr+="</tr>";

					});
					$("#tbodyCustomer").html(htmlStr);

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
							queryCustomerByConditionForPage(pageObj.currentPage,pageObj.rowsPerPage);
						}
					});
				}
			});
		}
		
	});
	
</script>
</head>
<body>

	<!-- 创建客户的模态窗口 -->
	<div class="modal fade" id="createCustomerModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel1">创建客户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="createCustomerForm" role="form">
					
						<div class="form-group">
							<label for="create-owner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-owner">
                                    <c:forEach items="${userList}" var="u">
                                        <option value="${u.id}">${u.name}</option>
                                    </c:forEach>
								</select>
							</div>
							<label for="create-name" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-name">
							</div>
						</div>
						
						<div class="form-group">
                            <label for="create-website" class="col-sm-2 control-label">公司网站</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="create-website">
                            </div>
							<label for="create-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-phone">
							</div>
						</div>
						<div class="form-group">
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
                                    <input type="text" class="form-control" id="create-nextContactTime">
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
					<button type="button" class="btn btn-primary" id="saveCreateCustomerBtn">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改客户的模态窗口 -->
	<div class="modal fade" id="editCustomerModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户</h4>
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
							<label for="edit-name" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-name" value="动力节点">
							</div>
						</div>
						
						<div class="form-group">
                            <label for="edit-website" class="col-sm-2 control-label">公司网站</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-website" value="http://www.bjpowernode.com">
                            </div>
							<label for="edit-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-phone" value="010-84846003">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="edit-description"></textarea>
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
                                    <textarea class="form-control" rows="1" id="edit-address">北京大兴大族企业湾</textarea>
                                </div>
                            </div>
                        </div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="saveEditCustomerBtn">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>客户列表</h3>
			</div>
		</div>
	</div>
	
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
	
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input class="form-control" type="text" id="query-name">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input class="form-control" type="text" id="query-owner">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司座机</div>
				      <input class="form-control" type="text" id="query-phone">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司网站</div>
				      <input class="form-control" type="text" id="query-website">
				    </div>
				  </div>
				  
				  <button type="button" class="btn btn-default" id="queryCustomerBtn">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" id="createCustomerBtn"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" class="btn btn-default" id="editCustomerBtn"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" class="btn btn-danger" id="deleteCustomerBtn"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" id="checkAll"/></td>
							<td>名称</td>
							<td>所有者</td>
							<td>公司座机</td>
							<td>公司网站</td>
						</tr>
					</thead>
					<tbody id="tbodyCustomer">
<%--						<tr>--%>
<%--							<td><input type="checkbox" /></td>--%>
<%--							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">动力节点</a></td>--%>
<%--							<td>zhangsan</td>--%>
<%--							<td>010-84846003</td>--%>
<%--							<td>http://www.bjpowernode.com</td>--%>
<%--						</tr>--%>
<%--                        <tr class="active">--%>
<%--                            <td><input type="checkbox" /></td>--%>
<%--                            <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.jsp';">动力节点</a></td>--%>
<%--                            <td>zhangsan</td>--%>
<%--                            <td>010-84846003</td>--%>
<%--                            <td>http://www.bjpowernode.com</td>--%>
<%--                        </tr>--%>
					</tbody>
				</table>
				<div id="demo_pag1"></div>
			</div>
			

			
		</div>
		
	</div>
</body>
</html>