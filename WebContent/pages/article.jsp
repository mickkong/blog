<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>我的文章</title>
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
			<li><a href="${webContent}pages/article.jsp">我的文章</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<div class="itab">
				<ul>
					<li><a href="#tab1" class="selected">发布文章</a></li>
					<li><a href="#tab2">我的文章</a></li>
				</ul>
			</div>
			<div id="tab1" class="tabson">
				<form action="${webContent}article/publish" method="post">
					<ul class="forminfo">
						<li><label>标题<b>*</b></label><input name="title" type="text"
							class="dfinput" placeholder="请填写标题" style="width:518px;" /></li>
						<li><label>内容<b>*</b></label> <textarea id="content7"
								name="content"
								style="width:700px;height:250px;visibility:hidden;"></textarea></li>
						<li><label>&nbsp;</label><input name="" type="submit"
							class="btn" value="马上发布" /></li>
					</ul>
				</form>
			</div>
			<div id="tab2" class="tabson">
				<table class="tablelist">
					<thead>
						<tr>
							<th>标题</th>
							<th>发布人</th>
							<th>阅读量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="list">
					</tbody>
				</table>
			</div>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
			$('.tablelist tbody tr:odd').addClass('odd');
			$(function(){
				loadData();
			});
			function loadData() {
				$.post("${webContent}article/findByUid?uid=${user.uid }",function(data) {
					var list = $.parseJSON(data);
					$("#list").html("");
					if(list.length != 0) {
						for (var i = 0; i < list.length; i++) {
							$("#list").append("<tr><td>"+list[i].title+"<p>发布时间："+list[i].createtime+"</p></td><td>"+list[i].author.username+"</td><td>"+list[i].readcount+"</td><td><button onclick='deleteArticle("+list[i].aid+")'>删除</button><a href='${webContent}article/edit?aid="+list[i].aid+"'>编辑</a></td></tr>");
						}
					}
				});
			}
			function deleteArticle(id) {
				$.post("${webContent}article/delete?id=" + id,function(data) {
					if(data == "success") {
						loadData();
					}
				});
			}
		</script>
	</div>
</body>
</html>