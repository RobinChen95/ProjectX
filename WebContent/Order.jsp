<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*,java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>订单信息</title>
		<link href="css/layout.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
		   
			 
		
			.dingdan-head{
	         width:1280px;
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
            width: 1280px;
            height: 90px;
            border-bottom:1px solid #000000;
            position: relative;
            }
            #pic{
            float: left;
            }
           .dingdan-mid img{
           	margin-left: 20px;
           	margin-top: 22px;
            float: left;
            }
            .dingdan-mid-mid{
            padding:35px 430px 13px 500px;
            font-family: Arial;
            font-size: 30px;
            color: #000000;
            }
            .dingdan-mid-last{
            top:50px;
            left:1044px;
            position:absolute;
            font-family: Arial;
            font-size: 16px;
            color: #000000;
            }
            .dingdan-next{
            width:1280px;
            height: 90px;
            border-bottom:1px solid #999999;
            }
            #dingdan-mulu{
            margin-left: 50px;
            padding-top: 35px;
            }
            .dingdan-next a:hover{color: orangered;}
            .dingdan-next a{
            text-decoration:none;
            font-family: Arial;
            font-size: 20px;
            color: #000000;
           
            padding: 10px 80px 10px 65px;
            border-right: 1px solid #cccccc;
            }
           .dingdan-search{
           	width: 1280px;
           	height: 95px;
           
           }
			
			.search {
			   padding: 0px;
			   width: 268px;
			   padding-left: 102px;
			   padding-top: 33px;
			  border: none;
			    
			}
			 
			.search input.box {
			    height: 34px;
			    border: none;
			    width:156px;
			    padding-right: 0px;
			    border: 1px solid #666666;
			    border-right: none;
			}
			
			.search button.btn {
			    float: right;
			    width: 110px;
			    height:38px;
			    border:1px solid #666666;
			   background: #ccccccc;
			}
			.dingdan-last{
			width: 1280px;
           	height: 50px;
           	 border:1px solid #CCCCCC ;
            border-left: none;
            border-right: none;
			}
			#shangpin{
				margin-left: 35px;
				padding-right: 350px;
			}
			
			
			
			.dingdan-last li{
			list-style: none;
			padding-left: 120px;
			margin-top:15px;
			float: left;
			}
			.dingdan-list{
			margin-top: 42px;
			margin-left:auto;
			border: 0px solid #797979;
			border-bottom: none;
			height:auto;
			width: 1280px;
			}
			.time-number{
			height: 38px;
			border-bottom: 1px solid #797979;
			}
			.time-number li{
			list-style: none;
			padding-right: 10px;
			padding-left: 20px;
			margin-top:10px;
	        float: left;
			}
			
			
			
			.list-last{
			height: 170px;
			width: 1280px;
			border-bottom: 1px solid #797979;
			}
			.list-last ul{
			float: left;
			list-style: none;
			padding: 0px;
			}
			.list-pic{
			margin-left:62px;
           	margin-top: 30px;
           
			}
			.list-pic img{
			
            height: 110px;
            width: 103px;
			}
			.book{
			text-align: center;
		    height:auto;
		    width:200px;
		    margin-top: 35px;
		    margin-left: 100px;
		    margin-right:135px;
			}
			.book p{
			margin-top:0px;
			}
			.book a:hover{color: orangered;}
			.book a{
			text-decoration:none;
			 font-family: Arial;
            font-size: 14px;
            color: #000000;
			}
			
			#px li{
			list-style: none;
			float: left;
			margin-top: 40px;
			padding: 45px 60px 45px 60px;
			border-left: 1px solid #000000;
			text-align: center;
			}
			.o{
			width:50px;
			text-align: center;
			}
			
			</style>
			
	</head>
	
		<%! 
			int ID = 0;
			String name = null;
		%>
		<% name =request.getSession().getAttribute("sessionname").toString(); %>
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
		<div class="wid-lim">
		<div class="dingdan-mid">
			<a href = "Index.jsp"><img src="img/logo.png" /></a>
			<div class="dingdan-mid-mid">订单信息</div>
			<div class="dingdan-mid-last">尊敬的<%= name %>，您好</div>
		</div>
		<div class="dingdan-search">
			<form method="get" id="searchform" action="">
                <fieldset class="search">
                   <input type="text" class="box" name="s" id="s" class="inputText" placeholder="" x-webkit-speech>
                    <button class="btn" title="SEARCH">订单搜索</button>
                </fieldset>
            </form>
		</div>
		<div class="dingdan-last">
			<li id="shangpin">商品</li>
			<li>单价</li>
			<li>数量</li>
			<li>实付款</li>
			<li>交易状态</li>
		</div>
<%
  try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	ID = Integer.parseInt(request.getSession().getAttribute("sessionid").toString());
	String sql1 = "select * from orderinfo where EId ="+ID;
	ResultSet rs1 = s.executeQuery(sql1);
	ArrayList<Integer> OrderId = new ArrayList<Integer>();
	while(rs1.next()){
		OrderId.add(rs1.getInt(1));
	}
	if(OrderId.size()==0){
		out.print("<div class=\"dingdan-list\">");
		out.print("无订单历史记录！");
		out.print("</div>");
	}
	for(int i=OrderId.size()-1;i>=0;i--){
		String GID=null,QTT=null,time=null;int total=0,id=0;
		ArrayList<Integer> GoodsId = new ArrayList<Integer>();
		ArrayList<Integer> Quantity = new ArrayList<Integer>();
		String sql2 = "select * from orderinfo where OrderId ="+OrderId.get(i);
		ResultSet rs2 = s.executeQuery(sql2);
		while(rs2.next()){
			GID=rs2.getString(3);
			QTT=rs2.getString(4);
			time=rs2.getString(5);
			id=rs2.getInt(1);
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
		String sql3 = "select * from goodsinfo";
		ResultSet rs3 = s.executeQuery(sql3);
		out.print("<div class=\"dingdan-list\">");
		out.print("<div class=\"time-number\">");
		out.print("<li>下单时间:"+time+"</li>");
		out.print("<li>订单编号:"+id+"</li>");
		out.print("</div>");
		while(rs3.next()){
			for(int m=0;m<GoodsId.size();m++){
				if(rs3.getInt(1)==GoodsId.get(m)){
					out.print("<div class=\"list-last\">");
					out.print("<ul class=\"list-pic\" id=\"paixu\"><img src=\""+rs3.getString(6)+"\" /></ul>");
					out.print("<ul class=\"book\" id=\"paixu\">");
					out.print("<p><a>书名:"+rs3.getString(2)+"</a></p>");
					out.print("<p><a>作者:"+rs3.getString(3)+"</a></p>");
					out.print("<p><a>出版社:"+rs3.getString(5)+"</a></p>");
					out.print("</ul>");
					out.print("<div id=\"px\">");
					out.print("<li class=\"ooo\">￥"+rs3.getInt(4)+"</li>");
					out.print("<li class=\"ooo\">"+Quantity.get(m)+"</li>");
					out.print("<li class=\"ooo\">￥"+(Quantity.get(m)*rs3.getInt(4))+"</li>");
					out.print("<li class=\"ooo\">已完成</li>");
					out.print("</div></div>");
					total+=Quantity.get(m)*rs3.getInt(4);
				}
			}
		}
		out.print("<span style = \"margin-left:950px\">订单总价:￥"+total+"</span></div>");
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
