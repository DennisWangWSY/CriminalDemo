<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<h1>公安人员操作——查找通缉犯</h1>
<h1>按条件检索&nbsp;&nbsp;
</h1>

<div id="nav">
	<ul>
	<li><a href="/organizer"><b>回到公安人员主页</b></a></li>
	<li><a href="/organizer/arrestorgan/1"><b>回到通缉犯名单</b></a></li>
	</ul>
</div>
<div class="form_box">
	<form action="/organizer/dosearch/1" method="post">
		<fieldset class="solid">
	<legend>输入查询条件</legend>
	<div>
		<label>身份证号码</label>
		<input type="text" name="id" />
	</div>
	<div>
		<label>姓名（部分匹配）</label>
		<input type="text" name="name" />
	</div>
	<div>
	<label>性别</label>
	<select name="sex">
		<option value=""></option>
		<option value="男">男</option>
		<option value="女">女</option>
	</select>
	</div>
	<div>
		<label>身高</label>
		<select name="lheight">
			<%for(int i=120;i<=250;i++){ %>
			<option value ="<%=i %>"><%=i %></option> 
			<%}%> 
		</select>
		cm 至
		<select name="hheight">
			<%for(int i=120;i<250;i++){ %>
			<option value ="<%=i %>"><%=i %></option> 
			<%}%>
			<option value="250" selected="selected">250</option> 
		</select>
		cm
	</div>
		<div>
		<label>体重</label>
		<select name="lweight">
			<%for(int i=40;i<=250;i++){ %>
			<option value ="<%=i %>"><%=i %></option> 
			<%}%> 
		</select>
		kg 至
		<select name="hweight">
			<%for(int i=40;i<250;i++){ %>
			<option value ="<%=i %>"><%=i %></option> 
			<%}%> 
			<option value="250" selected="selected">250</option> 
		</select>
		kg
	</div>
	
	<div>
		<label>&nbsp;</label>
		<% request.setAttribute("test", "arg1"); %>
		<input value="提交" type="submit">
	</div>
</fieldset> 
	</form>
</div>
