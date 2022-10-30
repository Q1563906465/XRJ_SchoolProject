<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8" name="XRJ" content="A站">
		<title>游戏</title>
		<link rel="stylesheet" type="text/css" href="./css/common.css" />
		<link rel="stylesheet" type="text/css" href="./css/temple.css" />
		<link rel="stylesheet" type="text/css" href="./css/game.css" />
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
						<li><a class="game" href="game.jsp">游戏</a></li>
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
		
		<!-- 内容 B -->
		<div id="body">
			<div class="center">
				<div class="body_t fl">
					<a class="img_l" href="#"><img src="img/左箭头.png"></a>
					<a class="img_c" href="#"><img></a>
					<a class="img_r" href="#"><img src="img/右箭头.png"></a>
				</div>
				<div class="body_c fl">
					<h2>精品推荐</h2>
					<div>
						<ul>
							<li><a href="#"><img src="img/game_魔女.png"></a></li>
							<li><a href="#"><img src="img/game_帝国.png"></a></li>
							<li><a href="#"><img src="img/game_物语.png"></a></li>
							<li><a href="#"><img src="img/game_黑月.png"></a></li>
						</ul>
					</div>
				</div>
				<a href="#">
					<div class="body_b fl">
						<h2>❀新游预约</h2>
					</div>
				</a>
				
				
			</div>
		</div>
		<!-- 内容 B -->
		
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
