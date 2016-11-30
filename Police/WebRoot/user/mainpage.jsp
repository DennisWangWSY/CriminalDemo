<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Criminals"%>
<%@page import="java.util.List"%>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<h1>网民操作——通缉犯查看</h1>
<h1>在逃通缉犯&nbsp;&nbsp;
</h1>
<div id="nav">
	<ul>
	<li><a href="/user/search"><b>按要求进行查询</b></a></li>
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
				<li><a href="/user/<%=i %>"><b><%=i %></b></a></li>
		 		<%} }%>
	</ul>
	</div>

	<br><br><br>
	
</div>