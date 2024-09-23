<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>
				<img alt="" src="${pageContext.request.contextPath }/image/s4.png" width="50" height="50">
				MVC를 활용한 미니프로젝트
			</h1>
			<jsp:include page="./main/menu.jsp" />
		</div>
		<div id="container">
			<div id="nav">
				<jsp:include page="./main/nav.jsp" />
			</div>
			<div id="section">
				<h3>
					저희 홈페이지를 방문해주셔서 감사합니다.<br/><br/>
					Have a nice day!! <br/><br/>
					<img alt="" src="${pageContext.request.contextPath }/image/s1.png">
					
				</h3>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>
</html>