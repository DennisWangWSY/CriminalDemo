<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<h1>管理员操作——用户信息管理</h1>
<h1>添加新用户&nbsp;&nbsp;
</h1>
<div id="nav">
	<ul>
	<li><a href="/organizer/userorgan/1"><b>回到用户列表</b></a></li>
	</ul>
</div>
<div class="form_box">
	<form action="/organizer/save" method="post">
		<fieldset class="solid">
	<legend>填写新用户信息</legend>
	<p><strong>${idMsg }</strong></p>
	<div>
		<label>id</label>
		<input type="text" name="user.id" value="${id }"/>
	</div>
	<p><strong>${nameMsg }</strong></p>
	<div>
		<label>用户名</label>
		<input type="text" name="user.name" value="${name}"/>
	</div>
	<p><strong>${passwordMsg }</strong></p>
	<div>
		<label>密码</label>
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
			if (request.getAttribute("type").equals("user")){ %>
		<option value="organizer">管理员</option>
		<option value="user"  selected="selected">普通用户</option>
		<%}else{ %>
		<option value="organizer" selected="selected">管理员</option>
		<option value="user"  >公安人员</option>
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
