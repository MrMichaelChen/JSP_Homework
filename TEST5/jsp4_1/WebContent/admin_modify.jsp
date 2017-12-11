<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <form method="POST" action="/jsp4_1/admin_modify_servlet" class="form-signin">
        <h4 class="form-heading">请输入对于${view_username}的修改信息:</h4>
        <div class="form-group">
            <input name="name" type="text" class="form-control" placeholder=${view_username}
                   autofocus="true"/>
            <input name="passwd" type="password" class="form-control" placeholder="Password"/>
            <input name="age" type="text" class="form-control" placeholder="age"/>
            sex &nbsp<input type="radio" name="sex" value="male" checked>Male
			<input type="radio" name="sex" value="female">Female
			<br>
			role &nbsp<input type="radio" name="role" value="Teacher" checked>Teacher
			<input type="radio" name="role" value="Student">Student		
            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit Modify</button>
        </div>
    </form>
</div>
</body>
</html>