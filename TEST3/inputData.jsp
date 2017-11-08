<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="data" class="mybean.data.Area" scope="session"/>
<html><body bgcolor=cyan><Font size=2>
<form action="handle" Method="get">
<br>
up:<Input type = text name = "a" size = 4>
down:<Input type = text name = "b" size = 4>
high:<Input type = text name = "c" size = 4>
<input type=submit value="submit">
</form>

<jsp:getProperty name = "data" property = "mess"/>
up<jsp:getProperty name = "data" property = "a"/>
down<jsp:getProperty name = "data" property = "b"/>
high<jsp:getProperty name = "data" property = "c"/>
area<jsp:getProperty name = "data" property="area"/>
</Font>>
</body>
</html>
