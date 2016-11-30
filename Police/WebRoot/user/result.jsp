<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Criminals"%>
<%@page import="java.util.List"%>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<h1>网民操作——查找通缉犯</h1>
<h1>按条件检索&nbsp;&nbsp;
</h1>
<div id="nav">
	<ul>
	<li><a href="/user/1"><b>回到通缉犯名单</b></a></li>
	</ul>
</div>
<div class="form_box">
	<form action="/user/dosearch/1" method="post">
		<fieldset class="solid">
	<legend>您的查询条件</legend>
	<div>
		<label>身份证号码</label>
		<input type="text" name="id" value="${id }"/>
	</div>
	<div>
		<label>姓名（部分匹配）</label>
		<input type="text" name="name" value="${name }" />
	</div>
	<div>
	<label>性别</label>
	<select name="sex">
			<% System.out.println(request.getAttribute("sex").toString());
			if(request.getAttribute("sex").toString().equals("男")){
			%>
			<option value="男" selected="selected">男</option>
			<option value="女">女</option>
			<option value=""></option>
			<%
			}else if(request.getAttribute("sex").toString().equals("女")){%>
			<option value="男">男</option>
			<option value="女" selected="selected">女</option>
			<option value=""></option>
			<%
			}else{%>
			<option value="男">男</option>
			<option value="女">女</option>
			<option value="" selected="selected"></option>
			<%} %>
	</select>
	</div>
	<div>
		<label>身高</label>
		<select name="lheight">
			<%for(int i=120;i<=250;i++){ 
				if(i!=Integer.parseInt(request.getAttribute("lheight").toString())){%>
					<option value ="<%=i %>"><%=i %></option> 
				<%}else{ %>
					<option value="<%=i %>" selected="selected"><%=i %></option>
			<%}}%>
		</select>
		cm 至
		<select name="hheight">
			<%for(int i=120;i<=250;i++){ 
				if(i!=Integer.parseInt(request.getAttribute("hheight").toString())){%>
					<option value ="<%=i %>"><%=i %></option> 
				<%}else{ %>
					<option value="<%=i %>" selected="selected"><%=i %></option>
			<%}}%>
		</select>
		cm
	</div>
		<div>
		<label>体重</label>
		<select name="lweight">
			<%for(int i=40;i<=250;i++){ 
				if(i!=Integer.parseInt(request.getAttribute("lweight").toString())){%>
					<option value ="<%=i %>"><%=i %></option> 
				<%}else{ %>
					<option value="<%=i %>" selected="selected"><%=i %></option>
			<%}}%>
		</select>
		kg 至
		<select name="hweight">
			<%for(int i=40;i<=250;i++){ 
				if(i!=Integer.parseInt(request.getAttribute("hweight").toString())){%>
					<option value ="<%=i %>"><%=i %></option> 
				<%}else{ %>
					<option value="<%=i %>" selected="selected"><%=i %></option>
			<%}}%>
		</select>
		kg
	</div>
	
	<div>
		<label>&nbsp;</label>
		<input value="提交" type="submit">
	</div>
</fieldset> 
	</form>
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
				<th width="20%">操作</th>
			</tr>
	 		<%
	 		Page<Criminals> cpage = (Page<Criminals>)request.getAttribute("criminalPage");
    		List<Criminals> list= cpage.getList();
    		if(list!=null){
        		Iterator<Criminals> iter=list.iterator();
        		while(iter.hasNext()){
            		Criminals re = iter.next();
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
				<td style="text-align:left;">
                	<a href="/user/addinform/<%=re.getStr("id") %>">&nbsp;&nbsp;举报该人&nbsp;&nbsp;</a>
					
				</td>
				</tr>
        		<%
        		}
    		}%>
		</tbody>
	</table>
	<div id="nav">
	<ul>
	<%
			int pagenumber = cpage.getTotalPage();
			int currentpage = cpage.getPageNumber();
			for(int i=1; i<=pagenumber;i++){
				if(i==currentpage){
			%>	<li><b><%=i %></b></li>	<%
				}
				else{%>
				<li><a href="/user/dosearch2/<%=i %>"><b><%=i %></b></a></li>
		 		<%} }%>
	</ul>
	</div>
	<br><br><br>
	</div>