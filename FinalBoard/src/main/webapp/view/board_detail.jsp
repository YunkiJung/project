<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	글번호 : ${boardInfo.boardNum }<br>
	제목 : ${boardInfo.title }<br>
	내용 : ${boardInfo.content }<br>
	작성자 : ${boardInfo.writer }<br>
	작성일 : ${boardInfo.createDate }<br>
	조회수 : ${boardInfo.readCnt }<br>
	비밀글여부 : ${boardInfo.isPrivate }<br>
	비밀번호 : 
	<c:choose>
		<c:when test="${empty boardInfo.boardPw }">
			데이터 없음<br>
		</c:when>
		<c:otherwise>
			${boardInfo.boardPw }<br>
		</c:otherwise>
	</c:choose>
	첨부파일명 : 
	<c:choose>
		<c:when test="${empty boardInfo.attachedName }">
			데이터 없음<br>
		</c:when>
		<c:otherwise>
			${boardInfo.attachedName }<br>
		</c:otherwise>
	</c:choose>
	
	<input type="button" value="목록가기" onclick="location.href='boardList.bo';">
	
	<c:if test="${sessionScope.loginInfo.memId eq boardInfo.writer }">
		<input type="button" value="수정" onclick="location.href='updateBoard.bo';">
	</c:if>
	<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' or sessionScope.loginInfo.memId eq boardInfo.writer }">
		<input type="button" value="삭제" onclick="location.href='deleteBoard.bo';">
	</c:if>
	
</body>
</html>