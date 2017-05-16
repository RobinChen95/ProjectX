<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>潇湘书院 - 修改密码</title>
		<link href="css/layout.css" rel="stylesheet" type="text/css" />
		<script>
		function alls() {
			function checkpwd() {
				var userPwdInput0 = document.getElementById("userPwdInput0");
				var userPwdSpan0 = document.getElementById("userPwdSpan0");
				if(userPwdInput0.value==""){
					userPwdSpan0.innerHTML = "请输入密码";
					return false;
				}else {
					userPwdSpan0.innerHTML = "";
					return true;
				}
			}
			
			function checkpwd1() {
				var userPwdInput = document.getElementById("userPwdInput");
				var userPwdSpan = document.getElementById("userPwdSpan");
				var pok1 = /^.{6,22}$/.test(userPwdInput.value);
				var pok2 = /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]+$/.test(userPwdInput.value);
				if(!pok1) {
					userPwdSpan.innerHTML = "请输入6~22位密码";
					return false;
				} else if(!pok2) {
					userPwdSpan.innerHTML = "密码不能出现空格";
					return false;
				} else {
					userPwdSpan.innerHTML = "";
					return true;
				}
			}

			function checkpwd2() {
				var userPwdInput = document.getElementById("userPwdInput").value;
				var userPwdInput1 = document.getElementById("userPwdInput1").value;
				var userPwdSpan1 = document.getElementById("userPwdSpan1");
				if(userPwdInput1 != userPwdInput) {
					userPwdSpan1.innerHTML = "两次密码不一致";
					return false;
				} else {
					userPwdSpan1.innerHTML = "";
					return true;
				}
			}

			

			if(checkpwd()&&checkpwd1() && checkpwd2()) {
				document.getElementById("btn").disabled = "";
			} else {
				document.getElementById("btn").disabled = "disabled";
			}
		}
	</script>
	</head>
	<body>
		<%! 
			String name = null;
		%>
		<% name =request.getSession().getAttribute("sessionname").toString(); %>
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
		
		<div class="pswdAlter">
			<div class="wid-lim">
				<div class="pswdAlter-header">
					<div id="logo">
						<a id="logo" href="Index.jsp">
							<img id="logo" src="img/logo.png" />
						</a>
					</div>
					<h1>修改密码</h1>
				</div>
				<hr />
				<form action = "PwdHandle.jsp" method = "post">
				<table>
					<tr><td id="pswdAlter-table-tr-title">用户名:</td><td><%= name %></td></tr>
					<tr><td id="pswdAlter-table-tr-title">原密码:</td><td><input name="pwd" type="password" placeholder="请输入原密码"  id="userPwdInput0" onblur="alls()"/></td><td><span id="userPwdSpan0" style="color:#FF0000;"></span></td></tr>
					<tr><td id="pswdAlter-table-tr-title">新密码:</td><td><input name="npwd" type="password" placeholder="请输入您的新密码" id="userPwdInput" onblur="alls()"/></td><td><span id="userPwdSpan" style="color:#FF0000;"></span></td></tr>
					<tr><td id="pswdAlter-table-tr-title">确认密码:</td><td><input name="cnfmpwd" type="password" placeholder="请再次输入您的新密码" id="userPwdInput1" onblur="alls()" /></td><td><span id="userPwdSpan1" style="color:#FF0000;"></span></td></tr>
				</table>
				<input class="pswdAlterSbmt" type="submit" value="确认"  id="btn" disabled="disabled"/>
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
</html>