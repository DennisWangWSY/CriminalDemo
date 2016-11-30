<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Criminals"%>
<%@page import="java.util.List"%>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<script>
function validate_required(field,alerttxt)
{
with (field)
  {
  if (value==null||value=="")
    {alert(alerttxt);return false}
  else {return true}
  }
}

function validate_form(thisform)
{
with (thisform)
  {
  if (validate_required(cid,"请填写id")==false)
    {cid.focus();return false;}
    else if(!confirm("你确定要注销该通缉犯?")){
    return false;}
  }
}
function firm(criminalid)
{
	    	if(confirm("你确定要注销通缉犯"+criminalid+"?"))
    		{
        		location.href="/organizer/deletecriminal/"+criminalid;
   			}
}
</script>
<h1>公安人员操作——通缉犯管理</h1>
<h1>在逃人员名单&nbsp;&nbsp;
</h1>
<div id="nav">
	<ul>
	<li><a href="/organizer/search"><b>按要求进行查询</b></a></li>
	<li><a href="/organizer/addcriminal"><b>增加新通缉犯</b></a></li>
	<li><a href="/organizer"><b>回到公安人员主页</b></a></li>
	</ul>
	<ul><li>通过ID注销</li></ul>
	<ul><form action="/organizer/deletecriminalbyid" onsubmit="return validate_form(this)" method="post">	
	     通缉犯id: <input type="text" name="cid" size="30">
				<input type="submit" value="注销"> 
		</form>
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
				<th width="20%">特征描述</th>
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
                <td style="text-align:left;"><img src="/img/<%out.print(re.getStr("image")); %>"></img></td>
				<td style="text-align:left;"><% out.println(re.getStr("name")); %></td>
				<td style="text-align:left;"><% out.println(re.getStr("sex")); %></td>
				<td style="text-align:left;"><% out.println(re.getInt("height")); %></td>
				<td style="text-align:left;"><% out.println(re.getInt("weight")); %></td>
				<td style="text-align:left;"><% out.println(re.getStr("bodytype")); %></td>
				<td style="text-align:left;"><% out.println(re.getStr("phonenumber")); %></td>
				<td style="text-align:left;">
					&nbsp;&nbsp;<a onClick="firm('<%out.print(re.getStr("id"));%>')">注销</a>
					&nbsp;&nbsp;<a href="/organizer/editcriminal/<%out.print(re.getStr("id"));%>">修改</a>
					&nbsp;&nbsp;<a href="/organizer/informbycriminal/1-<%out.print(re.getStr("id"));%>">相关线索</a>
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
				<li><a href="/organizer/arrestorgan/<%=i %>"><b><%=i %></b></a></li>
		 		<%} }%>
	</ul>
	</div>

	<br/><br/><br/>
	
</div>