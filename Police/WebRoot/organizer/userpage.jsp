<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<script>
function firm(userid)
{
    if(confirm("你确定要删除用户"+userid+"?"))
    {
        location.href="/organizer/deleteuser/"+userid;
   }
}
</script>
<h1>管理员操作——用户信息管理</h1>
<h1>用户信息浏览&nbsp;&nbsp;
</h1>
<div id="nav">
	<ul>
	<li><a href="/organizer/adduser"><b>添加新用户</b></a></li>
	</ul>
</div>

<div class="table_box">
	<table class="list">
		<tbody>
			<tr>	
				<th width="25%">id</th>
				<th width="25%">用户名</th>
				<th width="25%">类别</th>
				<th width="25%">操作</th>
			</tr>
	 		<%
	 		Page<Users> cpage = (Page<Users>)request.getAttribute("userPage");
    		List<Users> list= cpage.getList();
    		if(list!=null){
        		Iterator<Users> iter=list.iterator();
        		while(iter.hasNext()){
            		Users re = iter.next();
                %>
                <tr>
                <td style="text-align:left;"><% out.println(re.getId());%></td>
				<td style="text-align:left;"><% out.println(re.getStr("name")); %></td>
				<td style="text-align:left;"><% if(re.getStr("type").equals("user")) out.print("公安人员");
												else out.print("管理员"); %></td>
				<%
					if (re.getStr("name").equals(request.getSession().getAttribute("name").toString())){ 
				%>
				<td style="text-align:left;">
					&nbsp;&nbsp;<a href="/organizer/edituser/<%out.println(re.getId());%>">修改</a>
				</td>
				<%}else{ %>
				<td style="text-align:left;">
					&nbsp;&nbsp;<a onClick="firm(<%out.println(re.getId());%>)" >删除</a>
					&nbsp;&nbsp;<a href="/organizer/edituser/<%out.println(re.getId());%>">修改</a>
				</td>
				<%} %>
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
				<li><a href="/organizer/userorgan/<%=i %>"><b><%=i %></b></a></li>
		 		<%} }%>
	</ul>
	</div>

	
	<br><br><br>
	
	<br/><br/><br/>
	
</div>