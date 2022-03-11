<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="regBoard.bo" method="post" id="boardWriteForm">
	제목 : <input type="text" name="title" required><br>
	내용 : <input type="text" name="content"><br>
	작성자 : <input type="text" name="writer" value="${sessionScope.loginInfo.memId }" readonly><br>
	비밀글 <input id="chk" name="isPrivate" type="checkbox" onclick="setPassword();" value="Y"><br>
	<div id="pwDiv"></div>
	<input type="submit" value="등록" id="last">
</form>
<script type="text/javascript" src="javascript/board_write.js"></script>
</body>
</html>