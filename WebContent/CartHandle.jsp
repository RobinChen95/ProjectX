<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*,java.util.*,java.text.SimpleDateFormat"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>处理结果</title>
</head>
<body>
<%  
	int EId = Integer.parseInt(request.getSession().getAttribute("sessionid").toString());
	Calendar calendar = Calendar.getInstance();  
	SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy-MM-dd");  
	String time = simpledateformat.format(calendar.getTime());  
	ArrayList<Integer> GoodsId = new ArrayList<Integer>();
	ArrayList<Integer> Quantity = new ArrayList<Integer>();
	int items = Integer.parseInt(request.getParameter("items"));
	boolean[] check = new boolean[items];
	out.print(Arrays.toString(check));
	for(int i=0;i<items;i++){
		Quantity.add(Integer.parseInt(request.getParameter("cargoqtty"+(i+1))));
	}
	for(int i=0;i<items;i++){
		GoodsId.add(Integer.parseInt(request.getParameter("ids"+(i+1))));
	}
	for(int i=0;i<items;i++){
		if(Integer.parseInt(request.getParameter("checked"+(i+1)))==0) check[i]=false;
		else check[i]=true;
	}
	String GID = "0",QTT = "0",RGID = "0",RQTT="0";
	for(int i=0;i<GoodsId.size();i++){
		if(check[i]){
			GID+="#"+GoodsId.get(i);
			QTT+="#"+Quantity.get(i);
		}
		else{
			RGID+="#"+GoodsId.get(i);
			RQTT+="#"+Quantity.get(i);
		}
	}   
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "123456");
		Statement s = con.createStatement();
		String sql = "insert into orderinfo(EId,GoodsId,Quantity,OrderTime) values("+EId+", '"+GID+"', '"+QTT+"', '"+time+"')";
		s.executeUpdate(sql);
		String sql1 = "update userinfo set GoodsId ='"+RGID+"',Quantity = '"+RQTT+"'  where EId ="+EId;
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
	response.sendRedirect("JustOrdered.jsp");
%>
</body>
</html>