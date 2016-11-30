<jsp:include page="/common/layout.jsp"></jsp:include>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<style type="text/css">
label{
float: center;
width: 200px;
}
input{
width: 180px;
border:1px solid #808080
}
#sbutton{
margin-left: 80px;
margin-top: 5px;
width:80px;
}
</style>
<script>  
function refresh() {  
    document.getElementById("authImg").src = "${basePath}/captcha/"+new Date();  
}  
</script> 
<h1>登录</h1>
<div class="table_box" style="margin:0 auto;text-align:center">
	<br/><br/><br/>
    <form method="post" action="/check">
    <p><label>用户名</label> 
    &nbsp;
	<input type="text" name="username"></p>
  	<p><label>密&nbsp;&nbsp;&nbsp;&nbsp;码 </label>
    &nbsp;
	<input type="password" name="password"></p>
	<p><label>验证码</label>
	&nbsp;
	<input type="text" name="captcha"></p>
	<img id="authImg" src="${basePath}/captcha">
	<a href="#" onClick="refresh()">看不清</a>
	
    <input type="submit" id="sbutton" name="Submit" value="登录">
    
    </form>
    <br/><br/><br/>
    

</div>