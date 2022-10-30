<%@ page import="Entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.Figure" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>

<html>
	<head>
		<meta charset="utf-8" name="XRJ" content="A站">
		<title>购物车</title>
		<link rel="stylesheet" type="text/css" href="./css/common.css" />
		<link rel="stylesheet" type="text/css" href="./css/temple.css" />
		<link rel="stylesheet" type="text/css" href="./css/cart.css" />
		<script src="./js/cart.js" type="text/javascript"></script>
	</head>
	<body>
		<!-- 顶部 B -->
		<div id="top">
			<div class="center">
				<div class="logo fl">
					<h1>A站</h1>
				</div>
				<div class="top_l fl">
					<ul>
						<li><a class="index" href="index.jsp">首页</a></li>
						<li><a class="heatZone" href="heatZone.jsp">热区</a></li>
						<li><a href="game.jsp">游戏</a></li>
						<li><a href="login.jsp"><img src="img/入职.png">用户注册</a></li>
					</ul>
				</div>
				<div class="top_c fl">
					<form action="#" method="post" target="_self">
						<div>
							<input class="txt fl" type="text" placeholder="请输入……" list="searchList"/>
							<input class="btn fl" type="button" value="搜索"/>
							<datalist id="searchList">
								<option value="index" label="首页">A站</option>
								<option value="主页" label="首页">首页</option>
								<option value="game" label="游戏">游戏</option>
								<option value="heatZone" label="热区">热区</option>
								<option value="login" label="用户">用户</option>
							</datalist>
						</div>
					</form>
				</div>
				<div class="top_r fr">
					<a href="user.jsp"><img src="./img/user.png" /></a>
					<a href="#"><img src="./img/消息.png" /></a>
					<a href="figure.jsp"><img src="./img/玩具.png" /></a>
					<a href="cart.jsp"><img src="./img/购物车.png" /></a>
				</div>
			</div>
		</div>
		<!-- 顶部 E -->
		
		<div id="body">
			<div class="body_c">
				<table>
					<tr >
						<td class="td1"><input type="checkbox" id="all"/>全选</td>
						<td>商品</td>
						<td>单价</td>
						<td>数量</td>
						<td>操作</td>
					</tr>
					<%
						Cart cart = (Cart) session.getAttribute("cart");
						if(cart == null)
							cart = new Cart();
						session.setAttribute("var",cart.carts);
					%>
					<c:forEach var="list"  items="${sessionScope.var}">

						<tr>
							<td class="td1"><input type="checkbox" name="rad"/></td>
							<td>
								<a href="FigureDetailServlet?id=${list.id}">
									<img src="${list.img}" style="height: 100px;width: 100px">
									<span>${list.fname}</span>
								</a>
							</td>
							<td class="price">${list.price}￥</td>
							<td>
								<a href="deleteCartServlet?id=${list.id}"><button type="button" name="cart">-</button></a>
								<input type="number" min="1" step="1" value="${list.num}" id="num1" onclick="sum()" readonly>
								<a href="addCartServlet?id=${list.id}"><button type="button" name="cart">+</button></a>
							</td>
							<td class="td5">
								<a href="removeCartServlet?id=${list.id}"><span>❀删除</span></a><br />
								<a href="#"><span>❀移入收藏夹</span></a><br />
							</td>
						</tr>
					</c:forEach>




<%--					<%--%>
<%--						Cart cart = (Cart) session.getAttribute("cart");--%>
<%--						if(cart == null)--%>
<%--							cart = new Cart();--%>

<%--						List<Figure> carts = cart.carts;--%>

<%--						for (int i = 0; i < carts.size(); i++) {        //遍历--%>
<%--					%>--%>





<%--					<tr>--%>
<%--						<td class="td1"><input type="checkbox" name="rad"/></td>--%>
<%--						<td>--%>
<%--							<a href="FigureDetailServlet?id=<%=carts.get(i).getId()%>">--%>
<%--								<img src="<%=carts.get(i).getImg()%>" style="height: 100px;width: 100px">--%>
<%--								<span><%=carts.get(i).getFname()%></span>--%>
<%--							</a>--%>
<%--						</td>--%>
<%--						<td class="price"><%=carts.get(i).getPrice()%>￥</td>--%>
<%--						<td>--%>
<%--							<a href="deleteCartServlet?id=<%=carts.get(i).getId()%>"><button type="button" name="cart">-</button></a>--%>
<%--							<input type="number" min="1" step="1" value="<%=carts.get(i).getNum()%>" id="num1" onclick="sum()" readonly>--%>
<%--							<a href="addCartServlet?id=<%=carts.get(i).getId()%>"><button type="button" name="cart">+</button></a>--%>
<%--						</td>--%>
<%--						<td class="td5">--%>
<%--							<a href="removeCartServlet?id=<%=carts.get(i).getId()%>"><span>❀删除</span></a><br />--%>
<%--							<a href="#"><span>❀移入收藏夹</span></a><br />--%>
<%--						</td>--%>
<%--					</tr>--%>

<%--					<%--%>
<%--						}--%>
<%--					%>--%>



<%--					<tr>--%>
<%--						<td class="td1"><input type="checkbox" name="rad"/></td>--%>
<%--						<td>--%>
<%--							<img src="img/手办2.png">--%>
<%--							<span>紫发女孩</span>--%>
<%--							</td>--%>
<%--						<td class="price">198￥</td>--%>
<%--						<td><input type="number" min="1" step="1" value="2"  id="num2" onclick="sum()"></td>--%>
<%--						<td class="td5">--%>
<%--							<a href="#"><span>❀删除</span></a><br />--%>
<%--							<a href="#"><span>❀移入收藏夹</span></a><br />--%>
<%--						</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<td class="td1"><input type="checkbox" name="rad" checked/></td>--%>
<%--						<td>--%>
<%--							<img src="img/手办3.png">--%>
<%--							<span>玲珑公主</span>--%>
<%--							</td>--%>
<%--						<td class="price">298￥</td>--%>
<%--						<td><input type="number" min="1" step="1" value="3" id="num3" onclick="sum()"></td>--%>
<%--						<td class="td5">--%>
<%--							<a href="#"><span>❀删除</span></a><br />--%>
<%--							<a href="#"><span>❀移入收藏夹</span></a><br />--%>
<%--						</td>--%>
<%--					</tr>--%>
					<tr>
						<td colspan="3" class="table_bl">
							<span>总计<b id="number"><%=cart.totalPrice%></b>元</span>
<%--								<span>总计<b id="number">${sessionScope.cart.totalPrice}</b>元</span>--%>
						</td>
						<td colspan="2" class="table_br">
							<a href="clearCartServlet"><button type="reset" class="submit">清空购物车</button></a>
							<button type="submit" class="submit">提交订单</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- 底部 B -->
		<div id="foot">
			<div class="center">
				<div class="foot_l fl">
					<ul>
						<li>每月，用户访问数量<b>1,000,000</b>次</li>
						<li>每年，视频购买数量<b>2,000,000</b>次</li>
						<li>现在，这些数字还在不断地增长着，欢迎您来一起使用A站</li>
					</ul>
				</div>
				<div class="foot_r fr">
					<div class="f_txt">海阔天空</div>
				</div>
			</div>
		</div>
		<!-- 底部 E -->
	</body>
</html>
