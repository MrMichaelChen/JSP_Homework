package myservlet.control;

import mybean.data.login_bean;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.apache.jasper.tagplugins.jstl.core.Out;
import java.util.*;

@WebServlet("/view_servlet")
public class view_servlet extends HttpServlet {
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		 login_bean testbean = null;
		 HttpSession session = request.getSession(true);
		 try {
			 testbean = (login_bean)session.getAttribute("testbean");
			 if (testbean==null) {
				 testbean = new login_bean();
				 session.setAttribute("testbean", testbean);
			 }
		 }
		 catch(Exception exp) {
			 testbean = new login_bean();
			 session.setAttribute("testbean", testbean);
		 }
		 try {
			 Class.forName("com.microsoft**.jdbc.sqlserver.**SQLServerDriver"); 
		 }
		 catch(Exception e) {}
		 String DB_Url="jdbc:sqlserver://localhost:1433;DataName=student?useUnicode=true&characterEncoding=UTF-8";
	     String user="sa";//µÇÂ½Êý¾Ý¿â
	     String password="111111";
	     try {
	        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    Connection connection= null;
	    try {
	        connection = DriverManager.getConnection(DB_Url,user,password);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    Statement statement= null;
	    try {
	        statement = connection.createStatement();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    try {
	        statement.executeQuery("SELECT TOP 1000 [Userid]\n" +
	        		",[Username]\n" +
	        		",[Userpasswd]\n" +
	        		",[Userrole]\n" +
	                "  FROM [student].[dbo].[userinfo]");
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    ResultSet resultSet = null;
		try {
			resultSet = statement.getResultSet();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int marknumber=0;
	    try {
	    	 response.setContentType("text/html;charset=UTF-8");
			 request.setCharacterEncoding("UTF-8");
			 String username=request.getParameter("view_name");

			 while (resultSet.next()){
					String id=resultSet.getString("Userid").trim();
					String name=resultSet.getString("Username").trim();
				    String wd=resultSet.getString("Userpasswd").trim();	
				    String role=resultSet.getString("Userrole").trim();	
			    if(name.equals(username)) {
			    	marknumber=1;
			    	session.setAttribute("view_id", id);
			    	session.setAttribute("view_username", name);
			    	session.setAttribute("view_password", wd);
			    	session.setAttribute("view_role", role);
				 }
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 if (marknumber==1) {
			 response.sendRedirect("view_user.jsp");
		 }
		 else {
			 response.sendRedirect("404.jsp");
		 }
	  }
	  
	  private void notify(HttpServletRequest request, HttpServletResponse response, String backNews) {
		response.setContentType("text/html;charset=GB2312");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>"+backNews+"</h2>");
			out.println("back");
			out.println("<a href = login.jsp>back</a> ");
			out.println("<html><body>");
		}catch(IOException exp) {}
	}

}
