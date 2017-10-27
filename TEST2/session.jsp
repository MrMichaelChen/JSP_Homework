<%@ page contentType="text/html;charset=gb2312" %>
<%! int count=0; %>
<html>
  <head>    
    <title>My JSP starting page</title>
  </head>
  <div style="border:1px solid #000">
  <body>
  <%
  		session.setMaxInactiveInterval(6);
  		boolean just=session.isNew();
  		if(just)
  		 count++;
  	String id=session.getId();
  
   %>
   <div style="border:1px inset #000">
   <p> &nbsp;&nbsp&nbsp;  you having done times is<%=count %></p>
   <p> &nbsp;&nbsp;&nbsp;  your session id is <%=id %></p>
  </body>
</div>
</html>
