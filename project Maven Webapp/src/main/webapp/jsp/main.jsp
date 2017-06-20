<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8" />
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="../resource/Styles/admin-all.css" />
<link rel="stylesheet" type="text/css" href="../resource/Styles/base.css" />
<link rel="stylesheet" type="text/css" href="../resource/Styles/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../resource/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
<script type="text/javascript" src="../resource/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../resource/js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="../resource/js/index.js"></script>
<script type="text/javascript" src="../resource/js/ajax.js"></script>
<script type="text/javascript">
	$(function() {
		ajaxSend("../menu/list", {}, function(data) {
			var list = data.dataList;
			$.each(list, function(i, obj) {
				if (obj.parentId == 0) {
					var li = $("<li></li>");
					var leftmenu = $("<div></div>");
					var id = obj.id;
					li.append('<a href="#"> ' + obj.menuName + '<i class="tip-up"></i> </a>');
					leftmenu.append('<a class="one"> ' + obj.menuName + '</a>');
					var ul = $("<ul class='kidc'></ul>");
					var leftul = $("<ul class='kid'></ul>");
					$.each(list, function(j, o) {
						if (o.parentId == id) {
							ul.append('<li><a target="Conframe" href="'+o.menuUrl+'">' + o.menuName + '</a></li>');
							leftul.append('<li><b class="tip"></b><a target="Conframe" href="'+o.menuUrl+'">' + o.menuName + '</a></li>');
						}
						li.append(ul);
						leftmenu.append(leftul);
					});
				}
				$("#ul_menu").append(li);
				$("#left_menu").append(leftmenu);
			});
		});
	});
</script>
</head>
<body>
	<div class="warp">
		<!--头部开始-->
		<div class="top_c">
			<div class="top-menu">
				<ul id="ul_menu" class="top-menu-nav">
					<li>
						<a href="#">首页</a>
					</li>
				</ul>
			</div>
			<div class="top-nav">
				上午好，欢迎您，**！&nbsp;&nbsp;
				<a href="#">修改密码</a>
				|
				<a href="#">安全退出</a>
			</div>
		</div>
		<!--头部结束-->
		<!--左边菜单开始-->
		<div class="left_c left">
			<h1>系统操作菜单</h1>
			<div id="left_menu" class="acc"></div>
		</div>
		<!--左边菜单结束-->
		<!--右边框架开始-->
		<div class="right_c">
			<div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>
		</div>
		<div class="Conframe">
			<iframe name="Conframe" id="Conframe"></iframe>
		</div>
		<!--右边框架结束-->

		<!--底部开始-->
		<div class="bottom_c">Copyright &copy;2010-2017 ******科技有限公司 版权所有</div>
		<!--底部结束-->
	</div>
	<script type="text/javascript" src="../resource/js/index.js"></script>
</body>
</html>