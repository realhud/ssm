<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>艺谷（深圳）后台管理系统</title>
<link rel="stylesheet" type="text/css" href="../resource/Styles/base.css" />
<link rel="stylesheet" type="text/css" href="../resource/Styles/admin-all.css" />
<link rel="stylesheet" type="text/css" href="../resource/Styles/bootstrap.min.css" />
<script type="text/javascript" src="../resource/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../resource/js/jquery.spritely-0.6.js"></script>
<script type="text/javascript" src="../resource/js/chur.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resource/Styles/login.css" />
<script type="text/javascript" src="../resource/js/ajax.js"></script>
<script type="text/javascript">
	$(function() {
		$('#clouds').pan({
			fps : 20,
			speed : 0.7,
			dir : 'right',
			depth : 10
		});
		$('.login').click(function() {
			if ($('#uid').val() == "" || $('#pwd').val() == "" || $('#code').val() == "") {
				$('.tip').html('用户名或密码不可为空！');
				return false;
			}
			var uid = $('#uid').val();
			var pwd = $('#pwd').val();
			var params = {
				"user.userId" : uid,
				"user.password" : pwd
			};
			ajaxSend("../user/login", params, function(data) {
				location.href = '../sendPage/main';
			});
		});
	});
</script>
</head>
<body>
	<div id="clouds" class="stage"></div>
	<div class="loginmain"></div>
	<div class="row-fluid">
		<h1>**后台管理系统</h1>
		<p>
			<label>帐&nbsp;&nbsp;&nbsp;号：<input type="text" id="uid" /></label>
		</p>
		<p>
			<label>密&nbsp;&nbsp;&nbsp;码：<input type="password" id="pwd" /></label>
		</p>
		<p class="pcode">
			<label>效验码：<input type="text" id="code" maxlength="5" class="code" value="e5g88" /><img src="../resource/img/code.gif" alt="" class="imgcode" /> <a href="#">下一张</a></label>
		</p>
		<p class="tip">&nbsp;</p>
		<hr />
		<input type="button" value=" 登 录 " class="btn btn-primary btn-large login" />
		&nbsp;&nbsp;&nbsp;
		<input type="button" value=" 取 消 " class="btn btn-large" />
	</div>
</body>
</html>
