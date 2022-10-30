<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8" name="XRJ" content="A站">
		<title>热区</title>
		<link rel="stylesheet" type="text/css" href="./css/common.css" />
		<link rel="stylesheet" type="text/css" href="./css/temple.css" />
		<link rel="stylesheet" type="text/css" href="./css/heatZone.css" />
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
						<li><a class="heatZone" href="#">热区</a></li>
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
								<option value="lopin" label="用户">用户</option>
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
			<div class="body_t">
				<ul>
					<li><a class="hot" href="heatZone.jsp"><img src="img/火热.png" >综合热门</a></li>
					<li><a href="#"><img src="img/推荐.png" >每周必看</a></li>
					<li><a href="#"><img src="img/收藏.png" >我的关注</a></li>
					<li><a href="#"><img src="img/排行榜.png" >排行榜</a></li>
				</ul>
			</div>
			<div class="body_b">
				<div class="body_l">
					<ul>
						<li>
							<a><img src="img/黄金面具.png">
								<div class="fr">
									<span>【才浅】15天花20万元用500克黄金敲数万锤纯手工打造三星堆黄金面具</span>
								</div>
								<div class="vedio">
									<img src="img/播放.png" />1214.6万
									<img src="img/留言.png" />20.3万
								</div>
							</a>
						</li>
						<li>
							<a><img src="img/张三.png">
								<div class="fr">
									<span>【罗翔】童话镇</span>
								</div>
								<div class="vedio">
									<img src="img/播放.png" />1628.9万
									<img src="img/留言.png" />3.3万
								</div>
							</a>
						</li>
						<li>
							<a><img src="img/孙悟空.png">
								<div class="fr">
									<span>【孙悟空×林黛玉】名著联姻 | 佛度众生不度我 宁负如来不负卿</span>
								</div>
								<div class="vedio">
									<img src="img/播放.png" />626.6万
									<img src="img/留言.png" />2.3万
								</div>
							</a>
						</li>
					</ul>
				</div>
				<div class="body_r">
					<ul>
						<li>
							<a><img src="img/旋律歌.png">
								<div class="fr">
									<span>一段旋律怎么变成一首歌？曝光学生党制作歌曲全过程:)</span>
								</div>
								<div class="vedio">
									<img src="img/播放.png" />1614.6万
									<img src="img/留言.png" />2.3万
								</div>
							</a>
						</li>
						<li>
							<a><img src="img/红楼梦.png">
								<div class="fr">
									<span>【木鱼微剧场】《红楼梦》（全集）</span>
								</div>
								<div class="vedio">
									<img src="img/播放.png" />628.9万
									<img src="img/留言.png" />13.3万
								</div>
							</a>
						</li>
						<li>
							<a><img src="img/让子弹飞.png">
								<div class="fr">
									<span>敢 杀 我 的 马？！</span>
								</div>
								<div class="vedio">
									<img src="img/播放.png" />6286.6万
									<img src="img/留言.png" />22.3万
								</div>
							</a>
						</li>
					</ul>
				</div>
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
