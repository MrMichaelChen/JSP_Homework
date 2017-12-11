package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.login_bean;

/**
 * Servlet implementation class addcourse_servlet
 */
@WebServlet("/addcourse_servlet")
public class addcourse_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addcourse_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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
	     String user="sa";//登陆数据库
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
	        statement.executeQuery("SELECT TOP (1000) [Coursenumber]\n" +
	        		",[Coursename]\n" +
	        		",[TeacherID]\n" +
	                "  FROM [student].[dbo].[course]");
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    ResultSet resultSet = null;
		try {
			resultSet = statement.getResultSet();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int userid=0; 
		try {
			while (resultSet.next()){
					    String id=resultSet.getString("Coursenumber").trim();
					    int buffer_id = Integer.parseInt(id);
					    if(userid<buffer_id) {
							 userid=buffer_id;
						 }
					}
		} catch (SQLException e1) {
				e1.printStackTrace();
		}
		
		
	    try {
	        statement.executeQuery("SELECT TOP (1000) [Userid]\n" +
	        		",[Username]\n" +
	        		",[Userpasswd]\n" +
	        		",[Userrole]\n" +
	                "  FROM [student].[dbo].[userinfo]");
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    String teacherid=null;
	    String teacher_name=request.getParameter("teachername");
	    ResultSet resultSet1 = null;
		try {
			resultSet1 = statement.getResultSet();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String TeacherID = null;
		String teachername = null;
		try {
			while (resultSet1.next()){
				
				try {
					TeacherID = resultSet1.getString("Userid").trim();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					teachername = resultSet1.getString("Username").trim();
				    if(teachername.equals(teacher_name)){
						teacherid=TeacherID;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}//获取教师ID
		
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String course=request.getParameter("coursename");
		userid=userid+1;
		String usernumber=String.valueOf(userid);
		try {
		       statement.executeQuery("insert into [student].[dbo].[course] values ('"+usernumber+"', '"+course+"', '"+teacherid+"')");
		       
		} catch (SQLException e) {
		       e.printStackTrace();
		}
		response.sendRedirect("Add_success.jsp");
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
