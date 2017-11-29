<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Create an account</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div>
        <h2>Welcome ${username} | <a href="modify.jsp">Modify</a> 
        | <a href="view.jsp">View User</a>
        | <a href="login.jsp">Logout</a>
        </h2>
</div>
<script type="text/javascript">
var userrole=session.getAttribute("role");
if ("admin" in userrole){
	document.write("<a href="+"view.jsp"+">view</>");
}
</script>
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
        statement.executeQuery("SELECT TOP 1000 [Userid]\n" +
        		",[Username]\n" +
                "  FROM [student].[dbo].[userinfo]");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    ResultSet resultSet=statement.getResultSet();
    while (resultSet.next()){
    	String userid=resultSet.getString("Userid");
        String username=resultSet.getString("Username");
        out.println("<tr>");
        out.println("<tr><td class='active'>"+userid+"</td>");
        out.println("<td class='active'>"+username+"</td>");
        out.println("<br>");
        out.println("</tr>");
    }
%>
</table>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
