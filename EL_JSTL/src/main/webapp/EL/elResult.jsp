<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- int x = Integer.parseInt(request.getParameter("x"); -->
<!-- param['x'] -->
	${param['x'] } + ${param['y'] } = ${param['x'] + param['y'] }
	<br>
	${param['x'] } - ${param['y'] } = ${param['x'] - param['y'] }
	<br>
	${param.x } * ${param.y } = ${param.x * param.y }
	<br>
	${param.x } / ${param.y } = ${param.x / param.y }
	

</body>
</html>