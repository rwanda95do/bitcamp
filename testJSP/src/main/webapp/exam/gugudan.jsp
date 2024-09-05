<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 전역변수
%>
<%
// 지역변수
int num =2;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	margin: 20px;
	padding: 10px;
	float: left;
}
</style>
</head>
<body>
<%
for(int j=2; j<=9; j++){ 
%>
<div>
<%
	for(int i=1; i<=9; i++){
		int sum = j*i;
%>
		<%=j %> * <%=i %> = <%=sum %> <br>
<%
	}
%>
</div>
<%
}
%>	
</body>
</html>