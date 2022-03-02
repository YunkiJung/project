<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.memberDiv{
		text-align: right;
	}
	.titleDiv{
		text-align: center;
	}
	h1{
		font-size: 36px;
	}
</style>
</head>
<body>
	<div class="memberDiv">
		<c:choose>
			<c:when test="${not empty sessionScope.loginInfo }">
				${sessionScope.loginInfo.memName }님 반갑습니다.
				<a href="logout.me">LOGOUT</a>
			</c:when>
			<c:otherwise>
				<a href="loginForm.me">Login</a>
				<a href="joinForm.me">Join</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="titleDiv">
		<h1>B O A R D</h1>
	</div>
</body>
</html>