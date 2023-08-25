function changeText() {
	var text = document.getElementById("loading_2");
			text.innerHTML = "추출 완료";
}

function changeBtn(){
	document.getElementById("resultBtn1").innerHTML="";
	
}

setTimeout(() => changeText(), 5000);
setTimeout(() => changeBtn(), 5000);

function constellCheck(id){
	
	if(id==""){
		alert("로그인이 필요한 서비스 입니다.");
		return false;
	}else {
		window.location="/fortuneteller/index.jsp?page=constellationMain.jsp";
	}
	
}
