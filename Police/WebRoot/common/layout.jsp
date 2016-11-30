<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="zh-CN" xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<link href="/css/manage.css" media="screen" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.4.4.min.js" type="text/javascript" ></script>

</head>
<body>
	<div class="manage_container">
		<div class="manage_head">
			<div class="manage_logo">网上通缉令管理系统</div>
			<div id="nav">
				<ul>
					<%
					if(request.getSession().getAttribute("loggedin").toString().equals("0")){
					%>
					<li><a href="/logged"><b>首页</b></a></li>
					<li><a><b>用户名：<%out.println(request.getSession().getAttribute("name")); %></b></a></li>
					<li><a href="/"><b>注销登录</b></a></li>
					<%}else{ %>
					<li><a href="/"><b>首页</b></a></li>
					<li><a href="/login"><b>登陆</b></a></li>
					<%} %>
				</ul>
			</div>
		</div>
		<div class="main">
			
		</div>
	</div>
</body>
</html>

