<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet">
</head>
<body>
<form action="login.me" method="post" name="loginForm">
	<div class="loginDiv">
		<div>
			<div>ID</div>
			<div><input type="text" name="memId" required></div>
		</div>
		<div>
			<div>PASSWORD</div>
			<div><input type="password" name="memPw" required></div>
		</div>
		<div class="btn" onclick="loginForm.submit();">LOGIN</div>
	</div>
</form>	
</body>
</html>