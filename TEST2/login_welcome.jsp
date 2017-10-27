<%@ page contentType="text/html;charset=gb2312" %>
<%! public String handleStr(String s) {
       try {  byte [] bb= s.getBytes("iso-8859-1");
              s = new String(bb);
       }
       catch(Exception exp){}
       return s;
    }
%>

<html>
  <head> <h4 align="center"/>welcome to login</h4><hr/></head>
  
  <body bgcolor="0099FF"><font size="4">
  <%
  	String name=request.getParameter("name");
  	String pass=request.getParameter("pass");
  	if(name==null||name.length()==0){%>
  	 	<script type="text/javascript" language="javascript">
		    alert("ERROR,Please Do It Again!"); 
		    window.location="login.jsp"
		    </script> 
  	 	
			<% response.sendRedirect("login.jsp");		  
  	}
  	
  	else if(pass==null||pass.length()==0){%>
  		<script type="text/javascript" language="javascript">
		    alert("ERROR,Please Do It Again!"); 
		    window.location="login.jsp"
		    </script> 
  		 <% response.sendRedirect("login.jsp");
  	}else{
   %>
   <span>Your name is<%= handleStr(name) %></span><br>
   <span>Your password is<%= handleStr(pass) %></span>
   <%} %>
  </font>
  </body>
</html>
