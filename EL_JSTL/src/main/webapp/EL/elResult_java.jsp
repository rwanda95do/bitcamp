<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="angel" uri="/WEB-INF/elFunc.tld" %>
<%@ taglib prefix="devil" uri="/WEB-INF/elFunc2.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param['x'] } + ${param['y'] } = ${param['x'] + param['y'] } <br>
	${param['x'] } + ${param['y'] } = ${angel:sum(param['x'], param['y']) } <br>
	${param['x'] } - ${param['y'] } = ${angel:sub(param['x'], param['y']) } <br>
	${param['x'] } * ${param['y'] } = ${devil:mul(param['x'], param['y']) } <br>
	
</body>
</html>