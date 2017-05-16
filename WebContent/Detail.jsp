<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<title>商品详情</title>
		<link href="css/layout.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
			body {
				width: 100%;
				background-color: #F6F6F1;
				margin: 0;
			}
			.dingdan-head{
				width: 100%;

		height: 34px;
		overflow:hidden;
		background: #b6a58b;
		margin:auto;
		}
		.dingdan-head-last{
		margin-left:390px ;
		display: inline-block;
		height: 34px;
		text-align:center;
		}
		.dingdan-head-last a:hover{color: orangered;}
		.dingdan-head-last a{
		margin-left: 10px;
		text-decoration:none;
		font-family: Arial;
		font-size: 12px;
		color: #000000;
		}
		.dingdan-mid{
		width: 100%;
		height: 90px;
		border-bottom:1px solid #000000;
		position: relative;
		}
		#pic{
		float: left;
		}
		.dingdan-mid img{
		margin-left: 300px;
		margin-top: 22px;
		float: left;
		}
		.dingdan-mid-mid{
		padding:35px 290px 13px 150px;
		font-family: Arial;
		font-size: 30px;
		color: #000000;
		}
		.dingdan-mid-last{
		top:50px;
		left:1144px;
		position:absolute;
		font-family: Arial;
		font-size: 16px;
		color: #000000;
		}
			.dingdan-next{
		width: 100%;
		height: 90px;
		border-bottom:1px solid #825D5B;
		}.wid-lim0{width: 100%;}
            .mid_book{ height:350px; width:650px; margin: 0 auto;}
            .book_img{margin-top:30px;float:left;}
            .dingdan-mid-mid{position: relative;left:-90px;}
            .book_img img{width:180px;height:250px;}
            .book_infomation {text-align: initial;float:left;margin-top:30px;font-size: 25px;width: 400px;border-right: 1px;solid #825D5B;}
            .book_infomation ul li{text-align: initial; font-weight: normal;padding: 3px 0;}
            #book_name{color:#825D5B; }
            #book_author{color:#999999; font-size: 19px;}
            #book_publisher{color:#999999; font-size: 17px;}
            .book_infomation #book_prices{margin-top: 65px;float: left;padding-left: 60px; color: #555555; font-size: 19px;}
            .book_infomation a {
            	padding: 0 5px;
				background:#FA595F;
				text-align: center;
				border: solid;
				font-size: 20px;
				font-weight: 600;
				color: #FFFFFF;
				border: 1px #797979 solid;
				margin-left: 30px;float: left;margin-top:60px;}
			.book_details{ width: 1000px; margin: 0 auto;}
				.book_details_1 {text-align: initial;font-size: 25px;color:#936464;font-weight: normal;}
				.book_details_2{text-align: initial;text-indent: 2em;font-size: 17px;color: #444444;}
			</style>
			
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
		<div class="wid-lim0">
		<div class="dingdan-mid">
			<div id="pic">
				<a href="Index.jsp"><img src="img/logo.png" /></a>
			</div>
			
			<div class="dingdan-mid-mid">商品详情</div>
		</div>
		<!-- <div class="mid_book">
		<div class="book_img">
			<img src="img/cargo-000006.png"	>
		</div>
		<div class="book_infomation">
			<ul type=none>
			<li id="book_name">Swim</li>
		
			<li id="book_author">OD</li>
	
			<li id="book_publisher">潇湘书院出版社</li>
			
			</ul>
			<ul id="book_prices">¥22.50</ul>
			<a href="MainHandle.jsp">加入购物车</a>
		</div>
		<div class="clear"></div>
		</div>
		<div class="book_details">
			<ul class="book_details_1">导读</ul>
			<ul class="book_details_2">
<p>和我爸爸练瑜伽的前篇，还是那对熊爸熊孩。讲的是一个望子成龙的父亲带女儿去上游泳课。</p>
<p>放轻松来看看这个小故事，把他送给你亲爱的爸爸妈妈。绘本是比语言更委婉的表达，我想画出那句说出来太唐突的「我爱你」。</p>
<p>OD，一只的中二病患者。</p>-->
<%
  String name = null,author = null,Press = null,pic=null,Intro=null;int price=0;
  int Id = Integer.parseInt(request.getParameter("id"));
  try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	String sql = "select * from goodsinfo where GoodsId ="+Id;
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
	name=rs.getString(2);
	author=rs.getString(3);
	price=rs.getInt(4);
	Press=rs.getString(5);
	pic=rs.getString(6);
	Intro=rs.getString(7);
	}
	out.print("<div class=\"mid_book\">");
	out.print("<div class=\"book_img\">");
	out.print("<img src="+pic+"></div>");
	out.print("<div class=\"book_infomation\">");
	out.print("<ul type=none>");
	out.print("<li id=\"book_name\">"+name+"</li>");
	out.print("<li id=\"book_author\">"+author+"</li>");
	out.print("<li id=\"book_publisher\">"+Press+"</li></ul>");
	out.print("<ul id=\"book_prices\">¥"+price+"</ul>");
	out.print("<a href=\"MainHandle.jsp?id="+Id+"\">加入购物车</a></div>");
	out.print("<div class=\"clear\"></div></div>");out.print("<div class=\"book_details\">");
	out.print("<ul class=\"book_details_1\">导读</ul>");out.print("<ul class=\"book_details_2\">");
	out.print("<p>"+Intro+"</p>");
	s.close();
	con.close();
	}catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
%>

<!--<p>这不是一本纯粹的旅行画册，它缺少必去景点的介绍、两大购物商场路线、5种放松的娱乐方法或不能错过的TOP 10餐馆。</p>

<p>我想记录和表达的是充盈在清迈古城中的情感。清迈很好玩，在清迈很快乐，但这也是建立在其对旅游产业飞跃发展、牺牲了其他一部分东西的基础上，生成的一种极致情感。</p>

<p>它不好吗？也没有。但是那种情感是臧否两级的。</p>

<p>一个对自己发型永远不满意的人。</p></ul>--></ul>
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