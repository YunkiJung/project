<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" class="myInput" value="1"><br>
	<input type="text" class="myInput" value="2"><br>
	<input type="text" class="myInput" value="3"><br>

	<script type="text/javascript">
		//클래스로 태그 선택
		const tag = document.getElementsByClassName('myInput');
		//alert(tag[2].value);
		
		const tag1 = document.getElementsByTagName('input');
		//input 태그 3개의 모든 value값을 차례대로 alert으로 출력
		for(let i = 0; i < tag1.length; i++){
			//alert(tag1[i].value);
		}
		
		//tag1.forEach(function aaa(){});
		/* forEach(tag1.function(element, index){
			alert(index + " " + element);
		}); */
		
		
		
		//querySelector - 태그의 선택을 css처럼 할 수 있게 해 줌.
		document.querySelector('#java'); //id가 java인 태그를 선택
		
		document.querySelector('.java'); //class가 java인 첫번째 태그를 선택
		document.querySelectorAll('.java'); //class가 java인 모든 태그를 선택
		
		document.querySelector('table'); //table 태그를 선택
		document.querySelectorAll('table'); //table 태그를 선택
		
		document.querySelector('div > table'); //div > table 태그를 선택
		document.querySelectorAll('div > table'); //div > table 태그를 선택
		document.querySelectorAll('h1, input'); //div > table 태그를 선택
		document.querySelectorAll('input[type="text"]'); //div > table 태그를 선택
		
	</script>
</body>
</html>