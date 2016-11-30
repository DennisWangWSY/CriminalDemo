<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<h1>非法的页面访问</h1>
<div class="table_box" style="margin:0 auto;text-align:center">
	<p>对页面的访问
	<br>
	<strong>缺少必要的参数列表</strong></p>
	
	<br><br><br>
	
	您已成功登陆
	<%  String href = request.getSession().getAttribute("type").toString();
		if(href.equals("u")) href="/organizer";
		else href="/organizer/userorgan/1";
		System.out.println(href);	 %>
	<br/><br/>
	点击<a href="<%=href%>">此处</a>进入系统
	
	
</div>