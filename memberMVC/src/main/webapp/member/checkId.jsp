<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// JAVA 전역변수

// 1.데이터 받기
	String id = request.getParameter("id");
	
// 2.DB가서 확인하기
	// 1) memberDAO를 싱글톤으로 생성
	MemberDAO memberDAO = MemberDAO.getInstance();
	// 2) boolean exist id가 있으면(true): 사용 불가능, 없으면(false): 사용가능
	boolean exist = (boolean) request.getAttribute("exist");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 조건이 맞을때랑 틀릴때랑  -->
<%if(exist) {%>
	<%=id %> 사용 불가능
	<br><br>
	<form action="checkId.jsp">
		아이디 : <input type="text" name="id">
		<input type="submit" value="중복체크">
	</form>
<%} else {%>
	<%=id %> 사용 가능
	<br><br>
	<input type="submit" value="사용하기" onclick="checkIdClose('<%=id %>')">
	<input type="reset" value="다시검색" >
<%}%>
<script type="text/javascript">
function checkIdClose(id) {
	opener.document.getElementById("id").value = id;
	opener.document.getElementById("check").value = id;
	window.close();
	opener.document.getElementById("pwd").focus();
}

</script>

</body>
</html>