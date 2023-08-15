function writeSave() {
	if(document.writeForm.category.value == "0") {
		alert("카테고리를 선택해 주세요.");
		document.writeForm.category.focus();
		return false;
	}
	
	if(document.writeForm.writer.value == "") {
		alert("작성자를 입력해 주세요.");
		document.writeForm.writer.focus();
		return false;
	}
	
	if(document.writeForm.title.value == "") {
		alert("제목을 입력해 주세요.");
		document.writeForm.title.focus();
		return false;
	}
	
	if(document.writeForm.content.value == "") {
		alert("내용을 입력해 주세요.");
		document.writeForm.content.focus();
		return false;
	}
	
	if(document.writeForm.pass.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.writeForm.pass.focus();
		return false;
	}
}

function deleteSave() {
	if(document.delForm.pass.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.delForm.pass.focus();
		return false;
	}
}

function searchWord() {
	if(document.searchForm.searchKeyword.value == "") {
		alert("검색어를 입력해 주세요.");
		document.searchForm.searchKeyword.focus();
		// history.back(); // 뒤로가기
		return false;
	} 
	
}

function viewCategory() {
	var url = document.getElementById("category").value;
	location.href = url;
}