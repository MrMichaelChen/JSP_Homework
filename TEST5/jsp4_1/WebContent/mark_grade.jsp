<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create a account</title>

    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <form method="POST" action="/jsp4_1/markgrade_servlet" class="form-signin">
        <h3 class="form-heading">请输入成绩信息：</h3>
        <div class="form-group">
            <input name="student" type="text" class="form-control" placeholder="student name"
                   autofocus="true"/>
            <input name="grade" type="text" class="form-control" placeholder="grade"/>	
            <button class="btn btn-lg btn-primary btn-block" type="submit">Mark</button>
        </div>
    </form>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
</html>