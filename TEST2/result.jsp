
<ge language="java" import="java.util.*" pageEncoding="GB18030"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
  <html>  
    <head>  
      </head>           
            <body>  
              <%  
                  String num1=request.getParameter("num1");  
                      String num2 = request.getParameter("num2");  
                         String flag = request.getParameter("flag");  
                            int s_num1=Integer.parseInt(num1);  
                               int s_num2=Integer.parseInt(num2);  
                                  int result=0;  
                                     
                                       if(flag.equals("+")){  
                                         //加  
                                           result=s_num1+s_num2;  
                                             }else if(flag.equals("-")){  
                                               //减  
                                                 result=s_num1-s_num2;  
                                                   }else if(flag.equals("/")){  
                                                     result=s_num1/s_num2;  
                                                      //除  
                                                         }else{  
                                                           //乘  
                                                            result=s_num1*s_num2;  
                                                               }  
                                                                 out.println("the result of your scanfing is"+result);  
                                                                    %>  
                                                                      </body> 
