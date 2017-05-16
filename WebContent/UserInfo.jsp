<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>潇湘书院 - 个人信息</title>
		<link href="css/layout.css" rel="stylesheet" type="text/css" />
		<script language="javascript" src="js/PCASClass.js"></script>
		<script language="javascript" src="js/geo.js"></script>
	</head>
	<body onload="setup();preselect('省');promptinfo()">
		<%! 
			String name = null;
		%>
		<% 
		
		name =request.getSession().getAttribute("sessionname").toString(); 
		%>
		<div class="nav">
			<div class="wid-lim">
				<div class="nav-cont">
				<%
				if(request.getSession().getAttribute("sessionname")!=null){
					out.print("<div>欢迎你！尊敬的"+request.getSession().getAttribute("sessionname")+"</div>");
					out.print("<a href=\"Index.jsp\">回到主页</a>");
					out.print("<a href=\"UserInfo.jsp\">修改个人信息</a>");
					out.print("<a href=\"Cart.jsp\">购物车</a>");
					out.print("<a href=\"Order.jsp\">交易记录</a>");
					out.print("<a href=\"Logout.jsp\">退出</a>");
				}
				else out.print("<div>游客你好，请 <a href=\"Login.jsp\">登录</a> 或 <a href=\"Register.jsp\">免费注册</a>！</div>");
				%>			
				</div>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="userInfo">
			<div class="wid-lim">
				<div class="userInfo-header">
					<div id="logo">
						<a id="logo" href="Index.jsp">
							<img id="logo" src="img/logo.png" />
						</a>
					</div>
					<h1>个人信息管理</h1>
				</div>
				<hr />
				<form action = "UserInfoHandle.jsp" method = "post">
				<table>
					<tr><td id="userInfo-table-tr-title">用户名:</td><td><%= name%></td></tr>
					<tr><td id="userInfo-table-tr-title">电子邮箱:</td><td><input id="userEmailInput" name="email" type="text" value="" onblur="alls();"/></td><td><span id="userEmailSpan"  style="color:#FF0000;"></span></td></tr>
					<tr><td id="userInfo-table-tr-title">联系电话:</td><td><input id="userPhoneInput" name="telphone" type="text" value="" onblur="alls();"/></td><td><span id="userPhoneSpan"  style="color:#FF0000;"></span></td></tr>
					<tr><td id="userInfo-table-tr-title">地址:</td><td>
			<form name="shareip" action="/cgi-bin/feedback" method="post">
			<select class="select" name="province" id="s1" onblur="alls();">
			  <option></option>
			</select>
			<select class="select" name="city" id="s2" onblur="alls();">
			  <option></option>
			</select>
			<select class="select" name="town" id="s3" onblur="alls();">
			  <option></option>
			</select>
			<input class="select" name="detail" onblur="alls();" type="text" id="s4" />
			<input id="address" name="address" type="hidden" value="document.getElementById('address').value">
        </form>
					</td></tr>
				</table>
				<a href="PwdAlter.jsp">修改密码</a>
				<input type="submit" value="确认" id="btn" disabled="disabled"/>
				</form>
			</div>
		</div>
		
		<div class="bottom">
			<div class="wid-lim">
				<div class="bottom-left">
				© 2016 - 2026 xxshuyuan.com, all rights reserved<br/>网络视听许可证<a href="Index.jsp">0610419</a>号  文网文[2016]231号  新出网证(京)字563号
				<img src="img/biaoshi.png" />
				</div>
				<div class="bottom-right">
					<a href="Index.jsp">联系我们</a> · <a href="Index.jsp">版权声明</a> · <a href="Index.jsp">使用反馈</a> · <a href="Index.jsp">常见问题</a> · <a href="Index.jsp">来这里工作</a>
				</div>
				<div class="clear"></div>
			</div>			
		</div>
		
	</body>
	<script>
		function promptinfo()
		{		
		var address = document.getElementById('address');
		var s1 = document.getElementById('s1');
		var s2 = document.getElementById('s2');
		var s3 = document.getElementById('s3');
		var s4 = document.getElementById('s4');
		address.value = s1.value + s2.value + s3.value+ s4.value;
		if(!(s3.value=="区/县"||s4.value=="")){
			return true;
		}
		return false;
		}
	function alls(){
		function checkphone(){
		var userPhoneInput = document.getElementById("userPhoneInput");
		var userPhoneSpan = document.getElementById("userPhoneSpan");
		var ok1 =/^(13[0-9]|15[0|1|3|6|7|8|9]|18[2|7|8|9])\d{8}$/.test(userPhoneInput.value);
		if(!ok1){
		userPhoneSpan.innerHTML = "电话格式不正确";
		return false;
		}else{
		userPhoneSpan.innerHTML = "";
		return true;
		}
		}

		function checkemail(){
		var userEmailInput = document.getElementById("userEmailInput");
		var userEmailSpan = document.getElementById("userEmailSpan");
		var ok1 = /^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$/.test(userEmailInput.value);
		if(!ok1){
		userEmailSpan.innerHTML = "邮箱格式不正确";
		return false;
		}else{
		userEmailSpan.innerHTML =" ";
		return true;
		}
		}
		if(checkemail()&&checkphone()&&promptinfo()) {
				document.getElementById("btn").disabled = "";
			} else {
				document.getElementById("btn").disabled = "disabled";
				alert(pre);
			}
		}
	</script>
</html>
