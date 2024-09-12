<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<%
/*
// 1. 쿠키
	Cookie[] ar = request.getCookies();

	if(ar != null) { // 쿠키값이 있다면 로그아웃시켜라
		for(int i=0; i<ar.length; i++) {
			if(ar[i].getName().equals("memName")){
				ar[i].setMaxAge(0);		// 시간을 0으로 주면, 쿠키를 지우는것
				response.addCookie(ar[i]);		// 쿠키가 변경된 사실을 클라이언트에 저장
			}
			
			if(ar[i].getName().equals("memId")){
				ar[i].setMaxAge(0);		// 시간을 0으로 주면, 쿠키를 지우는것
				response.addCookie(ar[i]);		// 쿠키가 변경된 사실을 클라이언트에 저장
			}
		}
	}
*/

// 2. 세션
	session.removeAttribute("memName");
	session.removeAttribute("memId");
	
	// session.invalidate();  // 한번에 모든 세션을 지울때 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
<script type="text/javascript">
window.onload = function() {
	alert("로그아웃");
	location.href = "../index.jsp";
}

</script>
</html>