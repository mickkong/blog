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
		<script language="JavaScript" src="${webContent}js/jquery.js"></script>
		<script type="text/javascript">
			$(function() {
				//导航切换
				$(".menuson li").click(function() {
					$(".menuson li.active").removeClass("active")
					$(this).addClass("active");
				});

				$('.title').click(function() {
					var $ul = $(this).next('ul');
					$('dd').find('ul').slideUp();
					if($ul.is(':visible')) {
						$(this).next('ul').slideUp();
					} else {
						$(this).next('ul').slideDown();
					}
				});
			})
		</script>
	</head>

	<body style="background:#f0f9fd;">
		<div class="lefttop"><span></span>工作日志</div>
		<dl class="leftmenu">
			<dd>
				<div class="title">
					<span><img src="${webContent}images/leftico01.png" /></span>管理信息
				</div>
				<ul class="menuson">
					<li class="active"><cite></cite>
						<a href="${webContent}pages/index.jsp" target="rightFrame">首页</a><i></i></li>
					<li><cite></cite>
						<a href="${webContent}pages/dynamics.jsp" target="rightFrame">工作动态</a><i></i></li>
					<li><cite></cite>
						<a href="${webContent}pages/article.jsp" target="rightFrame">我的日志</a><i></i></li>
					<li><cite></cite>
						<a href="${webContent}pages/personInfo.jsp" target="rightFrame">个人中心</a><i></i></li>
				</ul>
			</dd>
		</dl>
	</body>

</html>