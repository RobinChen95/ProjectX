<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
		<title>潇湘书院-全部商品</title>
		<link href="css/layout.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/global.css">
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script src="js/slides.min.jquery.js"></script>
		<script>
			$(function(){
				$('#slides').slides({
					preload: true,
					play: 2500,auto:true,
					pause: 2500,
					hoverPause: true
					 
				});
			});
		</script>
	</head>
	<body>
		<div class="nav">
			<div class="wid-lim">
				<div class="nav-cont">
				<%
				if(request.getSession().getAttribute("sessionname")!=null){
					out.print("<div>欢迎你！尊敬的"+request.getSession().getAttribute("sessionname")+"</div>");
					out.print("<a href=\"UserInfo.jsp\">修改个人信息</a>");
					out.print("<a href=\"Cart.jsp\">购物车</a>");
					out.print("<a href=\"Order.jsp\">交易记录</a>");
				}
				else out.print("<div>游客你好，请 <a href=\"Login.jsp\">登录</a> 或 <a href=\"Register.jsp\">免费注册</a>！</div>");
				%>					
				</div>
				<div class="clear"></div>
			</div>
		</div>
		

		<div class="cargoList">
			<div class="wid-lim">
				<div class="cargoList-header">
					<div id="logo">
						<a id="logo" href="Index.jsp">
							<img id="logo" src="img/logo.png" />
						</a>
					</div>
					<h1>全部商品</h1>
				</div>
				<hr />
				<div class="cargoListCont">
					<div class="douch-bot">
	
						<ul class="douch-bot-bottom-cargoset">
	<%
	try {
		String name = null,author = null ,pic = null;int price=0,id = 0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
		Statement s = con.createStatement();
		String sql = "SELECT * FROM goodsinfo";
		ResultSet rs = s.executeQuery(sql);
		while(rs.next()){
			name = rs.getString(2);
			author = rs.getString(3);
			price = rs.getInt(4);
			pic = rs.getString(6);
			id=rs.getInt(1);
			out.println("<li class=\"douch-bot-cargo\">");
			out.println("<a><img src=\""+pic+"\" /></a>");
			out.println("<span>");
			out.println("<h1><a>"+name+"</a></h1>");
			out.println("<h2>"+author+"</h2>");
			out.println("<h3>¥"+price+"<a href=\"MainHandle.jsp?id="+id+"\">加入购物车</a></h3>");
			out.println("</span>");
			out.println("</li>");
		}
		s.close();
		con.close();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
	out.println("<div class=\"clear\"></div>");
	%>
						</ul>						
					</div>
				</div>




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
