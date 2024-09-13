<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<img alt="home" src="../image/1.jpg" onclick="location.href='/memberMVC/index.do'" style="cursor: pointer;">
<h1>회원가입</h1>
<form name="memberWriteForm" method="post" action="/memberMVC/member/write.do">
	<table border="1" cellspacing="0" cellpadding ="5">
		<tr>
			<th width="100px">이름</th>
			<td>
				<input type="text" id="name" class="name" name="name" placeholder="이름입력">
				<div id="nameDiv"></div>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id" class="id" name="id" placeholder="아이디 입력" size="30">
				<input type="button" onclick="javascript:checkId()" />
				<input type="text" id="check" value="">
				<div id="idDiv"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password"" id="pwd" class="pwd" name="pwd" placeholder="비밀번호 입력" size="30">
				<div id="pwdDiv"></div>
			</td>
		</tr>
		<tr>
			<th>재확인</th>
			<td>
				<input type="password" id="repwd" name="repwd" placeholder="비밀번호 입력" size="30">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" id="gender_m" name="gender" value="0" checked="checked"><label for="gender_m">남자</label>
			    <input type="radio" id="gender_w" name="gender" value="1"><label for="gender_w" >여자</label>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="email1" name="email1"> @
				<input type="text" id="email2" name="email2" value="" >
				
				<input type="email" id="email3" name="email3" list="email3_list" oninput="change()">
				<datalist id="email3_list">
					<option value="직접입력"></option>
		    		<option value="hanmail.com"></option>
		    		<option value="naver.com"></option>
		    		<option value="gmail.com"></option>
				</datalist>
			</td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td>
				<select id="tel1" class="tell" name="tel1" >
		    		<option value="010" selected="selected">010</option>
		    		<option value="011">011</option>
		    		<option value="019">019</option>    		
			    </select>
				-
				<input type="text" id="tel2" class="tel" name="tel2" maxlength="4" size="3"> -
				<input type="text" id="tel3" class="tel" name="tel3" maxlength="4" size="3">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="zipcode" name="zipcode" placeholder="우편번호입력" size="10">
				<button type="button" onclick="checkPost()">우편번호 검색</button>
				<input type="text" id="addr1"  name="addr1" placeholder="주소" size="60" readonly="readonly"><br>
				<input type="text" id="addr2"  name="addr2" placeholder="상세주소" size="60">
			</td>
		</tr>		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원가입" onclick="javascript:memberWrite()">
				<input type="reset" value="다시입력">
			</td>
		</tr>
	</table>
</form>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="../js/member.js"></script>
	
</body>
</html>