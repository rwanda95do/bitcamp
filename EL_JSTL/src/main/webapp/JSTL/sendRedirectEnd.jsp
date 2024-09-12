<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.getAttribute("list");
%>

결과 = ${requestScope.list }

<br>
${requestScope.list } 랑 request.getAttribute("list") 같음


</body>
</html>