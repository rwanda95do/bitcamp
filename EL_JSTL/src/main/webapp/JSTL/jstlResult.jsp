<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Post로 보내면 한글이 깨짐니다.
<fmt:requestEncoding value="UTF-8"/>		<!-- request.setCharacterEncoding("UTF-8") -->
	<ul>
		<li>이름 : ${param.name }</li>
		<li>나이 : ${param.age }살
			<c:if test="${param.age >= 19}"  >성인</c:if>
			<c:if test="${param.age <19}"  >청소년</c:if>
		</li>
		<li>색깔 : ${param.color }
			
			<c:if test="${param.color == 'red' }">빨강</c:if>
			<c:if test="${param.color == 'green' }">초록</c:if>
			<c:if test="${param.color == 'blue' }">파랑</c:if>
			<c:if test="${param.color eq 'magenta' }">보라</c:if>
			<c:if test="${param.color eq 'cyan' }">하늘</c:if>
			
			<c:choose>
				<c:when test="${param.color == 'red' }">빨강</c:when>
				<c:when test="${param.color == 'green' }">초록</c:when>
				<c:when test="${param.color == 'blue' }">파랑</c:when>
				<c:when test="${param.color == 'magenta' }">보라</c:when>
				<c:otherwise>하늘</c:otherwise>
			</c:choose>
		</li>
		
		<!-- 
		하나의 값 : String hobby = request.getParameter("hobby")
		여러개의 값 : String [] hobby =  request.getParameterValues("hobby")
		 -->
		<li>취미 :  ${param.hobby }
			<br>
			${paramValues['hobby'][0] }
			${paramValues['hobby'][1] }
			${paramValues['hobby'][2] }
			${paramValues['hobby'][3] }
			${paramValues['hobby'][4] }		
			<br>
			${paramValues.hobby[0] }
			${paramValues.hobby[1] }
			${paramValues.hobby[2] }
			${paramValues.hobby[3] }
			${paramValues.hobby[4] }
			<br>
			<!-- 
			확장형FOR
			 -->
			<c:forEach var="data"  items="${paramValues.hobby }">${data }</c:forEach>
		</li> 
	</ul>
</body>
</html>