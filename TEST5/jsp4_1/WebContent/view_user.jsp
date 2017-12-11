<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
</head>
<body>
<h3 class="form-heading">USER INFO</h3>
<table class="table table-hover">
<tr>
  <td class="active">UserID</td>
  <td class="success">UserName</td>
  <td class="warning">UserPassword</td>
  <td class="danger">UserRole</td>
  <td class="info">To Do</td>
</tr>
<tr>
  <td class="active">${view_id}</td>
  <td class="success">${view_username}</td>
  <td class="warning">${view_password}</td>
  <td class="danger">${view_role}</td>
  <td class="info"><a href="admin_modify.jsp">modify</a></td>
</tr>
</table>
</body>
</html>