function deleteCheck() {
	
var urlParams = new URL(location.href).searchParams;
var num = urlParams.get('num');

 if (confirm("정말로 글을 삭제 하시겠습니까?")){ // 삭제
    alert("글이 삭제 되었습니다.");
	location.href = "/fortuneteller/index.jsp?page=qnaDeleteProc.jsp&num="+num;
 }else{ // 취소
     history.back();
 }
}
function toggleDown(){
	
	var click = document.getElementById("toggle_bar");
			if(click.style.display == 'none'){
                click.style.display = 'block';
            }else{
                click.style.display = 'none';
            }
};

