<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="regBoard.bo" method="post">
	제목 : <input type="text" name="title" required><br>
	내용 : <input type="text" name="content"><br>
	작성자 : <input type="text" name="writer"><br>
	<input type="submit" value="등록">
</form>	
</body>
</html>