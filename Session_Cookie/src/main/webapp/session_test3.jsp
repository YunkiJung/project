<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션 영역에 저장된 데이터를 삭제
	//session.removeAttribute("memberInfo");
	//세션에 저장된 모든 데이터를 삭제
	//session.invalidate();	
	


	Member member = (Member)session.getAttribute("memberInfo");
	//세션에 저장된 데이터는 언제까지 살아있을까?
	//웹 브라우저가 꺼지면 삭제됨.
%>
<%=member.getId() %><br>
<%=member.getPassword() %><br>
<%=member.getAge() %><br>
</body>
</html>