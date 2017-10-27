<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>文章正文</title>
<link href="${webContent}css/style.css" rel="stylesheet" type="text/css" />
<link href="${webContent}css/select.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${webContent}js/jquery.js"></script>
<script type="text/javascript"
	src="${webContent}js/jquery.idTabs.min.js"></script>
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
			<li><a href="#">文章正文</a></li>
		</ul>
	</div>
	<div class="formbody">
		<div id="usual1" class="usual">
			<ul class="forminfo">
				<li><label>标题</label><input name="" type="text" class="dfinput"
					value="${article.title }" style="width: 700px;" disabled="disabled" /></li>
				<li><label>内容</label> <textarea id="content7" name="content"
						style="width: 700px; height: 500px; visibility: hidden;"
						disabled="disabled">${article.content }</textarea></li>
				<li><label>留言</label> <input id="comment" name="comment" type="text"
					class="dfinput" value="" style="width: 518px; margin-right: 5px;" />
					<input name="" type="button" class="btn" value="留言"
					onclick="addComment(${article.aid })" /></li>
			</ul>
			<table class="tablelist">
				<thead>
					<tr>
						<th>留言内容</th>
						<th>用户</th>
						<th>时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="list">
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
			$("#usual1 ul").idTabs();
		</script>
		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</div>
	<script type="text/javascript">
		$(function(){
			loadCommentData();
		});
		function loadCommentData() {
			$.post("${webContent}comment/getList?aid=${article.aid }",function(data) {
				var list = $.parseJSON(data);
				$("#list").html("");
				if(list.length != 0) {
					for (var i = 0; i < list.length; i++) {
						$("#list").append("<tr><td>"+list[i].content+"</td><td>"+list[i].user.username+"</td><td>"+list[i].time+"</td><td><button onclick='deleteComment("+list[i].cid+")'>删除</button></td></tr>");
					}
				}
			});
		}
		function deleteComment(id) {
			$.post("${webContent}comment/delete?id=" + id,function(data) {
				if(data == "success") {
					loadCommentData();
				}
			});
		}
		function addComment(aid) {
			var comment = $("#comment").val();
			$.post("${webContent}comment/add?aid=" + aid + "&content=" +comment,function(data) {
				if(data == "success") {
					loadCommentData();
				}
			});
		}
	</script>
</body>
</html>