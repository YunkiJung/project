<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.joinDiv{
		width: 400px;
		margin: 0 auto;
		background-color: #eeeeee;
		padding: 16px;
		border-radius: 10px;
		padding-bottom: 0px;
	}
	input{
		height: 30px;
		border: 1px solid #006BC4;
		border-radius: 6px;
		outline: none;
		width: 98%;
	}
	input:focus{
		border: 2px solid #002990;
	}
	.joinDiv > div{
		margin-bottom: 20px;
	}
	.joinDiv > div > div:first-child{
		margin-bottom: 6px;
		font-weight: bold;
		font-style: italic;
		border-bottom: 2px solid #cccccc;
		width: 40%;
	}
	.genderDiv > input{
		width: 5%;
	}
	.btn{
		width: 99%;
	}
</style>
</head>
<body>
<form action="join.me" method="post" name="joinForm">
	<div class="joinDiv">
		<div>
			<div>ID</div>
			<div><input type="text" name="memId" size="60%" required></div>
		</div>
		<div>
			<div>PASSWORD</div>
			<div><input type="password" name="memPw" size="60%" required></div>
		</div>
		<div>
			<div>NAME</div>
			<div><input type="text" name="memName" size="60%" required></div>
		</div>
		<div>
			<div>AGE</div>
			<div><input type="number" name="memAge" size="60%" required></div>
		</div>
		<div>
			<div>GENDER</div>
			<div class="genderDiv">
				<input type="radio" name="gender" value="MALE" checked>남
				<input type="radio" name="gender" value="FEMALE">여
			</div>
		</div>
		<div class="btn" onclick="joinForm.submit();">J O I N</div>
	</div>
</form>	
</body>
</html>