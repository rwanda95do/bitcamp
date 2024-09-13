<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
table {
	border-collapse: collapse;
}

td, th {
padding: 5px;
}
div {
	color : red;
	font-size : 8pt;
	font-weight: bold;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>
		<img alt="home" src="../image/1.jpg" onclick="location.href='../index.do'" style="cursor: pointer;">
		
	</h1>
	<form name="memberLoginForm" >
		<table border="1" cellspacing="0" cellpadding ="5">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="id" class="id" name="id">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="pwd" class="pwd" name="pwd">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input id="loginBtn" type="button" value="로그인" >
					<input type="button" value="회원가입" onclick="location.href='/memberMVC/member/writeForm.do'">
				</td>
			</tr>
		</table>
	</form>
	<div id="check"></div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#loginBtn').click(function() {
		$('#check').empty();
		
		if($('#id').val() == ''){
			$('#check').html('아이디 입력');
		} else if($('#pwd').val() == ''){
			$('#check').html('비밀번호 입력');
		}else {
			$.ajax({
				type: "post",  // method="post"
				url: "/memberMVC/member/login.do",  // action="memberLogin.jsp"
				data: {
					'id': $('#id').val(), 
					'pwd': $('#pwd').val()
				},
				dataType: "text",  // text/xml/json
				success: function(data) {
					if(data.trim()=='fail'){
						alert("아이디 또는 비밀번호가 틀렸습니다.");
					} else {
						alert(data.trim() + "님 로그인");
						location.href="/memberMVC/index.do";
					}
				},
				error: function(e) {
					console.log(e);
				}
				
			}); //디비가서 할짓 하고 와라
		}
	});
});
</script>
</html>