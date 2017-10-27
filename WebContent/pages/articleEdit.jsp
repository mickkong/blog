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
<link href="${webContent}css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${webContent}js/jquery.js"></script>
<script type="text/javascript" src="${webContent}js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="${webContent}js/select-ui.min.js"></script>
<script type="text/javascript" src="${webContent}editor/kindeditor.js"></script>

<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$(".select1").uedSelect({
			width : 345
		});
		$(".select2").uedSelect({
			width : 167
		});
		$(".select3").uedSelect({
			width : 100
		});
	});
</script>
</head>
<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="${webContent}pages/index.jsp">首页</a></li>
			<li><a href="#">我的文章</a></li>
			<li><a href="#">编辑</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div id="tab1" class="tabson">
				<form action="${webContent}article/update?id=${article.aid }" method="post">
					<ul class="forminfo">
						<li><label>标题</label><input name="title" type="text"
							class="dfinput" value="${article.title }" style="width:700px;" /></li>
						<li><label>内容</label><textarea id="content7" name="content"
								style="width:700px;height:500px;visibility:hidden;">${article.content }</textarea></li>
						<li><label>&nbsp;</label><input type="submit" class="scbtn"
							value="保存" /></li>
					</ul>
				</form>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</div>
</body>
</html>