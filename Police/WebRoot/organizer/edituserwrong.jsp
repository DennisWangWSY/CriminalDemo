<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<h1><a href="/organizer/userorgan/1">回到管理员主页</a></h1>
<h2>修改用户信息	</h2>
<div class="form_box">
	<form action="/organizer/update" method="post">
		<fieldset class="solid">
	<legend>修改用户信息</legend>
	<div>
		<label>id</label>
		<input readonly="readonly" type="text" name="user.id" value="${user.id}"/>
	</div>
	<p><strong>${nameMsg }</strong></p>
	<div>
		<label>用户名</label>
		<input type="text" name="user.name" value="${user.name }"/>
	</div>
	<div>
		<label>密码(如不修改请忽略)</label>
		<input type="password" name="user.password"/>
	</div>
	<p><strong>${passwordMsg2 }</strong></p>
	<div>
		<label>确认密码</label>
		<input type="password" name="password2"/>
	</div>
		<div>
		<label>类型</label>
		<select name="user.type">
		<%
		String type = ((Users)(request.getAttribute("user"))).getStr("type");
		if(type.equals("organizer")){ %>
		<option value="organizer" selected="selected">管理员</option>
		<option value="user">普通用户</option>
		<%}else{%>
		<option value="organizer">管理员</option>
		<option value="user" selected="selected">公安人员</option>
		<%} %>
	</select>
	</div>
	<div>
		<label>&nbsp;</label>
		<input value="提交" type="submit">
	</div>
</fieldset> 
	</form>
</div>
