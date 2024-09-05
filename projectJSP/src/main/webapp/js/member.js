// 우편번호 
function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

           
	// 요기봐주시오!!
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zipcode").value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}


// 중복체크 : 아이디
function checkId(){
	let id = document.getElementById("id").value;
	if(id==""){
		document.getElementById("idDiv").innerHTML="아이디를 입력해주세요";
	}else {
		window.open("./checkId.jsp?id="+id, "mywindow", "width=450 height=100 top=100 left=100");
	}
	console.log(id);
}

// 이메일
function change() {
	document.getElementById("email2").value = document.getElementById("email3").value;
}

// 회원가입 : 유효성검사
function memberWrite(){
	// 초기화
	document.getElementById("nameDiv").innerHTML = "";
	document.getElementById("idDiv").innerHTML = "";
	document.getElementById("pwdDiv").innerHTML = "";
	
	// 유효성 검사
	if(document.memberWriteForm.name.value == ""){
		document.getElementById("nameDiv").innerHTML = "이름입력";
	}else if(document.getElementById("id").value == ""){
		document.getElementById("idDiv").innerHTML = "아이디입력";
	}else if(document.getElementById("pwd").value == ""){
			document.getElementById("pwdDiv").innerHTML = "비밀번호입력";
	}else if(document.getElementById("repwd").value != document.getElementById("pwd").value){
			document.getElementById("pwdDiv").innerHTML = "비밀번호 다름";
	}else if(document.getElementById("id").value != document.getElementById("check").value){
		document.getElementById("idDiv").innerHTML = "중복체크 하세요";
	}else {document.memberWriteForm.submit();}
}

function memberLogin(){
	if(document.getElementById("id").value==""){
		document.getElementById("check").innerHTML="아이디를 입력해주세요";
	}else if(document.getElementById("pwd").value==""){
		document.getElementById("check").innerHTML="비밀번호를 입력해주세요";
	}else {document.memberLoginForm.submit();}
}



