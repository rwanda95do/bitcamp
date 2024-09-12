<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>*******include - directive********</h3>
	<%@ include file="today.jsp" %>
	<%String name ="홍길동"; %>
	main.jsp name = <%=name %>
	
	<h3>*******include - JSP directive********</h3>
	<jsp:include page="image.jsp"></jsp:include>
	
	<p>JSP directive를 추천합니다</p>
	<p>왜? 컴파일을 시킨 후(.class 파일을) 합치기 때문에 변수가 충돌나지 않는다.</p>
	
	
	<h3>*****3초뒤에 네이버 이동******</h3>
	<%response.setHeader("Refresh", "3;url=https://www.naver.com"); %>
</body>
</html>