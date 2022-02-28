<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.joinForm{
		width: 400px;
		margin: 0 auto;
		background-color: #eeeeee;
	}
	
	.joinForm > tbody > tr:last-child{
		text-align: center;
	}
</style>
</head>
<body>
<form action="join.me" method="post" name="joinForm">
	<div>
		<div>
			<table class="joinForm">
				<tbody>
					<tr>
						<td>
							<div>ID</div>
							<div><input type="text" name="memId" size="60%" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div>PASSWORD</div>
							<div><input type="password" name="memPw" size="60%" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div>NAME</div>
							<div><input type="text" name="memName" size="60%" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div>AGE</div>
							<div><input type="number" name="memAge" size="60%" required></div>
						</td>
					</tr>
					<tr>
						<td>
							<div>GENDER</div>
							<div>
								<input type="radio" name="gender" value="MALE" checked>남
								<input type="radio" name="gender" value="FEMALE">여
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="btn" onclick="joinForm.submit();">J O I N</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</form>	
</body>
</html>