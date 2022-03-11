<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.boardListTable{
		width: 800px;
		text-align: center;
	}
	.boardListTable thead tr{
		border-top: 2px solid #115185;
		border-bottom: 1px solid #EEEEEE;
		background-color: #F7F7F7;
		height: 40px;
	}
	.boardListTable tbody tr{
		border-bottom: 1px solid #EEEEEE;
		height: 34px;
	}
	.boardListTable tbody tr td:nth-child(2){
		text-align: left;
	}
	.boardListTable tbody tr:nth-child(even){
		background-color: #FAFAFA;
	}
	.boardListTable tbody tr:hover{
		background-color: #FBFBFB;
	}
	.summaryDiv{
		color: blue;
		font-size: 12px;
		margin-bottom: 6px;
		display: inline-block;
	}
	.searchTable{
		width: 800px;
		height: 36px;
		text-align: center;
	}
	.searchTable input[type="text"]{
		width: 98%;
		border-radius: 6px;
		height: 26px;
		border: 1px solid black;
	}
	
	.searchTable input[type="submit"]{
		width: 98%;
		height: 30px;
		border-radius: 6px;
		outline: none;
	}
	.pageList{
		text-align: center;
		margin-top: 30px;
	}
	.pageList a{
		margin: 8px;
	}
</style>
</head>
<body>
	<div>
		<div class="searchDiv">
			<form action="boardList.bo" method="post">
				<table class="searchTable">
					<tr>
						<td>
							<select name="searchKeyword">
								<option value="TITLE">제 목</option>
								<option value="WRITER">작성자</option>
							</select>
						</td>
						<td><input type="text" name="searchValue"></td>
						<td><input type="submit" value="검색"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="summaryDiv">
			총 ${pageInfo.totalCnt }개의 게시글이 조회되었습니다.
		</div>
		
		<table class="boardListTable">
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
						<c:forEach items="${boardList }" var="board" varStatus="status">
							<tr>
								<%-- <td>${board.boardNum } / ${status.index } / ${status.count }</td> --%>
								<td>${board.boardNum }</td>
								<td>
									<c:choose>
										<c:when test="${board.isPrivate eq 'Y' }">
											<a href="confirmPw.bo?boardPw=${board.boardPw }&boardNum=${board.boardNum}">
												<img alt="private" src="image/private.jpeg" width="20px">
												${board.title }
											</a>
										</c:when>
										<c:otherwise>
											<a href="boardDetail.bo?boardNum=${board.boardNum }">
												${board.title }
											</a>
										</c:otherwise>
									</c:choose>
								</td>
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
		<c:if test="${not empty sessionScope.loginInfo }">
			<div class="btnDiv">
				<div class="btn" onclick="location.href='regBoardForm.bo';">글쓰기</div>
			</div>
		</c:if>
		<div class="pageList">
			<c:if test="${pageInfo.prev }">
				<a href="boardList.bo?nowPage=${pageInfo.beginPage - 1 }">이전</a>
			</c:if>
			<c:forEach begin="${pageInfo.beginPage }" end="${pageInfo.endPage }" var="pageIndex">
				<a href="boardList.bo?nowPage=${pageIndex }">
					<span <c:if test="${pageInfo.nowPage eq pageIndex }">style="color: red;"</c:if> >${pageIndex}</span>
				</a>
			</c:forEach>
			<c:if test="${pageInfo.next }">
				<a href="boardList.bo?nowPage=${pageInfo.endPage + 1 }">다음</a>
			</c:if>
		</div>
	</div>
</body>
</html>