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
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

	//默认情况下取消和保存按钮是隐藏的
	var cancelAndSaveBtnDefault = true;
	
	$(function(){
		$("#remark").focus(function(){
			if(cancelAndSaveBtnDefault){
				//设置remarkDiv的高度为130px
				$("#remarkDiv").css("height","130px");
				//显示
				$("#cancelAndSaveBtn").show("2000");
				cancelAndSaveBtnDefault = false;
			}
		});
		
		$("#cancelBtn").click(function(){
			//显示
			$("#cancelAndSaveBtn").hide();
			//设置remarkDiv的高度为130px
			$("#remarkDiv").css("height","90px");
			cancelAndSaveBtnDefault = true;
		});
		
		// $(".remarkDiv").mouseover(function(){
		// 	$(this).children("div").children("div").show();
		// });
		//
		// $(".remarkDiv").mouseout(function(){
		// 	$(this).children("div").children("div").hide();
		// });
		//
		// $(".myHref").mouseover(function(){
		// 	$(this).children("span").css("color","red");
		// });
		//
		// $(".myHref").mouseout(function(){
		// 	$(this).children("span").css("color","#E6E6E6");
		// });
		//给备注修改和删除动态添加鼠标事件
		$("#remarkDivList").on("mouseover",".remarkDiv",function(){
			$(this).children("div").children("div").show();
		});

		$("#remarkDivList").on("mouseout",".remarkDiv",function(){
			$(this).children("div").children("div").hide();
		});

		$("#remarkDivList").on("mouseover",".myHref",function(){
			$(this).children("span").css("color","red");
		});

		$("#remarkDivList").on("mouseout",".myHref",function(){
			$(this).children("span").css("color","#E6E6E6");
		});

		//给"修改"图标添加单击事件
		$("#remarkDivList").on("click","a[name='editA']",function(){
			//获取修改的备注id和noteContent
			var id=$(this).attr("remarkId");
			var noteContent=$("#div_"+id+" h5").text();
			$("#edit-id").val(id);
			$("#edit-noteContent").val(noteContent);
			$("#editRemarkModal").modal("show");
		})

		//给"更新"按钮添加单击事件
		$("#updateRemarkBtn").click(function(){
			var id=$("#edit-id").val();
			var noteContent=$.trim($("#edit-noteContent").val());
			if(noteContent==""){
				alert("备注内容不能空");
				return;
			}
			$.ajax({
				url:'workbench/contacts/saveEditContactsRemark.do',
				data:{
					id:id,
					noteContent:noteContent
				},
				type:'post',
				dataType:'json',
				success:function(data){
					if(data.code=="1"){
						$("#editRemarkModal").modal("hide");
						//刷新备注列表
						$("#div_"+data.retData.id+" h5").text(data.retData.noteContent);
						$("#div_"+data.retData.id+" small").text(" "+data.retData.editTime+"由${sessionScope.sessionUser.name}修改");
					}else{
						alert(data.message);
						$("#editRemarkModal").modal("show");
					}
				}
			});
		})

		//给所有的"删除"图标添加单击事件
		$("#remarkDivList").on("click","a[name='deleteA']",function(){
			var id=$(this).attr("remarkId");

			$.ajax({
				url:'workbench/contacts/deleteContactsRemarkById.do',
				data:{
					id:id
				},
				type:'post',
				dataType:'json',
				success:function(data){
					if(data.code=="1"){
						$("#div_"+id).remove();
					}else{
						alert(data.message);
					}
				}
			});
		});

		//给备注"保存"按钮添加单击事件
		$("#saveCreateContactsRemarkBtn").click(function(){
			var noteContent=$("#remark").val();
			if(noteContent==""){
				alert("备注不能为空");
				return;
			}
			var contactsId='${contacts.id}';

			$.ajax({
				url:'workbench/contacts/saveCreateContactsRemark.do',
				data:{
					contactsId:contactsId,
					noteContent:noteContent,
				},
				type:'post',
				datatype:'json',
				success:function(data){
					if(data.code=="1"){
						$("#remark").val("");
						var htmlStr="";
						htmlStr+="<div class=\"remarkDiv\" id=\"div_"+data.retData.id+"\" style=\"height: 60px;\">";
						htmlStr+="	<img title=\""+data.retData.id+"\" src=\"image/user-thumbnail.png\" style=\"width: 30px; height:30px;\">";
						htmlStr+="	<div style=\"position: relative; top: -40px; left: 40px;\" >";
						htmlStr+="	<h5>"+data.retData.noteContent+"</h5>";
						htmlStr+="		<font color=\"gray\">联系人</font> <font color=\"gray\">-</font> <b>${contacts.fullname.concat(contacts.appellation)}-${contacts.customerId}</b> <small style=\"color: gray;\">"+data.retData.createTime+" 由${sessionScope.sessionUser.name}创建</small>";
						htmlStr+="		<div style=\"position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;\">";
						htmlStr+="			<a class=\"myHref\" name=\"editA\" remarkId=\""+data.retData.id+"\" href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-edit\" style=\"font-size: 20px; color: #E6E6E6;\"></span></a>";
						htmlStr+="			&nbsp;&nbsp;&nbsp;&nbsp;";
						htmlStr+="			<a class=\"myHref\" name=\"deleteA\" remarkId=\""+data.retData.id+"\" href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-remove\" style=\"font-size: 20px; color: #E6E6E6;\"></span></a>";
						htmlStr+="		</div>";
						htmlStr+="	</div>";
						htmlStr+="</div>";
						$("#remarkDiv").before(htmlStr);
					}else{
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
			$("#bundModal").modal("show");

		});

		//给市场活动搜索框添加键盘弹起事件
		$("#searchActivityTxt").keyup(function(){
			var activityName=this.value;
			var contactsId='${contacts.id}';
			$.ajax({
				url:'workbench/contacts/queryActivityForDetailByNameContactsId.do',
				data:{
					activityName:activityName,
					contactsId:contactsId
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
			var ids=""
			$.each(checkedIds,function(){
				ids+="activityId="+this.value+"&";
			});
			ids+="contactsId=${contacts.id}";

			$.ajax({
				url:'workbench/contacts/saveBund.do',
				data:ids,
				type:'post',
				datetype:'json',
				success:function(data){
					if(data.code=="1"){
						$("#bundModal").modal("hide");

						var htmlStr="";
						$.each(data.retData,function(index,obj){
							htmlStr+="<tr id=\"tr_"+obj.id+"\">";
							htmlStr+="<td>"+obj.name+"</td>";
							htmlStr+="<td>"+obj.startDate+"</td>";
							htmlStr+="<td>"+obj.endDate+"</td>";
							htmlStr+="<td>"+obj.owner+"</td>";
							htmlStr+="<td><a href=\"javascript:void(0);\" activityId=\""+obj.id+"\" style=\"text-decoration: none;\"><span class=\"glyphicon glyphicon-remove\"></span>解除关联</a></td>";
							htmlStr+="</tr>";
						});
						$("#relationTbody").append(htmlStr);
					}else{
						alert(data.message);
						$("#bundModal").modal("show");
					}
				}
			});

		});

		//给所有的"解除关联"按钮添加单击事件
		$("#relationTbody").on("click","a",function(){
			if(window.confirm("确定删除吗？")){
				var activityId=$(this).attr("activityId");
				var contactsId="${contacts.id}";
				$.ajax({
					url:'workbench/contacts/saveUnbund.do',
					data:{
						activityId:activityId,
						contactsId:contactsId
					},
					type:'post',
					datatype:'json',
					success:function(data){
						if(data.code=="1"){
							//移除关联的市场活动
							$("#tr_"+activityId).remove();
						}else{
							alert(data.message);
						}
					}
				});
			}
		});



		//给列表中所有checkBox添加点击事件    (给固有元素的子标签——动态元素添加鼠标单击事件）
		$("#tbody").on("click","input[type='checkbox']",function(){
			//如果列表中所有的checkbox全部选中则"全选"按钮选中
			if($("#tbody input[type='checkbox']:checked").size()==$("#tbody input[type='checkbox']").size()){
				$("#checkAll").prop("checked",true);
			}else{
				$("#checkAll").prop("checked",false);
			}
		});

		//给"全选"按钮添加单击事件
		$("#checkAll").click(function(){
			//"全选"按钮选中则列表中所有checkbox选中，否则全不选中
			$("#tbody input[type='checkbox']").prop("checked",this.checked);
		});

		queryTranForDetailByContactsId();
		//查询此客户的交易信息
		function queryTranForDetailByContactsId(){
			var contactsId = '${contacts.id}';
			$.ajax({
				url:'workbench/contacts/queryTranForDetailByContactsId.do',
				data:{
					contactsId:contactsId
				},
				type:'post',
				datatype:'json',
				success:function(data){
					//遍历交易详情
					var htmlStr="";
					$.each(data, function(index, obj){
						htmlStr+="<tr>";
						htmlStr+="	<td><a href=\"workbench/transaction/detailTran.do?id="+obj.id+"\" style=\"text-decoration: none;\">"+obj.name+"</a></td>";
						htmlStr+="	<td>"+obj.money+"</td>";
						htmlStr+="	<td>"+obj.stage+"</td>";
						htmlStr+="	<td>"+obj.expectedDate+"</td>";
						htmlStr+="	<td>"+obj.type+"</td>";
						// htmlStr+="	<td><a href=\"workbench/tran/deleteTranByIds.do?id="+obj.id+"\" style=\"text-decoration: none;\"><span class=\"glyphicon glyphicon-remove\"></span>删除</a></td>";
						htmlStr+="</tr>";
					});
					$("#tbody_bundTran").html(htmlStr);
				}
			})
		}





	});
	
</script>

</head>
<body>
<!-- 修改市场活动备注的模态窗口 -->
<div class="modal fade" id="editRemarkModal" role="dialog">
	<%-- 备注的id --%>
	<input type="hidden" id="remarkId">
	<div class="modal-dialog" role="document" style="width: 40%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改备注</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form">
					<input type="hidden" id="edit-id">
					<div class="form-group">
						<label for="edit-noteContent" class="col-sm-2 control-label">内容</label>
						<div class="col-sm-10" style="width: 81%;">
							<textarea class="form-control" rows="3" id="edit-noteContent"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="updateRemarkBtn">更新</button>
			</div>
		</div>
	</div>
</div>

	<!-- 解除联系人和市场活动关联的模态窗口 -->
	<div class="modal fade" id="unbundActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 30%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">解除关联</h4>
				</div>
				<div class="modal-body">
					<p>您确定要解除该关联关系吗？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">解除</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 市场活动关联的模态窗口 -->
	<div class="modal fade" id="bundModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 80%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">关联市场活动</h4>
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
					<table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
						<thead>
							<tr style="color: #B3B3B3;">
								<td><input id="checkAll" type="checkbox"/></td>
								<td>名称</td>
								<td>开始日期</td>
								<td>结束日期</td>
								<td>所有者</td>
								<td></td>
							</tr>
						</thead>
						<tbody id="tbody">
<%--							<tr>--%>
<%--								<td><input type="checkbox"/></td>--%>
<%--								<td>发传单</td>--%>
<%--								<td>2020-10-10</td>--%>
<%--								<td>2020-10-20</td>--%>
<%--								<td>zhangsan</td>--%>
<%--							</tr>--%>
<%--							<tr>--%>
<%--								<td><input type="checkbox"/></td>--%>
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
	
<%--	<!-- 修改联系人的模态窗口 -->--%>
<%--	<div class="modal fade" id="editContactsModal" role="dialog">--%>
<%--		<div class="modal-dialog" role="document" style="width: 85%;">--%>
<%--			<div class="modal-content">--%>
<%--				<div class="modal-header">--%>
<%--					<button type="button" class="close" data-dismiss="modal">--%>
<%--						<span aria-hidden="true">×</span>--%>
<%--					</button>--%>
<%--					<h4 class="modal-title" id="myModalLabel">修改联系人</h4>--%>
<%--				</div>--%>
<%--				<div class="modal-body">--%>
<%--					<form class="form-horizontal" role="form">--%>
<%--					--%>
<%--						<div class="form-group">--%>
<%--							<label for="edit-contactsOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<select class="form-control" id="edit-contactsOwner">--%>
<%--								  <option selected>zhangsan</option>--%>
<%--								  <option>lisi</option>--%>
<%--								  <option>wangwu</option>--%>
<%--								</select>--%>
<%--							</div>--%>
<%--							<label for="edit-clueSource" class="col-sm-2 control-label">来源</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<select class="form-control" id="edit-clueSource">--%>
<%--								  <option></option>--%>
<%--								  <option selected>广告</option>--%>
<%--								  <option>推销电话</option>--%>
<%--								  <option>员工介绍</option>--%>
<%--								  <option>外部介绍</option>--%>
<%--								  <option>在线商场</option>--%>
<%--								  <option>合作伙伴</option>--%>
<%--								  <option>公开媒介</option>--%>
<%--								  <option>销售邮件</option>--%>
<%--								  <option>合作伙伴研讨会</option>--%>
<%--								  <option>内部研讨会</option>--%>
<%--								  <option>交易会</option>--%>
<%--								  <option>web下载</option>--%>
<%--								  <option>web调研</option>--%>
<%--								  <option>聊天</option>--%>
<%--								</select>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						--%>
<%--						<div class="form-group">--%>
<%--							<label for="edit-surname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<input type="text" class="form-control" id="edit-surname" value="李四">--%>
<%--							</div>--%>
<%--							<label for="edit-call" class="col-sm-2 control-label">称呼</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<select class="form-control" id="edit-call">--%>
<%--								  <option></option>--%>
<%--								  <option selected>先生</option>--%>
<%--								  <option>夫人</option>--%>
<%--								  <option>女士</option>--%>
<%--								  <option>博士</option>--%>
<%--								  <option>教授</option>--%>
<%--								</select>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						--%>
<%--						<div class="form-group">--%>
<%--							<label for="edit-job" class="col-sm-2 control-label">职位</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<input type="text" class="form-control" id="edit-job" value="CTO">--%>
<%--							</div>--%>
<%--							<label for="edit-mphone" class="col-sm-2 control-label">手机</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<input type="text" class="form-control" id="edit-mphone" value="12345678901">--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						--%>
<%--						<div class="form-group">--%>
<%--							<label for="edit-email" class="col-sm-2 control-label">邮箱</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<input type="text" class="form-control" id="edit-email" value="lisi@bjpowernode.com">--%>
<%--							</div>--%>
<%--							<label for="edit-birth" class="col-sm-2 control-label">生日</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<input type="text" class="form-control" id="edit-birth">--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						--%>
<%--						<div class="form-group">--%>
<%--							<label for="edit-customerName" class="col-sm-2 control-label">客户名称</label>--%>
<%--							<div class="col-sm-10" style="width: 300px;">--%>
<%--								<input type="text" class="form-control" id="edit-customerName" placeholder="支持自动补全，输入客户不存在则新建" value="动力节点">--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						--%>
<%--						<div class="form-group">--%>
<%--							<label for="edit-describe" class="col-sm-2 control-label">描述</label>--%>
<%--							<div class="col-sm-10" style="width: 81%;">--%>
<%--								<textarea class="form-control" rows="3" id="edit-describe">这是一条线索的描述信息</textarea>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						--%>
<%--						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>--%>
<%--						--%>
<%--						<div style="position: relative;top: 15px;">--%>
<%--							<div class="form-group">--%>
<%--								<label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>--%>
<%--								<div class="col-sm-10" style="width: 81%;">--%>
<%--									<textarea class="form-control" rows="3" id="create-contactSummary"></textarea>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--							<div class="form-group">--%>
<%--								<label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>--%>
<%--								<div class="col-sm-10" style="width: 300px;">--%>
<%--									<input type="text" class="form-control" id="create-nextContactTime">--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						--%>
<%--						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>--%>

<%--                        <div style="position: relative;top: 20px;">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="edit-address1" class="col-sm-2 control-label">详细地址</label>--%>
<%--                                <div class="col-sm-10" style="width: 81%;">--%>
<%--                                    <textarea class="form-control" rows="1" id="edit-address1">北京大兴区大族企业湾</textarea>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--					</form>--%>
<%--					--%>
<%--				</div>--%>
<%--				<div class="modal-footer">--%>
<%--					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
<%--					<button type="button" class="btn btn-primary" id="updateRemarkBtn">更新</button>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>

	<!-- 返回按钮 -->
	<div style="position: relative; top: 35px; left: 10px;">
		<a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left" style="font-size: 20px; color: #DDDDDD"></span></a>
	</div>
	
	<!-- 大标题 -->
	<div style="position: relative; left: 40px; top: -30px;">
		<div class="page-header">
			<h3>${contacts.fullname.concat(contacts.appellation)} <small> - ${contacts.customerId}</small></h3>
		</div>
<%--		<div style="position: relative; height: 50px; width: 500px;  top: -72px; left: 700px;">--%>
<%--			<button type="button" class="btn btn-default" data-toggle="modal" data-target="#editContactsModal"><span class="glyphicon glyphicon-edit"></span> 编辑</button>--%>
<%--			<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>--%>
<%--		</div>--%>
	</div>
	
	<br/>
	<br/>
	<br/>

	<!-- 详细信息 -->
	<div style="position: relative; top: -70px;">
		<div style="position: relative; left: 40px; height: 30px;">
			<div style="width: 300px; color: gray;">所有者</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${contacts.owner}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">来源</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${contacts.source}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 10px;">
			<div style="width: 300px; color: gray;">客户名称</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${contacts.customerId}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">姓名</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${contacts.fullname.concat(contacts.appellation)}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 20px;">
			<div style="width: 300px; color: gray;">邮箱</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${contacts.email}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">手机</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${contacts.mphone}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 30px;">
			<div style="width: 300px; color: gray;">职位</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${contacts.job}</b></div>
<%--			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">生日</div>--%>
<%--			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>&nbsp;</b></div>--%>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 40px;">
			<div style="width: 300px; color: gray;">创建者</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${contacts.createBy}&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">${contacts.createTime}</small></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 50px;">
			<div style="width: 300px; color: gray;">修改者</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${contacts.editBy}&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">${contacts.editTime}</small></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 60px;">
			<div style="width: 300px; color: gray;">描述</div>
			<div style="width: 630px;position: relative; left: 200px; top: -20px;">
				<b>
					${contacts.description}
				</b>
			</div>
			<div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 70px;">
			<div style="width: 300px; color: gray;">联系纪要</div>
			<div style="width: 630px;position: relative; left: 200px; top: -20px;">
				<b>
					&nbsp;${contacts.contactSummary}
				</b>
			</div>
			<div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 80px;">
			<div style="width: 300px; color: gray;">下次联系时间</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>&nbsp;${contacts.nextContactTime}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
        <div style="position: relative; left: 40px; height: 30px; top: 90px;">
            <div style="width: 300px; color: gray;">详细地址</div>
            <div style="width: 630px;position: relative; left: 200px; top: -20px;">
                <b>
					${contacts.address}
                </b>
            </div>
            <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
        </div>
	</div>
	<!-- 备注 -->
	<div id="remarkDivList" style="position: relative; top: 20px; left: 40px;">
		<div class="page-header">
			<h4>备注</h4>
		</div>
		<c:forEach items="${contactsRemarkList}" var="remark">
			<div class="remarkDiv" id="div_${remark.id}" style="height: 60px;">
				<img title="${remark.createBy}" src="image/user-thumbnail.png" style="width: 30px; height:30px;">
				<div style="position: relative; top: -40px; left: 40px;" >
					<h5>${remark.noteContent}</h5>
					<font color="gray">联系人</font> <font color="gray">-</font> <b>${contacts.fullname.concat(contacts.appellation)}-${contacts.customerId}</b> <small style="color: gray;"> ${remark.editFlag=='0'?remark.createTime.concat("由").concat(remark.createBy).concat("创建"):remark.editTime.concat("由").concat(remark.editBy).concat("修改")}</small>
					<div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
						<a class="myHref" name="editA" remarkId="${remark.id}" href="javascript:void(0);"><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="myHref" name="deleteA" remarkId="${remark.id}" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>
					</div>
				</div>
			</div>
		</c:forEach>
		
<%--		<!-- 备注1 -->--%>
<%--		<div class="remarkDiv" style="height: 60px;">--%>
<%--			<img title="zhangsan" src="image/user-thumbnail.png" style="width: 30px; height:30px;">--%>
<%--			<div style="position: relative; top: -40px; left: 40px;" >--%>
<%--				<h5>哎呦！</h5>--%>
<%--				<font color="gray">联系人</font> <font color="gray">-</font> <b>李四先生-北京动力节点</b> <small style="color: gray;"> 2017-01-22 10:10:10 由zhangsan</small>--%>
<%--				<div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">--%>
<%--					<a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>--%>
<%--					&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--					<a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
		
<%--		<!-- 备注2 -->--%>
<%--		<div class="remarkDiv" style="height: 60px;">--%>
<%--			<img title="zhangsan" src="image/user-thumbnail.png" style="width: 30px; height:30px;">--%>
<%--			<div style="position: relative; top: -40px; left: 40px;" >--%>
<%--				<h5>呵呵！</h5>--%>
<%--				<font color="gray">联系人</font> <font color="gray">-</font> <b>李四先生-北京动力节点</b> <small style="color: gray;"> 2017-01-22 10:20:10 由zhangsan</small>--%>
<%--				<div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">--%>
<%--					<a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>--%>
<%--					&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--					<a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
		
		<div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
			<form role="form" style="position: relative;top: 10px; left: 10px;">
				<textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"  placeholder="添加备注..."></textarea>
				<p id="cancelAndSaveBtn" style="position: relative;left: 737px; top: 10px; display: none;">
					<button id="cancelBtn" type="button" class="btn btn-default">取消</button>
					<button type="button" class="btn btn-primary" id="saveCreateContactsRemarkBtn">保存</button>
				</p>
			</form>
		</div>
	</div>
	
	<!-- 交易 -->
	<div>
		<div style="position: relative; top: 20px; left: 40px;">
			<div class="page-header">
				<h4>交易</h4>
			</div>
			<div style="position: relative;top: 0px;">
				<table id="activityTable3" class="table table-hover" style="width: 900px;">
					<thead>
						<tr style="color: #B3B3B3;">
							<td>名称</td>
							<td>金额</td>
							<td>阶段</td>
<%--							<td>可能性</td>--%>
							<td>预计成交日期</td>
							<td>类型</td>
							<td></td>
						</tr>
					</thead>
					<tbody id="tbody_bundTran">
<%--						<tr>--%>
<%--							<td><a href="../transaction/detail.jsp" style="text-decoration: none;">动力节点-交易01</a></td>--%>
<%--							<td>5,000</td>--%>
<%--							<td>谈判/复审</td>--%>
<%--							<td>90</td>--%>
<%--							<td>2017-02-07</td>--%>
<%--							<td>新业务</td>--%>
<%--							<td><a href="javascript:void(0);" data-toggle="modal" data-target="#unbundModal" style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>删除</a></td>--%>
<%--						</tr>--%>
					</tbody>
				</table>
			</div>
			
<%--			<div>--%>
<%--				<a href="../transaction/save.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-plus"></span>新建交易</a>--%>
<%--			</div>--%>
		</div>
	</div>
	
	<!-- 市场活动绑定联系 -->
	<div>
		<div style="position: relative; top: 60px; left: 40px;">
			<div class="page-header">
				<h4>市场活动</h4>
			</div>
			<div style="position: relative;top: 0px;">
				<table class="table table-hover" style="width: 900px;">
					<thead>
						<tr style="color: #B3B3B3;">
							<td>名称</td>
							<td>开始日期</td>
							<td>结束日期</td>
							<td>所有者</td>
							<td></td>
						</tr>
					</thead>
					<tbody id="relationTbody">
					<c:forEach items="${activityList}" var="activity">
						<tr id="tr_${activity.id}">
							<td>${activity.name}</td>
							<td>${activity.startDate}</td>
							<td>${activity.endDate}</td>
							<td>${activity.owner}</td>
							<td><a href="javascript:void(0);" activityId="${activity.id}" style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>解除关联</a></td>
						</tr>
					</c:forEach>
<%--						<tr>--%>
<%--							<td><a href="../activity/detail.jsp" style="text-decoration: none;">发传单</a></td>--%>
<%--							<td>2020-10-10</td>--%>
<%--							<td>2020-10-20</td>--%>
<%--							<td>zhangsan</td>--%>
<%--							<td><a href="javascript:void(0);" data-toggle="modal" data-target="#unbundActivityModal" style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>解除关联</a></td>--%>
<%--						</tr>--%>
					</tbody>
				</table>
			</div>
			
			<div>
				<a href="javascript:void(0);" id="bundActivityBtn" style="text-decoration: none;"><span class="glyphicon glyphicon-plus"></span>关联市场活动</a>
			</div>
		</div>
	</div>
	
	
	<div style="height: 200px;"></div>
</body>
</html>