<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String webContent = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("webContent", webContent);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="${webContent}css/style.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${webContent}js/jquery.js"></script>
		<style>
			.m {
				width: 640px;
				height: 264;
				margin-left: auto;
				margin-right: auto;
				margin-top: 100px;
			}
		</style>
	</head>

	<body>
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="${webContent}pages/index.jsp">首页</a>
				</li>
			</ul>
		</div>
		<div class="mainindex">
			<div class="welinfo">
				<span><img src="${webContent}images/sun.png" alt="天气" /></span>
				<b>早上好，欢迎使用个人博客管理系统</b>
				<a href="#">帐号设置</a>
			</div>
			<div class="xline"></div>
			<div class="box"></div>
			<div class="welinfo">
				<span><img src="${webContent}images/dp.png" alt="提醒" /></span>
				<b>使用指南</b>
			</div>
			<ul class="infolist">
				<li><span>您可以快速进行文章发布管理操作</span>
					<a class="ibtn">发布或管理文章</a>
				</li>
				<li><span>您可以进行密码修改、账户设置等操作</span>
					<a class="ibtn">账户管理</a>
				</li>
			</ul>
		</div>
	</body>
	<script type="text/javascript">
		var myPlayer = videojs('my-video');
		videojs("my-video").ready(function() {
			var myPlayer = this;
			myPlayer.play();
		});
	</script>

</html>