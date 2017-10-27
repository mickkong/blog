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
<title>无标题文档</title>
<link href="${webContent}css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${webContent}js/jquery.js"></script>
<script language="javascript">
	$(function() {
		//导航切换
		$(".imglist li").click(function() {
			$(".imglist li.selected").removeClass("selected")
			$(this).addClass("selected");
		})
	})
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
</script>
</head>

<body>
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="${webContent}pages/index.jsp">首页</a></li>
			<li><a href="#">动态</a></li>
		</ul>
	</div>
	<div class="rightinfo">
		<ul class="seachform">
			<li><label>综合查询</label><input id="title" name="title" type="text"
				class="scinput" /></li>
			<li><label>&nbsp;</label><input type="button"
				class="scbtn" value="查询" onclick="findByName()" /></li>
		</ul>
		<table class="imgtable">
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
	<script type="text/javascript">
		$('.imgtable tbody tr:odd').addClass('odd');
		$(function(){
			loadData();
		});
		function loadData() {
			$.post("${webContent}article/findAll",function(data) {
				var list = $.parseJSON(data);
				$("#list").html("");
				if(list.length != 0) {
					for (var i = 0; i < list.length; i++) {
						$("#list").append("<tr><td>"+list[i].title+"<p>发布时间："+list[i].createtime+"</p></td><td>"+list[i].author.username+"</td><td>"+list[i].readcount+"</td><td><a href='${webContent}article/view?aid="+list[i].aid+"'>查看</a></td></tr>");
					}
				}
			});
		}
		function findByName() {
			var title = $("#title").val();
			$.post("${webContent}article/findByName?title=" + title,function(data) {
				var list = $.parseJSON(data);
				$("#list").html("");
				if(list.length != 0) {
					for (var i = 0; i < list.length; i++) {
						$("#list").append("<tr><td>"+list[i].title+"<p>发布时间："+list[i].createtime+"</p></td><td>"+list[i].author.username+"</td><td>"+list[i].readcount+"</td><td><a href='${webContent}article/view?aid="+list[i].aid+"'>查看</a></td></tr>");
					}
				}
			});
		}
	</script>
</body>

</html>