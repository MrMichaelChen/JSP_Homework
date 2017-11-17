<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!--文件上传的默认路径为F:file/--->
<form  action="UploadServlet" method="post" enctype="multipart/form-data" >  
please to choose a file <input id="file" name="file" type="file" />  
<input type="submit" value="upload"  />
<br>
You uploaded the file :${result} 
 <br><br>
<!--文件下载使用html自身功能实现，未使用servlet结构--->
<a>IF YOU WANT TO GET "test.doc"<br>
PLEASE TO CLICK</a><a href="test.doc"> DOWNLOAD</a>
</form>  
</body>
</html>