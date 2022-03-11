<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="password" id="inputPw">
	<input type="button" value="확인" onclick="checkPw();">
	<input type="hidden" id="realPw" value="${boardPw }">
	<input type="hidden" id="boardNum" value="${boardNum }">
	
	<script type="text/javascript">
	
		function checkPw(){
			const inputPw = document.getElementById('inputPw');
			const realPw = document.getElementById('realPw');
			const boardNum = document.getElementById('boardNum').value;
			
			if(inputPw.value == realPw.value){
				location.href = 'boardDetail.bo?boardNum=' + boardNum;	
			}
			else{
				alert('다시 입력해주세요.');
				inputPw.value = '';
				inputPw.focus();
			}
			
		}
		
	</script>
</body>
</html>