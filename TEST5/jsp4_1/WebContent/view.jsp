<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<br><br><br><br>
	<form method="POST" action="/jsp4_1/view_servlet" class="form-signin">
	<h4 class="form-heading">Please input a username</h4>
	<div class="form-group">
		<input name="view_name" type="text" class="form-control" placeholder="Username"
		 autofocus="true"/>
		 <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
	</div>
	</form>
</div>
</body>
</html>