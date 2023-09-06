function crystalCheck(id){
	
	if(id==""){
		alert("로그인이 필요한 서비스 입니다.");
		return false;
	}else {
		window.location="/fortuneteller/index.jsp?page=crystalMain.jsp";
	}
	
}

/*
Dom Sammut 2013
***************
Web: www.domsammut.com
Twitter: www.twitter.com/domsammut

View codepen on my website: https://www.domsammut.com/projects/pure-css-loading-animation

*/

/*
var line01 = ["/fortunetellter/crystal/crystalImg/crystal_chat1.png","/fortunetellter/crystal/crystalImg/crystal_chat2.png","/fortunetellter/crystal/crystalImg/crystal_chat3.png"];

var timer = setInterval(createLine, 1000); // 무한으로 반복
var i = 0;

function createLine() {
	const parent = document.querySelector('.test_left_bubble'); // test_left_bubble의 클래스를 가진 div 선택
	// const child = document.createElement('div'); // 새로운 태그 만듦 div
	const imgTag = document.createElement('img');	 // 새로운 태그 만듦 img
	
	
	
	imgTag.setAttribute("src", line01[i]);
	// const newText = document.createTextNode(line01[i]);
	// imgTag.appendChild(newText);
	parent.appendChild(imgTag);
	// parent.appendChild(child);
	
	i++;
	
	if(i == line01.length) { 
		clearInterval(timer); // 셋인터벌끝
	}	
}
*/


/*setTimeout(function createLine(){
var i = 0;
for(i=0; i<10; i++){
document.write("<img src=crystal_chat1"+i+".png><br>")
	}
}, 2000);
*/