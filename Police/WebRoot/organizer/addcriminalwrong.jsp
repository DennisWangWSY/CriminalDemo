<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="model.Criminals"%>
<%@page import="java.util.List"%>
<h1>公安人员操作——通缉犯管理</h1>
<h1>添加新的通缉犯&nbsp;&nbsp;
</h1>
<div id="nav">
	<ul>
	<li><a href="/organizer"><b>回到公安人员主页</b></a></li>
	<li><a href="/organizer/arrestorgan/1"><b>回到在逃人员名单</b></a></li>
	</ul>
</div>
<div class="form_box">
	<form action="/organizer/saveCriminal" method="post" enctype="multipart/form-data">
		<fieldset class="solid">
	<legend>填写新通缉人员信息</legend>
	<p><strong><%out.println(request.getAttribute("notcompleteMsg")); %></strong></p>
	<div>
	<p><strong><%out.println(request.getAttribute("alreadexistMsg")); %></strong></p>
		<label>id</label>
		<input type="text" name="id" value="${cid }"/>
	</div>
	<div>
		<label>姓名</label>
		<input type="text" name="name" value="${cname }"/>
	</div>
		<div>
		<label>性别</label>
	<select name="sex">
	<%
		if(request.getAttribute("csex").toString().equals("男")){
			%>
			<option value="男" selected="selected">男</option>
			<option value="女">女</option>
			<%
			}else if(request.getAttribute("csex").toString().equals("女")){%>
			<option value="男">男</option>
			<option value="女" selected="selected">女</option>
			<%
			}%>
	</select>
	</div>
		<div>
		<label>身高</label>
		<select name="height">
			<%for(int i=120;i<=250;i++){ 
				if(i!=Integer.parseInt(request.getAttribute("cheight").toString())){%>
					<option value ="<%=i %>"><%=i %></option> 
				<%}else{ %>
					<option value="<%=i %>" selected="selected"><%=i %></option>
			<%}}%>
		</select>cm
		</div>
		<div>
		<label>体重</label>
		<select name="weight">
			<%for(int i=40;i<=250;i++){ 
				if(i!=Integer.parseInt(request.getAttribute("cweight").toString())){%>
					<option value ="<%=i %>"><%=i %></option> 
				<%}else{ %>
					<option value="<%=i %>" selected="selected"><%=i %></option>
			<%}}%>
		</select>kg
		</div>
		<div>
		<label>特征描述</label>
		<textarea name="bodytype" cols="80" rows="10" >${cbodytype }</textarea>
	</div>
	<div>
		<label>举报电话</label>
		<input type="text" name="phonenumber" value="${cphonenumber }"/>
	</div>
	<div>
		<label>照片</label>
        <input type="file" name="photo"></input>
	</div>
	<div>
		<label>&nbsp;</label>
		<input value="提交" type="submit">
	</div>
</fieldset> 
	</form>
</div>

