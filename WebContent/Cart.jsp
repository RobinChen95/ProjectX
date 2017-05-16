<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*,java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%! 
	String name = null,GID=null,QTT=null,address=null;int id =-1,price=0;
	String Gname = null,author = null,pic=null,Catalog=null;
	ArrayList<Integer> GoodsId = new ArrayList<Integer>();
	ArrayList<Integer> Quantity = new ArrayList<Integer>();
%>
<%
  try {
	  GoodsId = new ArrayList<Integer>();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
		Statement s = con.createStatement();
		name =request.getSession().getAttribute("sessionname").toString();
		String sql = "select * from userinfo where UserName ='"+name+"'";
		ResultSet rs = s.executeQuery(sql);
		while(rs.next()){
			GID=rs.getString(7);
			address = rs.getString(6);
		}
		String[] SGID = GID.split("\\#");
		for(int j = 0;j<SGID.length;j++){
			GoodsId.add(Integer.parseInt(SGID[j]));
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
%>
	<head>
		<title>潇湘书院-购物车</title>
		<link href="css/layout.css" rel="stylesheet" type="text/css" />
		<script>

		var cargo = <%= GoodsId.size() %> - 1 ;
		var addresses = <% if(address==null){out.print("0");}else{out.print("1");} %>
		window.onload = function (){
			for (var i = 1; i <= cargo; i++){
				calSubtotal(i);
			}
		}

		function cargoAdd(var1)
		{
			var cargonumber=document.getElementById("cargoqtty"+var1);
			cargonumber.value = parseInt(cargonumber.value)+1;
			cargoCheck(var1);
		}

		function cargoMinus(var1)
		{
			var cargonumber=document.getElementById("cargoqtty"+var1);
			cargonumber.value = parseInt(cargonumber.value)-1;
			cargoCheck(var1);
		}

		function cargoCheck(var1)
		{
			var cargonumber=document.getElementById("cargoqtty"+var1);
			var val = parseInt(cargonumber.value);
			if(isNaN(val)){
				alert("请输入数字");
				val = 1;
			}
			if (val <= 0) {
				val = 1;
			}
			if (val >= 99) {
				val = 99;
			}
			if (cargonumber.value != val) {
				cargonumber.value = val;
			}
			calSubtotal(var1);
			calTotal(); 
		}

		function calSubtotal(var1){
			var cargoPrice = document.getElementById("price"+var1);
			var cargoprice = parseInt(cargoPrice.innerText);
			var cargoNumber = document.getElementById("cargoqtty"+var1);
			var cargonumber = parseInt(cargoNumber.value);
			var cargoSubtotal = document.getElementById("subTotal"+var1);
			cargoSubtotal.innerText = cargoprice * cargonumber;
		}

		function calTotal(){
			var cargoTotal = document.getElementById("total");
			var total = 0;
			for (var i = 1; i <= cargo; i++){
				var cargoCheck = document.getElementById("cargocheck"+i);
				if(cargoCheck.checked){
					var subtotal = document.getElementById("subTotal"+i);
					total = total + parseInt(subtotal.innerText);
					
				}
			}
			cargoTotal.innerText = total;
		}

		function checkAll(){
			var cargoCheckAll = document.getElementById("cargocheckall");
			if(cargoCheckAll.checked){
				for (var i = 1; i <= cargo; i++){
					var cargoCheck = document.getElementById("cargocheck"+i);
					cargoCheck.checked = true;
					var cargoChecked = document.getElementById("cargochecked"+i);
					cargoChecked.value = 1;
				}
			}else{
				for (var i = 1; i <= cargo; i++){
					var cargoCheck = document.getElementById("cargocheck"+i);
					cargoCheck.checked = false;
					var cargoChecked = document.getElementById("cargochecked"+i);
					cargoChecked.value = 0;
				}
			}
			calTotal();
			checkSubmit();
		}

		function checkAllCheck(var1){
			var cargoCheck = document.getElementById("cargocheck"+var1);
			var cargoCheckAll = document.getElementById("cargocheckall");
			var cargoChecked = document.getElementById("cargochecked"+var1);
			if(!cargoCheck.checked){
				cargoChecked.value = 0;
				cargoCheckAll.checked = false;
			}else{
				cargoChecked.value = 1;
				var flag = 1;
				for (var i = 1; i <= cargo; i++){
					var cargoCheck = document.getElementById("cargocheck"+i);
					if(!cargoCheck.checked){
						flag = 0;
					}
				}
				if(flag==1){
					cargoCheckAll.checked = true;
				}
			}
			calTotal();
			checkSubmit();
		}

		function checkSubmit(){
			var cartSbmt = document.getElementById("cartSbmt");
			var cargoTotal = document.getElementById("total");
			if(parseInt(cargoTotal.innerText)==0){
				cartSbmt.disabled = "disabled";
			}else{
				if(parseInt(addresses)==1)
					cartSbmt.disabled = "";
			}
			
		}


		</script>
	</head>

	<body>
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
		<div class="cart">
			<div class="cart-header">
				<div class="wid-lim">
					<div id="logo">
						<a id="logo" href="Index.jsp">
							<img id="logo" src="img/logo.png" />
						</a>
					</div>
					<h1>购物车</h1>
				</div>
			</div>
			<hr />
			<div class="cart-top">
				<div class="wid-lim">
					<div class="cart-cargo-choose">
						<input type="checkbox" id="cargocheckall" name="cargocheckall" onclick="checkAll()" />
					</div>
					<h2>全部商品</h2>
					<span>
						<p>配送至:
						<%
						 if(address==null){out.print("<span id=\"address\" style = \"color:#ff0000\">请先完善信息再购买！</span>");}
						 else out.print("<span id=\"address\">"+address+"</span>");
						%>
						</p>
					</span>
					<div class="clear"></div>
				</div>
			</div>
			<hr />
			<div class="cart-title">
				<div class="wid-lim">
					<div class="cart-cargo-img" id="cart-title-img">商品</div>
					<div class="cart-title-price">单价</div>
					<div class="cart-title-quantity">数量</div>
					<div class="cart-title-partTotal">总价</div>
					<div class="clear"></div>
				</div>
			</div>
			<hr />
			<div class="cart-cont">
				<div class="wid-lim">
				<form action="CartHandle.jsp" method = "post">
					<table id="cartTable">
						
<%
 
 //if(request.getParameter("id")!=null)
  //id = Integer.parseInt(request.getParameter("id"));
  try {
	GoodsId = new ArrayList<Integer>();
 	Quantity = new ArrayList<Integer>();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	name =request.getSession().getAttribute("sessionname").toString();
	String sql = "select * from userinfo where UserName ='"+name+"'";
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
		GID=rs.getString(7);
		QTT=rs.getString(8);
	}
	String[] SGID = GID.split("\\#");
	String[] SQTT = QTT.split("\\#");
	for(int j = 0;j<SGID.length;j++){
		if(SGID[j].equals("0")){}
		else
		GoodsId.add(Integer.parseInt(SGID[j]));
	}
	for(int j = 0;j<SQTT.length;j++){
		if(SQTT[j].equals("0")){}
		else
		Quantity.add(Integer.parseInt(SQTT[j]));
	}
    for(int i=0;i<GoodsId.size();i++){
    	String sql1 = "select * from goodsinfo where GoodsId ="+GoodsId.get(i);
    	ResultSet rs1 = s.executeQuery(sql1);
    	while(rs1.next()){
    		Gname=rs1.getString(2);
    		author=rs1.getString(3);
    		price=rs1.getInt(4);
    		pic=rs1.getString(6);
    		Catalog=rs1.getString(5);
    		out.print("<tr id=\"cargo"+(i+1)+"\">");
    		out.print("<div class=\"cart-cargo\">");
    		out.print("<div class=\"cart-cargo-choose\">");
    		out.print("<input type=\"checkbox\" id=\"cargocheck"+(i+1)+"\" name=\"cargo"+(i+1)+"\" onclick=\"checkAllCheck("+(i+1)+")\" value=\""+GoodsId.get(i)+"\"/>");
    		out.print("<input type=\"hidden\" class=\"cart-hidden\" id=\"cargoid"+(i+1)+"\" name=\"ids"+(i+1)+"\" value=\""+GoodsId.get(i)+"\"/>");
    		out.print("<input type=\"hidden\" class=\"cart-hidden\" id=\"cargochecked"+(i+1)+"\" name=\"checked"+(i+1)+"\" value=\"0\"/>");
    		out.print("</div>");
    		out.print("<div class=\"cart-cargo-img\">");
    		out.print("<a href=\"Index.jsp\"><img src=\""+pic+"\" /></a>");
    		out.print("</div>");
    		out.print("<div class=\"cart-cargo-info\">");
    		out.print("<span><h1><a>"+Gname+"</a></h1>");
    		out.print("<h2>"+author+"</h2>");
    		out.print("<h2>"+Catalog+"</h2></span></div>");
    		out.print("<div class=\"cart-cargo-price\">");
    		out.print("<h3>¥<span id=\"price"+(i+1)+"\">"+price+"</span></h3></div>");
    		out.print("<div class=\"cart-cargo-quantity\"><span>");
    		out.print("<input class=\"cart-cargo-quantity-alter\" type=\"button\" value=\"--\" onclick=\"cargoMinus("+(i+1)+")\" />");
    		out.print("<input class=\"cart-cargo-quantity-number\" type=\"text\" name = \"cargoqtty"+(i+1)+"\" id=\"cargoqtty"+(i+1)+"\" value=\""+Quantity.get(i)+"\" onblur=\"cargoCheck("+(i+1)+")\" />");
    		out.print("<input class=\"cart-cargo-quantity-alter\" type=\"button\" value=\"+\" onclick=\"cargoAdd("+(i+1)+")\" /></span></div>");
    		out.print("<div class=\"cart-cargo-partTotal\">");
    		out.print("<h3>¥<span id=\"subTotal"+(i+1)+"\">"+(price*Quantity.get(i))+"</span></h3></div>");
    		out.print("<div class=\"cart-cargo-delete\">");
    		out.print("<a href=\"Delete.jsp?gid="+GoodsId.get(i)+"\">删除</a></div>");
    		out.print("<div class=\"clear\"></div>");
    		out.print("</div>");
    		out.print("</tr>");
    		
    	}
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
  out.print("<input id=\"items\" type = \"hidden\" name = \"items\" value=\""+GoodsId.size()+"\" />");
  out.print("");
  GoodsId = new ArrayList<Integer>();
%>
					</table>		
					
					<div class="cart-bot">
						<span>总价：¥<h2 id="total">0</h2></span>
						<input id="cartSbmt" type="submit" value="结算" name="cartSbmt" disabled="disabled" />
					</div>
					</form>
					<div class="clear"></div>
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
		</div>
	</body>
</html>
