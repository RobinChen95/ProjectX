<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title></title>
		<style type="text/css">
			body {
				width: 100%;
				background-color: #F6F6F1;
				margin: 0;
			}
			
			.header_login {
				position: absolute;
				left: 0px;
				top: 0px;
				margin-top: 100px;
				margin-left: 150px;
			}
			
			.header_login #logo {
				float: left;
			}
			
			.header_login span {
				float: left;
				font-family: '微软雅黑';
				font-size: 32px;
				font-weight: 900;
				font-style: normal;
				color: #000000;
				margin-left: 30px;
				margin-top: 5px;
			}
			
			.clear {
				clear: both;
			}
			
			.a_line hr {
				size: 10px;
				color: #936464;
			}
			
			.a_line {
				position: absolute;
				left: 0px;
				top: 0px;
				width: 100%;
				margin-top: 160px;
			}
			
			.bg_picture {
				margin-left: 100px;
				margin-top: 270px;
			}
			
			.bg_picture img {
				width: 1430px;
				height: 360px;
			}
			
			.login_part {
				background-color:#ffffff;
				position: absolute;
				left: 0px;
				top: 0px;
				width: 300px;
				height: 280px;
				border:1px solid;
				border-color: #797979;
				margin-top: 310px;
				margin-left: 1000px;
			}
			
			.login_part form {
				left: 0px;
				top: 0px;
				width: 300px;
			}
			
			.login_part #w_login {
				font-weight: 700;
				font-family: '微软雅黑';
				font-size: 20px;
				color: #825d5b;
				margin-left: 20px;
				margin-top: 10px;
			}
			
			.login_part #input_1 input {
				border:1px solid;
				border-color: #797979;
				width: 219px;
				height: 38px;
				margin-left: 5px;
			}
			
			.login_part #input_1 img {
				float: left;
				margin-left: 18px;
				margin-top: 7px;
			}
			
			.login_part p {
				width: 300px;
				height: 48px;
				margin-bottom: 0px;
			}
			
			.login_part #input_2 input {
				border:1px solid;
				border-color: #797979;
				width: 219px;
				height: 38px;
				margin-left: 5px;
			}
			
			.login_part #input_2 img {
				float: left;
				margin-left: 18px;
				margin-top: 7px;
			}
			
			.login_part #input_3 input {
				border:1px solid;
				border-color: #797979;
				width: 107px;
				height: 29px;
				margin-left: 53px;
			}
			
			.login_part #input_3 img {
				width: 99px;
				height: 30px;
				margin-left: 5px;
				vertical-align: top;
			}
			.login_part a{text-decoration: underline;margin:0px;text-align: center;font-size: 13px;color:#797979;margin-left: 61px;}
			.login_part form button{background:none;border:none;font-size: 28px;font-weight: 700;margin-left: 10px;
color: #825D5B;}
.bottom{ background-color: #B6A58B; padding: 15px 0;margin-top: 200px;}
			.bottom-left{ float: left; text-align: left; color: #363636;}
			.bottom-left img{ height: 17px; width: 15px;}
			.bottom-right{ float: right; color: #434343;}
			.bottom a{ color: #434343; margin: 0 3px;}
			.bottom a:hover{ background-color: #676767; color: #FFFFFF; }
			.code {
				background-image: url(111.jpg);
				font-family: Arial, 宋体;
				font-style: italic;
				color: green;
				border: 0;
				padding: 2px 3px;
				letter-spacing: 3px;
				font-weight: bolder;
			}
			
			.unchanged {
				border: 0;
			}
		</style>
		<link href="css/layout.css" rel="stylesheet" type="text/css" />
		<script language="javascript" type="text/javascript">
			var code; //在全局 定义验证码 
			function createCode() {
				code = new Array();
				var codeLength = 4; //验证码的长度 
				var checkCode = document.getElementById("checkCode");
				checkCode.value = "";

				var selectChar = new Array(2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');

				for(var i = 0; i < codeLength; i++) {
					var charIndex = Math.floor(Math.random() * 32);
					code += selectChar[charIndex];
				}
				if(code.length != codeLength) {
					createCode();
				}
				checkCode.value = code;
			}

			function alls() {
				function checkname() {
					var userNameInput = document.getElementById("userNameInput");
					var userNameSpan = document.getElementById("userNameSpan");
					var nok1 = /^.{6,16}$/.test(userNameInput.value);
					var nok2 = /^[A-Za-z0-9]+$/.test(userNameInput.value);
					if(userNameInput.value == "") {
						userNameSpan.innerHTML = "用户名不能为空";
						return false;
					} else if(!nok1) {
						userNameSpan.innerHTML = "用户名必须为6-16位";
						return false;
					} else if(!nok2) {
						userNameSpan.innerHTML = "用户名必须由字母和数字构成";
						return false;
					} else {
						userNameSpan.innerHTML = "";
						return true;
					}
				}

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

				function validate() {
					var inputCode = document.getElementById("input1").value.toUpperCase();
					if(inputCode.length <= 0) {
						checknum.innerHTML = "请输入验证码！";
						return false;
					} else if(inputCode != code) {
						checknum.innerHTML = "验证码输入错误！";
						return false;
					} else {
						checknum.innerHTML = "  ";
						return true;
					}

				}

				if(checkname() && checkpwd() && validate()) {
					document.getElementById("btn").disabled = "";
				} else {
					document.getElementById("btn").disabled = "disabled";
				}
			}
		</script>
	</head>

	<body onload="createCode();">
		<div class=header_login>

			<img id="logo" src="img/logo.png">

			<span>欢迎登录</span>
			<div class="clear"></div>
		</div>
		<div class=a_line>
			<hr />
		</div>
		<div class=bg_picture>
			<img src="img/background_login.jpg" />
		</div>

		<div class=login_part>
			<div id="w_login">会员登录</div>
			<form action="LogHelp.jsp" method="post">
				<p id="input_1">
					<img src="img/people.png" style="width:28px;height:28px;" /> <input type="text" name="userName" placeholder="请输入用户名" id="userNameInput" onblur="alls();"/>
					<br /><span id="userNameSpan" style="color:#FF0000;"></span><br />
				</p>
				<p id="input_2">
					<img src="img/lock.png" style="width:28px;height:28px;" /><input type="password" name="passWord" placeholder="请输入密码" id="userPwdInput0" onblur="alls();"/><br />
				<span id="userPwdSpan0" style="color:#FF0000;"></span><br />
				</p>
				<p id="input_3">
					<input type="text" name="number" placeholder="请输入验证码" id="input1" onblur="alls();"/>
					<input type="button" id="checkCode" class="code" style="width: 99px;height: 30px;margin-left: 2px;vertical-align: top;" onClick="createCode()" />
					<br /><span id="checknum" style="color:#FF0000;"></span></br>
				</p>

				<a href="Register.jsp" style="text-decoration: none">没有账号？免费注册</a>
				<button name="login_button" type="submit" value="login" id="btn" disabled="disabled">登录</button>
			</form>

		</div>
<div class="bottom">
			<div class="wid-lim">
				<div class="bottom-left">
				© 2016 - 2026 xxshuyuan.com, all rights reserved<br/>网络视听许可证<a href="index.html">0610419</a>号  文网文[2016]231号  新出网证(京)字563号
				<img src="img/biaoshi.png" />
				</div>
				<div class="bottom-right">
					<a href="index.html">联系我们</a> · <a href="index.html">版权声明</a> · <a href="index.html">使用反馈</a> · <a href="index.html">常见问题</a> · <a href="index.html">来这里工作</a>
				</div>
				<div class="clear"></div>
			</div>			
		</div>
	</body>

</html>