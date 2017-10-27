<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String webContent = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("webContent", webContent);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		<link rel="stylesheet" href="${webContent}css/select.css" />
		<link rel="stylesheet" href="${webContent}css/style.css" />
	</head>
	<style>
		form {
			margin-top: 10px;
			margin-left: 20px;
		}
		form div input {
			margin-left: 10px;
		}
		.le {
			width: 300px;
		}
	</style>

	<body>
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">个人中心</a>
				</li>
			</ul>
		</div>
		<form action="${webContent}user/update" method="post">
			<div>
				<label>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>
				<input type="text" name="username" value="${user.username }" class="scinput le" disabled="disabled" />
			</div>
			<br />
			<div>
				<label>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</label>
				<input type="text" name="phone" value="${user.phone }" class="scinput le" />
			</div>
			<br />
			<div>
				<label>电子邮件:</label>
				<input type="text" name="email" value="${user.email }" class="scinput le" />
			</div>
			<br />
			<input type="submit" value="保存修改" class="btn" style="margin-top: 30px; margin-left: 120px;" />
		</form>
	</body>

</html>