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
        <h2>Welcome ${username} | <a href="modify.jsp">Modify Self</a> 
        <script type="text/javascript">
			var userrole="<%=session.getAttribute("role")%>";
			if ("admin" == userrole){
				document.write("| <a href="+"view.jsp"+">View User</a>");
				document.write("| <a href="+"Addteacher.jsp"+">Add Teacher</a>");
				document.write("| <a href="+"Addcourse.jsp"+">Add Course</a>");
				document.write("| <a href="+"Addstudent.jsp"+">Add Student</a>");
			}
		</script> 
		<script type="text/javascript">
			var userrole="<%=session.getAttribute("role")%>";
			if ("teacher" == userrole){
				document.write("| <a href="+"view_course.jsp"+">course_info</a>");
				document.write("| <a href="+"mark_grade.jsp"+">mark_grade</a>");
			}
		</script>  
		<script type="text/javascript">
			var userrole="<%=session.getAttribute("role")%>";
			if ("student" == userrole){
				document.write("| <a href="+"choose_course.jsp"+">choose course</a>");
			}
		</script> 
        | <a href="login.jsp">Logout</a>     
        </h2>
</div>
<a id="btn0"></a>
                <a id="sjzl"></a>&nbsp;
                <a  href="#" id="btn1">首页</a>
                <a  href="#" id="btn2">上一页</a>
                <a  href="#" id="btn3">下一页</a>
                <a  href="#" id="btn4">尾页</a>&nbsp;
                <a>转到&nbsp;</a>
                <input id="changePage" type="text" size="1" maxlength="4"/>
                <a>页&nbsp;</a>
                <a  href="#" id="btn5">跳转</a>
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
        out.println("</tr>");
    }
%>
</table>

<script type="text/javascript">
            var pageSize = 15;    //每页显示的记录条数
             var curPage=0;        //当前页
             var lastPage;        //最后页
             var direct=0;        //方向
            var len;            //总行数
            var page;            //总页数
            var begin;
            var end;
            
                
            $(document).ready(function display(){   
                len =$("#mytable tr").length - 1;    // 求这个表的总行数，剔除第一行介绍
                // alert("page==="+page);
                curPage=1;    // 设置当前为第一页
                displayPage(1);//显示第一页
                
                document.getElementById("btn0").innerHTML="当前 " + curPage + "/" + page + " 页    每页 ";    // 显示当前多少页
                document.getElementById("sjzl").innerHTML="数据总量 " + len + "";        // 显示数据量
                document.getElementById("pageSize").value = pageSize;
                
                
                
                $("#btn1").click(function firstPage(){    // 首页
                    curPage=1;
                    direct = 0;
                    displayPage();
                });
                $("#btn2").click(function frontPage(){    // 上一页
                    direct=-1;
                    displayPage();
                });
                $("#btn3").click(function nextPage(){    // 下一页
                    direct=1;
                    displayPage();
                });
                $("#btn4").click(function lastPage(){    // 尾页
                    curPage=page;
                    direct = 0;
                    displayPage();
                });
                $("#btn5").click(function changePage(){    // 转页
                    curPage=document.getElementById("changePage").value * 1;
                    if (!/^[1-9]\d*$/.test(curPage)) {
                        alert("请输入正整数");
                        return ;
                    }
                    if (curPage > page) {
                        alert("超出数据页面");
                        return ;
                    }
                    direct = 0;
                    displayPage();
                });
                
                
                $("#pageSizeSet").click(function setPageSize(){    // 设置每页显示多少条记录
                    pageSize = document.getElementById("pageSize").value;    //每页显示的记录条数
                    if (!/^[1-9]\d*$/.test(pageSize)) {
                        alert("请输入正整数");
                        return ;
                    }
                    len =$("#mytable tr").length - 1;
             
                    curPage=1;        //当前页
                     direct=0;        //方向
                     firstPage();
                });
            });
 
            function displayPage(){
                if(curPage <=1 && direct==-1){
                    direct=0;
                    alert("已经是第一页了");
                    return;
                } else if (curPage >= page && direct==1) {
                    direct=0;
                    alert("已经是最后一页了");
                    return ;
                }
                
                lastPage = curPage;
               
                // 修复当len=1时，curPage计算得0的bug
                if (len > pageSize) {
                    curPage = ((curPage + direct + len) % len);
                } else {
                    curPage = 1;
                }
          
                
                document.getElementById("btn0").innerHTML="当前 " + curPage + "/" + page + " 页    每页 ";        // 显示当前多少页
                
                begin=(curPage-1)*pageSize + 1;// 起始记录号
                end = begin + 1*pageSize - 1;    // 末尾记录号
             
                
                if(end > len ) end=len;
                $("#mytable tr").hide();    // 首先，设置这行为隐藏
                $("#mytable tr").each(function(i){    // 然后，通过条件判断决定本行是否恢复显示
                    if((i>=begin && i<=end) || i==0 )//显示begin<=x<=end的记录
                        $(this).show();
                });

             }
    </script>

<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
