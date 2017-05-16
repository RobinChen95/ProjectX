package servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowMain
 */
@WebServlet("/ShowMain")
public class ShowMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pic = null;
		String author = null;
		String name = null;
		String aa = null;
		String bb = null;
		int price=0;
		PrintWriter out = response.getWriter();
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
				out.println("<li class=\"douch-bot-cargo\">");
				out.println("<a href=\"Test.jsp?aa="+rs.getString(1)+"\"><img src=\""+pic+"\" /></a>");
				out.println("<span>");
				out.println("<h1><a href=\"Index.jsp\">"+name+"</a></h1>");
				out.println("<h2>"+author+"</h2>");
				out.println("<h3>¥"+price+"<a href=\"Index.jsp\">加入购物车</a><a href=\"index.html\">立即购买</a></h3>");
				out.println("</span>");
				out.println("</li>");
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
	}

}
