<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width: 800px;
		text-align: center;
	}
	thead tr{
		border-top: 2px solid #115185;
		border-bottom: 1px solid #EEEEEE;
		background-color: #F7F7F7;
		height: 40px;
	}
	tbody tr{
		border-bottom: 1px solid #EEEEEE;
		height: 34px;
	}
	tbody tr td:nth-child(2){
		text-align: left;
	}
	tbody tr:nth-child(even){
		background-color: #FAFAFA;
	}
	tbody tr:hover{
		background-color: #FBFBFB;
	}
</style>
</head>
<body>
	<div>
		<table>
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
			</colgroup>
			
			<thead>
				<tr>
					<td>No</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
					<td>첨부파일</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty boardList }">
						<tr>
							<td colspan="6">데이터가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${boardList }" var="board">
							<tr>
								<td>${board.boardNum }</td>
								<td>${board.title }</td>
								<td>${board.writer }</td>
								<td>${board.createDate }</td>
								<td>${board.readCnt }</td>
								<td></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="btnDiv">
			<div class="btn" onclick="location.href='regBoardForm.bo';">글쓰기</div>
		</div>
	</div>
</body>
</html>