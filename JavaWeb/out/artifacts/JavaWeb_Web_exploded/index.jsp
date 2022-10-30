<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8" name="XRJ" content="A站"/>
		<title>A站首页</title>
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/temple.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/Scroll.css" />
		<script src="js/Scroll.js" type="text/javascript"></script>
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
							<input class="txt fl" type="text" placeholder="请输入……" />
							<input class="btn fl" type="button" value="搜索"/>
							<datalist id="searchList">
								<option value="index" label="首页">A站</option>
								<option value="index" label="首页">首页</option>
								<option value="game" label="游戏">游戏</option>
								<option value="heatZone" label="热区">热区</option>
								<option value="login" label="用户">用户</option>
							 </datalist>
						</div>
					</form>
					
				</div>
				<div class="top_r fr">
					<a href="user.jsp"><img src="img/user.png" /></a>
					<a href="#"><img src="img/消息.png" /></a>
					<a href="figure.jsp"><img src="img/玩具.png" /></a>
					<a href="cart.jsp"><img src="img/购物车.png" /></a>
				</div>
			</div>
		</div>
		<!-- 顶部 E -->
		
		<!-- 内容 B -->
		<div id="slider">
			<ul class="slieder-item-container">
				<li><a href="#"><img src="img/index5.png" /></a></li>
				<li><a href="#"><img src="img/index2.png" /></a></li>
				<li><a href="#"><img src="img/index3.png" /></a></li>
				<li><a href="#"><img src="img/index4.png" /></a></li>
				<li><a href="#"><img src="img/index1.png" /></a></li>
			</ul>
			<div class="arrow-container">
				<span class="left-arrow"><img></span>
				<span class="right-arrow"><img></span>
			</div>
			<div class="indicator-container">
				<span class="indicator active"></span>
				<span class="indicator"></span>
				<span class="indicator"></span>
				<span class="indicator"></span>
				<span class="indicator"></span>
			</div>
		</div>
		<div id="body">
			
			<div class="body_r fr">
				<div class="body_t">
					<a href="#"><div class="a1 fl"><span>键等学园/键等</span></div></a>
					<a href="#"><div class="a2 fl"><span>宿命回响：命运节拍</span></div></a>
					<a href="#"><div class="a3 fl"><span>进化之实 踏上胜利的人生</span></div></a>
				</div>
				<div class="body_b">
					<a href="#"><div class="a4 fl"><span>RE-MAIN：少年与水球</span></div></a>
					<a href="#"><div class="a5 fl"><span>博人传 火影忍者新时代</span></div></a>
					<a href="#"><div class="a6 fl"><span>于前辈很烦人的事情</span>关</div></a>
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
