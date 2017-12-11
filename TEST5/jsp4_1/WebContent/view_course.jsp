<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>${username}老师您好! 您的班级所有学生信息如下：</h2>
<table class="table table-hover">
<%
    String DB_Url="jdbc:sqlserver://localhost:1433;DataName=student";
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
        statement.executeQuery("SELECT TOP 1000 [Coursenumber]\n" +
        		",[TeacherID]\n" +
        		",[Coursename]\n" +
                "  FROM [student].[dbo].[course]");
    } catch (SQLException e) {
        e.printStackTrace();
    }
   
    String courseid=null;
    
    String user_id=(String) session.getAttribute("userid");
    ResultSet resultSet=statement.getResultSet();
    while (resultSet.next()){
    	String TeacherID=resultSet.getString("TeacherID").trim();
        String course_id=resultSet.getString("Coursenumber").trim();
        if(TeacherID.equals(user_id)){
    		courseid=course_id;
    	}
    }//获取教师ID
   
    try {
        statement.executeQuery("SELECT TOP 1000 [Studentnumber]\n" +
        		",[choose_courseid]\n" +
        		",[course_grade]\n" +
                "  FROM [student].[dbo].[choose_course]");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    ResultSet resultSet1=statement.getResultSet();
    
    while (resultSet1.next()){
    	String choose_courseid=resultSet1.getString("choose_courseid").trim();
    	if(choose_courseid.equals(courseid)){
    		String studentid=resultSet1.getString("Studentnumber").trim();
	        String studnetname=resultSet1.getString("choose_courseid").trim();
	        String grade=resultSet1.getString("course_grade").trim();
	        out.println("<tr>");
	        out.println("<tr><td class='active'>"+studentid+"</td>");
	        out.println("<td class='active'>"+studnetname+"</td>");
	        out.println("<td class='active'>"+grade+"</td>");
	        out.println("</tr>");
    	}
    }
%>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>