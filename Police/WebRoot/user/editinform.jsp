<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Criminals"%>
<%@page import="java.util.List"%>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<h1> ---&gt; 修改举报信息
</h1>
<div class="form_box">
	<form action="/user/edit" method="post">
		<jsp:include page="addinform.jsp" />
	</form>
</div>