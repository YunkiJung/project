<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.replyDiv{
		margin-top: 20px;
	}
	textarea {
		resize: none;
	}
	.replyListDiv{
		margin-top: 20px;
	}
	.replyListDiv > div{
		margin-bottom: 16px;
	}
	
	.replyListDiv table tr{
		height: 60px;
	}
	
	.replyListDiv table td > div:nth-child(1){
		font-size: 12px;
		font-weight: bold;
	}
	.replyListDiv table td > div:nth-child(2){
		font-size: 12px;
		color: #999999;
		margin-bottom: 4px;
	}
	.replyListDiv table td > div:nth-child(3){
		font-size: 14px;
	}
	
	
</style>
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
		<input type="button" value="삭제" onclick="location.href='deleteBoard.bo?boardNum=${boardInfo.boardNum}';">
	</c:if>
	
	<div class="replyDiv">
		<c:if test="${not empty sessionScope.loginInfo }">
			<div>
				<form action="regReply.bo" method="post">
					<input type="hidden" name="boardNum" value="${boardInfo.boardNum }">
					<div><textarea name="content" rows="3" cols="50" placeholder="댓글을 작성해주세요" required></textarea></div>
					<div><input type="submit" value="댓글 등록"></div>
				</form>
			</div>
		</c:if>
		<div class="replyListDiv">
			<table>
				<colgroup>
					<col width="80%">
					<col width="*">
				</colgroup>
				<c:forEach items="${replyList }" var="reply">
					<tr>
						<td>
							<div>${reply.writer }</div>
							<div>${reply.createDate }</div>
							<div>${reply.content }</div>
						</td>
						<c:if test="${sessionScope.loginInfo.memId eq reply.writer or sessionScope.loginInfo.isAdmin eq 'Y'}">
							<td>
								<input type="button" value="댓글 삭제" onclick="location.href='deleteReply.bo?replyNum=${reply.replyNum}&boardNum=${boardInfo.boardNum }';">
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>	
	</div>
	
</body>
</html>