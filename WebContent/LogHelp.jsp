<%@ page language="java" contentType="text/html; charset=UTF-8" import ="java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆结果</title>
</head>
<body>
<%
  boolean bl = false;
  String name;
  String pwd=null;
  int EId = 0;
  try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	String sql = "select * from userinfo";
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
		name=rs.getString(2);
		pwd=rs.getString(3);
	if(pwd.equals(request.getParameter("passWord"))&&name.equals(request.getParameter("userName"))){
		bl=true;
		EId = rs.getInt(1);
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
	if(bl)
	{
	request.getSession().setAttribute("sessionname",request.getParameter("userName"));     
	request.getSession().setAttribute("sessionpwd",request.getParameter("passWord"));
	request.getSession().setAttribute("sessionid",EId);
	response.sendRedirect("Success.html");
	}
	else{
	response.sendRedirect("LoginFailed.html");
	}
%>
</body>
</html>
