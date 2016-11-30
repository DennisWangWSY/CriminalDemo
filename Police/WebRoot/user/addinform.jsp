<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="model.Criminals"%>
<%@page import="java.util.List"%>
<h1>网民操作——进行举报</h1>
<h1>举报该通缉犯&nbsp;&nbsp;
</h1>
<div id="nav">
	<ul>
	<li><a href="/user/1"><b>回到通缉犯名单</b></a></li>
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
<div class="form_box">
	<form action="/user/save" method="post">
		<fieldset class="solid">
	<legend>填写举报信息</legend>
	<div>
		<label>被举报人</label>
		<input readonly="readonly" type="text" name="inform.criminal" value="${criminal.getStr("id")}" />
	</div>
	<div>
		<label>标题</label>
		<input type="text" name="inform.title" />
	</div>
	<div>
		<label>内容</label>
		<textarea name="inform.content" cols="80" rows="10"></textarea>
	</div>
	<p>以下为敏感信息，如不方便可不填写</p>
	<div>
		<div>
		<label>您的电话联系方式</label>
		<input type="text" name="inform.phone" />
	</div>
	<div>
		<div>
		<label>您的姓名</label>
		<input type="text" name="inform.name"/>
	</div>
	<div>
		<label>&nbsp;</label>
		<input value="提交" type="submit">
	</div>
</fieldset> 
	</form>
</div>
