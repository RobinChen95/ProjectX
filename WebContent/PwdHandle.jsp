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
    boolean bl = false;
    String opwd = null;
    String oname = null;
	String pwd = request.getParameter("pwd");
	String npwd = request.getParameter("npwd");
	String name = request.getSession().getAttribute("sessionname").toString();
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	String sql = "select * from userinfo";
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
		oname=rs.getString(2);
		opwd=rs.getString(3);
	if(opwd.equals(pwd)&&oname.equals(name)){
		bl=true;	
	}
	}
	if(bl){
		String sql1 ="update userinfo set PassWord ='"+npwd+"' where UserName ='"+name+"'";
		s.executeUpdate(sql1);
		response.sendRedirect("Success.html");
	}
	else{
		response.sendRedirect("AlterFailed.html");
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
</body>
</html>