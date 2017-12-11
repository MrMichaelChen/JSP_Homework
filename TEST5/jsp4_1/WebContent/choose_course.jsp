<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-hover" action="/jsp4_1/login_servlet">
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
        		",[Coursename]\n" +
        		",[TeacherID]\n" +
                "  FROM [student].[dbo].[course]");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    ResultSet resultSet=statement.getResultSet();
    while (resultSet.next()){
    	String userid=resultSet.getString("Coursenumber");
        String username=resultSet.getString("Coursename");
        String teacherID=resultSet.getString("TeacherID");
        out.println("<tr>");
        out.println("<tr><td class='active'>"+userid+"</td>");
        out.println("<td class='active'>"+username+"</td>");
        out.println("<td class='active'>"+teacherID+"</td>");
        out.println("<td class='info'><a href="+"to_chooose.jsp"+">modify</a></td>");
        out.println("</tr>");
    }
%>
</table>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>