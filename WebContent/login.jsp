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
<title>登陆</title>
<link rel="stylesheet" href="${webContent}css/bootstrap.min.css" />
<script type="text/javascript" src="${webContent}js/bootstrap.min.js"></script>
<script type="text/javascript" src="${webContent}js/jquery.js"></script>
</head>
<body>
	<div class="container" style="width: 440px; margin-top: 16%;">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="form-group">
					<div class="col-sm-10" style="margin:5px">
						<input id="username" name="username" class="form-control"
							type="text" placeholder="用户名" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10" style="margin:5px">
						<input id="password" name="password" class="form-control"
							type="password" placeholder="密码" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10" style="text-align: center;">
						<input onclick="login()" class="btn btn-default" type="button"
							style="width: 100px;" value="立即登录" /> <a
							href="${webContent}pages/findPwd.jsp">忘记密码？</a><a
							href="${webContent}pages/register.jsp">立即注册</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function login() {
			var username = $("#username").val();
			var password = $("#password").val();
			$.post("user/login?username=" + username + "&password=" + password,
					function(msg) {
						if (msg == 'success') {
							location.href = "${webContent}pages/main.jsp";
						} else {
							alert(msg);
						}
					});
		}
	</script>
</body>
</html>