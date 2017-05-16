<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*,java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理结果</title>
</head>
<body>
<%
String name = null,GID=null,QTT=null;
ArrayList<Integer> GoodsId = new ArrayList<Integer>();
ArrayList<Integer> Quantity = new ArrayList<Integer>();
if(request.getSession().getAttribute("sessionname")==null){
	response.sendRedirect("Login.jsp");
}
else{
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
	Statement s = con.createStatement();
	name =request.getSession().getAttribute("sessionname").toString();
	String sql = "select * from userinfo where UserName ='"+name+"'";
	int id = Integer.parseInt(request.getParameter("id"));
	boolean alreadyIn = false;
	ResultSet rs = s.executeQuery(sql);
	while(rs.next()){
		GID=rs.getString(7);
		QTT=rs.getString(8);
	}
	String[] SGID = GID.split("\\#");
	String[] SQTT = QTT.split("\\#");
	for(int j = 0;j<SGID.length;j++){
		GoodsId.add(Integer.parseInt(SGID[j]));
	}
	for(int j = 0;j<SQTT.length;j++){
		Quantity.add(Integer.parseInt(SQTT[j]));
	}
	for(int i=0;i<GoodsId.size();i++){
		if(id==GoodsId.get(i)){	
			alreadyIn=true;
		}
	}
	if(!alreadyIn){
		GID+="#"+id;
		QTT+="#"+1;
	}
	String sql1 = "update userinfo set GoodsId ='"+GID+"' ,Quantity = '"+QTT+"' where UserName ='"+name+"'";
	s.executeUpdate(sql1);
	s.close();
	con.close();
	}catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
    response.sendRedirect("Success.html");
}
%>
</body>
</html>