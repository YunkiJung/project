function setPassword(){
	const chk = document.getElementById('chk');
	
	const isChecked = chk.checked;
	
	//체크 됬을 때
	if(isChecked){
		//input 태그를 생성
		const pwInput = document.createElement('input');
		pwInput.type = 'password';
		pwInput.name = 'password';
		
		
		//노드 추가 방법
		//appendChild(추가할 태그) : 선택된 태그의 마지막 자식으로 추가
		const target = document.getElementById('boardWriteForm');
		//target.appendChild(pwInput);
		
		//insertBefore(추가할 태그, 추가할 위치)
		//두번째 매개변수 앞 위치에 첫번째 매개변수가 추가
		// target.lastElementChild; -> 선택한 태그의 마지막 자식
		// target.firstElementChild; -> 선택한 태그의 첫번째 자식
		target.insertBefore(pwInput, target.lastElementChild);
		
		
	}
	else{
		
	}
	
	
}