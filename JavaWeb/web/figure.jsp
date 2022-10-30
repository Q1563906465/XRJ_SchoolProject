<%@ page import="java.sql.Connection" %>
<%@ page import="Dao.ConnDB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>手办</title>
		<link rel="stylesheet" type="text/css" href="./css/common.css" />
		<link rel="stylesheet" type="text/css" href="./css/temple.css" />
		<link rel="stylesheet" type="text/css" href="./css/figure.css" />
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


		<%
			ConnDB connDB = new ConnDB();
			String sql = "select count(*) from figure";
			ResultSet rs = connDB.doQuery(sql);
			int pageSize = 4; //每个显示商品个数
			rs.next();
			int sum = rs.getInt(1); //查询结果集中商品数量总数
			int pages = sum%pageSize==0?sum/pageSize:sum/pageSize+1; //一共分页页数
			int pageNow;
			int count = 0; //当前页商品计数
			String s = (String) request.getParameter("pageNow");
			if (s == null)
				pageNow = 1;
			else
				pageNow = Integer.parseInt(s);
			sql = "select * from figure limit " + (4*pageNow-4) + "," + pageSize + ";";
			rs = connDB.doQuery(sql);
		%>
		<!-- 内容 B -->
		<div id="body">
			<div class="center">
				<div class="body_t">
					<h2>鬼灭之刃系列</h2>
					<ul>
						<%
							while(rs.next()){
								if(++count > pageSize)
									break;
						%>
						<li>
							<a href="FigureDetailServlet?id=<%=rs.getInt("id")%>"><img  src="<%=rs.getString("img")%>"/></a>
							<div>
								<p><%=rs.getString("fname")%></p>
								<p>￥<%=rs.getString("price")%></p>
								<a href="addCartServlet?id=<%=rs.getString("id")%>"><button type="button" name="cart"></button></a>
							</div>
						</li>
						<%
							}
							rs.close();
							ConnDB.close();
						%>


<%--						<li>--%>
<%--							<a href="#"><img  src="./img/手办_GEM.png"/></a>--%>
<%--							<div>--%>
<%--								<p>G.M.E.系列</p>--%>
<%--								<p>￥349</p>--%>
<%--								<button type="button" name="cart"></button>--%>
<%--							</div>--%>
<%--						</li>--%>
<%--						<li>--%>
<%--							<a href="#"><img  src="./img/手办_蚊香眼.png"/></a>--%>
<%--							<div>--%>
<%--								<p>蚊香眼系列</p>--%>
<%--								<p>￥278</p>--%>
<%--								<button type="button" name="cart"></button>--%>
<%--							</div>--%>
<%--						</li>--%>
<%--						<li>--%>
<%--							<a href="#"><img  src="./img/手办_炭治郎.png"/></a>--%>
<%--							<div>--%>
<%--								<p>灶门炭治郎</p>--%>
<%--								<p>￥367</p>--%>
<%--								<button type="button" name="cart"></button>--%>
<%--							</div>--%>
<%--						</li>--%>
					</ul>
				</div>


				<div class="pages" style="width: 100px;height: 20px;margin-left: 46.5%;display: inline-block;background: rgb(215, 255, 251,0.3);margin-top: 20px;padding: 5px;border-radius: 5px;box-shadow: 1px 1px 10px #b4b4ff;">
					<a href="figure.jsp?pageNow=1">首页</a>
					<select onchange="location.replace('figure.jsp?pageNow=' + this.value)">
						<%
							for(int i = 1; i <= pages; i++){
						%>
								<option value="<%=i%>" <%=pageNow==i?"selected":""%>>
									<%=i%>
								</option>
<%--							<a href="figure.jsp?pageNow=<%=i%>">[<%=i%>]</a>--%>

						<%
							}
						%>

					</select>
					<a href="figure.jsp?pageNow=<%=pages%>">尾页</a>
				</div>



				<div class="body_b">
					<h2>粘土人系列</h2>
					<ul>
						<li>
							<a href="#"><img  src="./img/手办_绘里飘.png"/></a>
							<div>
								<p>粘土人 绘里飘</p>
								<p>￥319</p>
								<button type="button" name="cart"></button>
							</div>
						</li>
						<li>
							<a href="#"><img  src="./img/手办_韩文清.png"/></a>
							<div>
								<p>粘土人 韩文清</p>
								<p>￥275</p>
								<button type="button" name="cart"></button>
							</div>
						</li>
						<li>
							<a href="#"><img  src="./img/手办_初音.png"/></a>
							<div>
								<p>粘土人 初音</p>
								<p>￥430</p>
								<button type="button" name="cart"></button>
							</div>
						</li>
						<li>
							<a href="#"><img  src="./img/手办_三色.png"/></a>
							<div>
								<p>粘土人 三色院</p>
								<p>￥355</p>
								<button type="button" name="cart"></button>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 内容 E -->
		
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
