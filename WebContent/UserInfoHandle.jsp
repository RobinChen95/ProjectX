<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理结果</title>
</head>
<body>
<%			
    request.setCharacterEncoding("UTF-8");
	String tel = request.getParameter("telphone");
	String Email = request.getParameter("email");
	String address = request.getParameter("address")+request.getParameter("detail");
	String name = request.getSession().getAttribute("sessionname").toString();
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	String sql = "update userinfo set Tel ='"+tel+"' ,Email = '"+Email+"' ,Address = '"+address+"' where UserName ='"+name+"'";
	s.executeUpdate(sql);
	s.close();
	con.close();
	response.sendRedirect("Success.html");
	}catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
%> 
</body>
</html>