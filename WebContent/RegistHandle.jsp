<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type-" content="text/html; charset=UTF-8">
<title>结果</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	String sql = "select * from userinfo";
	ResultSet rs = s.executeQuery(sql);
	String name = request.getParameter("userName");
	String nameExisted;
	boolean flag = true;
	while(rs.next()){
		nameExisted = rs.getString(2);
		if( nameExisted.equals(name)){
			flag = false;
			break;
		}
	}
	if(flag){
		sql = "insert into userinfo(UserName,PassWord) values('"+request.getParameter("userName")+"', '"+request.getParameter("passWord")+"')";
		s.executeUpdate(sql);
	}
	s.close();
	con.close();
    if(flag){response.sendRedirect("Success.html");}
    else response.sendRedirect("RegistFailed.html");
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