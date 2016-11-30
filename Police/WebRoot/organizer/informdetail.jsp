<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="model.Criminals"%>
<%@page import="model.Inform" %>
<%@page import="java.util.List"%>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<h1>公安人员操作——查看举报信息</h1>
<h1>举报信息详情&nbsp;&nbsp;
</h1>
<div id="nav">
	<ul>
			<%
				Criminals cri = (Criminals)request.getAttribute("criminal");
			 %> 
	<li><a href="/organizer"><b>回到公安人员主页</b></a></li>
<li><a href="/organizer/informbycriminal/1-<%out.print(cri.getStr("id"));%>"><b>查看该通缉犯的举报信息列表</b></a></li>
	</ul>
</div>

	<div class="table_box">
	<table class="list">
		<tbody>
			<tr>
				<th width="10%">id</th>
				<th width="20">画像</th>
				<th width="5%">姓名</th>
				<th width="5%">性别</th>
				<th width="5%">身高</th>
				<th width="5%">体重</th>
				<th width="20%">身体特征</th>
				<th width="10%">举报电话</th>
			</tr>        
			<%
				Criminals re = (Criminals)request.getAttribute("criminal");
			 %>        
                <tr>
                <td style="text-align:left;"><% out.println(re.getStr("id"));%></td>
                <td style="text-align:left;"><img src="/img/<%out.println(re.getStr("image")); %>"></img></td>
				<td style="text-align:left;"><% out.println(re.getStr("name")); %></td>
				<td style="text-align:left;"><% out.println(re.getStr("sex")); %></td>
				<td style="text-align:left;"><% out.println(re.getInt("height")); %></td>
				<td style="text-align:left;"><% out.println(re.getInt("weight")); %></td>
				<td style="text-align:left;"><% out.println(re.getStr("bodytype")); %></td>
				<td style="text-align:left;"><% out.println(re.getStr("phonenumber")); %></td>
				</tr>
		</tbody>
	</table>
	</div>
	<%
		Inform inform = (Inform)request.getAttribute("inform"); %>
<div class="form_box">
	<form action="/user/save" method="post">
		<fieldset class="solid">
	<legend>举报信息详情</legend>
	<div>
		<label>被举报人</label>
		<input readonly="readonly" type="text" name="inform.criminal" value="<%=inform.getStr("criminal") %>" />
	</div>
	<div>
		<label>标题</label>
		<input readonly="readonly" type="text" name="inform.title" value="<%=inform.getStr("title")%>"/>
	</div>
	<div>
		<label>内容</label>
		<textarea readonly="readonly" name="inform.content" cols="80" rows="10"><%=inform.getStr("content") %></textarea>
	</div>
	<div>
		<div>
		<label>举报人姓名</label>
		<input readonly="readonly" type="text" name="inform.name" value="<%
		if(inform.getStr("name")!=""&&inform.getStr("name")!=null){
			out.print(inform.getStr("name"));
		} else{
			out.println("匿名");
		}%>"/>
	</div>
	<div>
		<div>
		<label>举报人联系方式</label>
		<input readonly="readonly" type="text" name="inform.phone" value="<%
		if(inform.getStr("phone")!=""&&inform.getStr("phone")!=null){
			out.print(inform.getStr("phone"));
		} else{
			out.println("匿名");
		}%>"/>
	</div>
</fieldset> 
	</form>
</div>
