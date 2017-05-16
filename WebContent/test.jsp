<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
		out.println("123");
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
</body>
</html>