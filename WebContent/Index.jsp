<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
		<title>欢迎来到潇湘书院</title>
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
					out.print("<a href=\"Logout.jsp\">退出</a>");
				}
				else out.print("<div>游客你好，请 <a href=\"Login.jsp\">登录</a> 或 <a href=\"Register.jsp\">免费注册</a>！</div>");
				%>		
				</div>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="douchbag">
			<hr id="center-hr" />
			<div class="wid-lim">
				<div class="douch-top">
					<ul>
						<li><div id="logo"><a id="logo" href="Index.jsp"><img src="img/logo.png" /></a></div></li>
						<form action = "Index.jsp" method ="post">
						<li><input id="search" name="search" type="text" placeholder="作品/作者/出版社" /></li>
						<li><input id="search-submit" type="submit" value="搜索"></input></li>
						</form>
						<li><img id="2dcode" src="img/2dmtncode.png"/></li>
						<li><span><p>扫码下载</p><p>手机客户端</p></span></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div id="douch-center-lefter-border"></div>
				<div class="douch-center">
					<div class="douch-center-right">
						<div class="douch-center-right-top">
							<ul>
								<li><a href="Index.jsp">首页</a></li>
								<li><a href="Index.jsp">限时活动</a></li>
								<li><a href="Index.jsp">书友同城活动</a></li>
								<li><a href="Index.jsp">线下门店</a></li>
								<li><a href="Index.jsp">潇湘书院出版社</a></li>
							</ul>
							<div class="clear"></div>
						</div>
						<div class="douch-center-right-left">
							<div id="container">
								<div id="example">
									<div id="slides">
										<div class="slides_container">
											<a href="Index.jsp" target="_blank"><img src="img/slide/slide-1.jpg" alt="Slide 1"></a>
											<a href="Index.jsp" target="_blank"><img src="img/slide/slide-2.jpg" alt="Slide 2"></a>
											<a href="Index.jsp" target="_blank"><img src="img/slide/slide-3.jpg" alt="Slide 3"></a>
											<a href="Index.jsp" target="_blank"><img src="img/slide/slide-4.jpg" alt="Slide 4"></a>
											<a href="Index.jsp" target="_blank"><img src="img/slide/slide-5.jpg" alt="Slide 5"></a>
											<a href="Index.jsp" target="_blank"><img src="img/slide/slide-6.jpg" alt="Slide 6"></a>
											<a href="Index.jsp" target="_blank"><img src="img/slide/slide-7.jpg" alt="Slide 7"></a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="douch-center-right-right">
							<a href="Index.jsp"><img src="img/notice.jpg" /></a>
							<span>17/01/26 - 17/02/01 期间网站暂停运营</span>
							<ul>
								<li>
									<p>特惠商品</p>
									<a href="Index.jsp"><img src="img/tehui.jpg" /></a>
								</li>
								<li>
									<p>促销团购</p>
									<a href="Index.jsp"><img src="img/tuangou.jpg" /></a>
								</li>
								<li>
									<p>秒抢商品</p>
									<a href="Index.jsp"><img src="img/miaoqiang.jpg" /></a>
								</li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
					<div class="douch-center-left">
						<ul>
							<li id="douch-center-left-title">商品分类</li>
							<li><a href="Index.jsp">教育</a></li>
							<li><a href="Index.jsp">小说</a></li>
							<li><a href="Index.jsp">文学</a></li>
							<li><a href="Index.jsp">社科</a></li>
							<li><a href="Index.jsp">传记</a></li>
							<li><a href="Index.jsp">摄影</a></li>
							<li><a href="Index.jsp">科技</a></li>
							<li><a href="Index.jsp">漫画</a></li>
							<li><a href="Index.jsp">生活</a></li>
							<li><a href="Index.jsp">原版书</a></li>
							<li><a href="Index.jsp">期刊</a></li>
							<li><a href="Index.jsp">工具书</a></li>
							<li><a href="Index.jsp">其他</a></li>
							<div class="clear"></div>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				
				<div class="douch-bot">
					<div class="douch-bot-top">
						<div class="douch-bot-top-topone">
							<span>全部商品</span>
							<br />
							<ul>
								<li>分类</li>
								<li><a href="Index.jsp">文学</a></li>
								<li><a href="Index.jsp">扯淡</a></li>
							</ul>
						</div>
						<a class="douch-bot-top-topone" href="CargoList.jsp">More>></a>
						<div class="clear"></div>
					</div>
					<hr />
					 <ul class="douch-bot-bottom-cargoset">	
<%!
String pic = null;
String author = null;
String name = null;
String id = null;
int price=0;
%>			 
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	String sql = "SELECT * FROM goodsinfo ORDER BY RAND() LIMIT 5";
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
		name = rs.getString(2);
		author = rs.getString(3);
		price = rs.getInt(4);
		pic = rs.getString(6);
		id=rs.getString(1);
		out.println("<li class=\"douch-bot-cargo\">");
		out.println("<a href=\"Detail.jsp?id="+id+"\"><img src=\""+pic+"\" /></a>");
		out.println("<span>");
		out.println("<h1><a href=\"Detail.jsp?id="+id+"\">"+name+"</a></h1>");
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
				<div class="douch-bot">
					<div class="douch-bot-top">
						<span>最新商品</span>
						<a href="CargoList.jsp">More>></a>
						<div class="clear"></div>
					</div>
					<hr />
					<ul class="douch-bot-bottom-cargoset">
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	String sql = "SELECT * FROM goodsinfo ORDER BY RAND() LIMIT 5";
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
		name = rs.getString(2);
		author = rs.getString(3);
		price = rs.getInt(4);
		pic = rs.getString(6);
		id=rs.getString(1);
		out.println("<li class=\"douch-bot-cargo\">");
		out.println("<a href=\"Detail.jsp?id="+id+"\"><img src=\""+pic+"\" /></a>");
		out.println("<span>");
		out.println("<h1><a href=\"Detail.jsp?id="+id+"\">"+name+"</a></h1>");
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
				<div class="douch-bot">
					<div class="douch-bot-top">
						<span>编辑推荐</span>
						<a href="CargoList.jsp">More>></a>
						<div class="clear"></div>
					</div>
					<hr />
					<ul class="douch-bot-bottom-cargoset">
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	String sql = "SELECT * FROM goodsinfo ORDER BY RAND() LIMIT 5";
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
		name = rs.getString(2);
		author = rs.getString(3);
		price = rs.getInt(4);
		pic = rs.getString(6);
		id=rs.getString(1);
		out.println("<li class=\"douch-bot-cargo\">");
		out.println("<a href=\"Detail.jsp?id="+id+"\"><img src=\""+pic+"\" /></a>");
		out.println("<span>");
		out.println("<h1><a href=\"Detail.jsp?id="+id+"\">"+name+"</a></h1>");
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
						<div class="clear"></div>
					</ul>						
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
