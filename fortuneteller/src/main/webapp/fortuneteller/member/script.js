function idCheck(id){
	
	if(id == ""){
		alert("아이디를 입력해주세요.");
		document.regForm.id.focus();
	}else{
		url= "member/idCheck.jsp?id="+id;
		var status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=300, height=200, top=0,left=0";
		window.open(url,"post",status);
	}
	
}

function inputCheck(){
	
	if(document.regForm.id.value==""){
		alert("아이디를 입력해 주세요");
		document.regForm.id.focus();
		return;
	}
	
	if(document.regForm.pass.value==""){
		alert("비밀번호를 입력해 주세요");
		document.regForm.pass.focus();
		return;
	}
	
	if(document.regForm.repass.value==""){
		alert("비밀번호를 확인해 주세요");
		document.regForm.repass.focus();
		return;
	}
	
	if(document.regForm.pass.value !=document.regForm.repass.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.repass.focus();
		return;
	}
	
	if(document.regForm.name.value==""){
		alert("이름을 입력해 주세요");
		document.regForm.name.focus();
		return;
	}
	
	if(document.regForm.email.value==""){
		alert("이메일을 입력해 주세요");
		document.regForm.email.focus();
		return;
	}
	
	var str=document.regForm.email.value;
	var atPos=str.indexOf('@');
	var atLastPos=str.lastIndexOf('@');
	var dotPos=str.indexOf('.');
	var spacePos=str.indexOf(' ');
	var commaPos=str.indexOf(',');
	var eMailSize=str.length;
	
	if(atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 && commaPos == -1 && atPos+1 < dotPos && dotPos+1 < eMailSize);
	else {
		alert('이메일 주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요.');
		document.regForm.email.focus();
		return;
	}
	
	document.regForm.submit();
	
}


function loginCheck(){
	if(document.loginForm.id.value==""){
		alert("아이디를 입력해 주세요");
		document.loginForm.id.focus();
		return;
	}
	
	if(document.loginForm.pass.value==""){
		alert("비밀번호를 입력해 주세요");
		document.loginForm.pass.focus();
		return;
	}
	document.loginForm.submit();
}

function modifyCheck(){
	if(document.modifyForm.repass.value==""){
		alert("비밀번호를 입력해 주세요");
		document.modifyForm.repass.focus();
		return;
	}
	
	if(document.modifyForm.pass.value !=document.modifyForm.repass.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.modifyForm.repass.focus();
		return;
	}
	if(document.modifyForm.email.value==""){
		alert("이메일을 입력해 주세요");
		document.modifyForm.email.focus();
		return;
	}
	
	var str=document.modifyForm.email.value;
	var atPos=str.indexOf('@');
	var atLastPos=str.lastIndexOf('@');
	var dotPos=str.indexOf('.');
	var spacePos=str.indexOf(' ');
	var commaPos=str.indexOf(',');
	var eMailSize=str.length;
	
	if(atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 && commaPos == -1 && atPos+1 < dotPos && dotPos+1 < eMailSize);
	else {
		alert('이메일 주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요.');
		document.modifyForm.email.focus();
		return;
	}
	
	document.modifyForm.submit();
}

function deleteCheck(){
	if(document.deleteForm.pass.value==""){
		alert("비밀번호를 입력해 주세요");
		document.deleteForm.pass.focus();
		return;
	}
	
	if(document.deleteForm.pass.value !=document.deleteForm.repass.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.deleteForm.repass.focus();
		return;
	}
	var result=confirm("정말 탈퇴 하시겠습니까?");
	if(result){
		document.deleteForm.submit();
	}else{
		history.go(-1);
	}
}



