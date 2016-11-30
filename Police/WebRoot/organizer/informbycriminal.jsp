<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="model.Criminals"%>
<%@page import="model.Inform" %>
<%@page import="java.util.List"%>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<h1>公安人员操作——查看举报信息</h1>
<h1>具体通缉犯的线索&nbsp;&nbsp;
</h1>
<div id="nav">   
	<ul>
				<%
				Criminals cri = (Criminals)request.getAttribute("criminal");
				Page<Inform> cpage = (Page<Inform>)request.getAttribute("informPage");
				int pagenumber = cpage.getTotalPage();
				int currentpage = cpage.getPageNumber();
			 %> 
	<li><a href="/organizer"><b>回到公安人员主页</b></a></li>
		<li><a href="/organizer/informorgan/1"><b>所有举报信息列表</b></a></li>
	
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
                <tr>
                <td style="text-align:left;"><% out.println(cri.getStr("id"));%></td>
                <td style="text-align:left;"><img src="/img/<%out.println(cri.getStr("image")); %>"></img></td>
				<td style="text-align:left;"><% out.println(cri.getStr("name")); %></td>
				<td style="text-align:left;"><% out.println(cri.getStr("sex")); %></td>
				<td style="text-align:left;"><% out.println(cri.getInt("height")); %></td>
				<td style="text-align:left;"><% out.println(cri.getInt("weight")); %></td>
				<td style="text-align:left;"><% out.println(cri.getStr("bodytype")); %></td>
				<td style="text-align:left;"><% out.println(cri.getStr("phonenumber")); %></td>
				</tr>
		</tbody>
	</table>
	</div>
<div class="table_box">
	<table class="list">
		<tbody>
			<tr>	
				<th width="20%">被举报通缉犯ID</th>
				<th width="20%">标题</th>
				<th width="20%">举报者姓名</th>
				<th width="20%">举报者联系方式</th>
				<th width="20%">操作</th>
			</tr>
	 		<%
    		List<Inform> list= cpage.getList();
    		if(list!=null){
        		Iterator<Inform> iter=list.iterator();
        		while(iter.hasNext()){
            		Inform re = iter.next();
                %>
                <tr>
                <td style="text-align:left;"><% out.print(re.getStr("criminal"));%></td>
				<td style="text-align:left;"><% out.print(re.getStr("title")); %></td>
				<td style="text-align:left;">
				<%
					if(re.getStr("name")!=""&&re.getStr("name")!=null){
						out.print(re.getStr("name"));
					}else{
						out.print("匿名举报");
					}
					  %>
				</td>
				<td style="text-align:left;">
					<%
					if(re.getStr("phone")!=""&&re.getStr("phone")!=null){
						out.print(re.getStr("phone"));
					}else{
						out.print("未留下");
					}
					  %>
				</td>

				<td style="text-align:left;">
					&nbsp;&nbsp;<a href="/organizer/informdetail/<%out.print(re.getInt("num"));%>">查看详情</a>
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
			for(int i=1; i<=pagenumber;i++){
				if(i==currentpage){
			%>	<li><b><%=i %></b></li>	<%
				}
				else{%>
				<li><a href="/organizer/informbycriminal/<%=i %>-<%out.print(cri.getStr("id"));%>"><b><%=i %></b></a></li>
		 		<%} }%>
	</ul>
	</div>

	
	<br><br><br>
	
	<br/><br/><br/>
	
</div>

</fieldset> 
	</form>
</div>
