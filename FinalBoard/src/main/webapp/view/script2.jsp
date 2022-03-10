<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="first"><br>
	<input type="text" id="second"><br>
	<input type="button" value="더하기" id="add"><br>
	<input type="text" id="result"><br>
	<script>
		window.addEventListener('load', function(){
			const addButton = document.getElementById('add');
			addButton.addEventListener('click', add);
		});
		function add(){
			const first = document.getElementById('first');
			const second = document.getElementById('second');
			var resultValue = parseInt(first.value) + parseInt(second.value);
			const result = document.getElementById('result');
			result.value = resultValue;
		}
	</script>
</body>
</html>