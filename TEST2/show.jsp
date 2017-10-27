<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.*" %>
<html>
 <%! public String handleStr(String s){
		try {byte[] bb=s.getBytes("iso-8859-1");
				s=new String(bb);
		}
		catch(Exception exp){}
		return s;
	}
 %>
 <br><br><br>
 <div style="border:1px solid #000;align:center">
 <% Vector v=(Vector)application.getAttribute("Mess");
	for(int i=0;i<v.size();i++){
		String message=(String)v.elementAt(i);
		String []a = message.split("#");
		out.print("your name is s"+handleStr(a[0])+",");
 }
 %>
 </div>
</html>
