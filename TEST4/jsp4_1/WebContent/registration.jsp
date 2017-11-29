<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create a account</title>

    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/common.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <form method="POST" action="/jsp4_1/registered_servlet" class="form-signin">
        <h3 class="form-heading">请输入您的注册信息</h3>
        <div class="form-group">
            <input name="name" type="text" class="form-control" placeholder="Username"
                   autofocus="true"/>
            <input name="passwd" type="password" class="form-control" placeholder="Password"/>
            <input name="role" type="text" class="form-control" placeholder="role"/>
            <input name="age" type="text" class="form-control" placeholder="age"/>
            <input name="sex" type="text" class="form-control" placeholder="sex"/>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Create</button>
        </div>
    </form>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
</html>