<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>to login</title>
    <h4>this is to login</h4>
  </head>
  
  <body  bgcolor="0099FF"><font size="3">
	<div style="border:1px solid #000;align:center">
  	<form name="form" action="login_welcome.jsp" method="post">
  		name  <input type="text" name="name" /><br><br>
  	    password<input type="password" name="pass"/><br><br>
  		         <input type="submit" name="submit" value="submit" />
  	 	         <input type="reset" value="reset" /><br>
  	</form>
	</div>
 	</font>
  <%!  Vector v=new Vector();
	  int i=0;
	  ServletContext application;
	  synchronized void leaveWord(String s){
		  application=getServletContext();
		  i++;
		  v.add("No."+i+","+s);
		  application.setAttribute("Mess",v);
	  }
  %>
  <%
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	if(name==null)
		name="guest"+(int)(Math.random()*10000);
	if(password==null)
		password="111";
	String s=name+"&"+"password"+password;
	leaveWord(s);
	out.print("this message is hand over");
 %>
<a href="show.jsp">Enter the show.jsp
 </body>
</html>



