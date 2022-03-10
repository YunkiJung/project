<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" name="name" id="myInput">
	<input type="button" value="button" onclick="printValue();">
	<script type="text/javascript">
		//자바스크립트로 태그를 컨트롤
		//1. 태그를 선택할 수 있어야 함
		//2. 선택한 태그에 자바스크립트 문법 적용
		
		// -- 태그 선택 법 -- id선택자, class선택자
		//1. id 선택자
		const tag = document.getElementById('myInput');
		
		//선택한 태그의 name속성값을 불러 옴
		const name = tag.name;
		console.log(name);
		
		//선택한 태그의 id속성값을 불러 옴
		const id = tag.id;
		console.log(id);
		
		//선택한 태그의 name속성값을 java로 변경
		tag.name = 'java';
		console.log(tag.name);
		
		//printValue() 함수 실행 시 input태그에 작성한
		//내용이 alert으로 출력되도록 해보세요.
		function printValue(){
			const inputTag = document.getElementById('myInput');
			const value = inputTag.value;
			alert(value);	
		};
	
		//input태그의 정보(속성값)를 출력
		
	</script>
</body>
</html>