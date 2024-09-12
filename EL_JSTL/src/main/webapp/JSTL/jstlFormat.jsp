<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
fmt:formatNumber type="number" 는 3자리마다 , 를 찍어준다 <br>
<fmt:formatNumber type="number" value="123456789" /> <br>
<fmt:formatNumber type="number" value="123456789.88" /> <br>
<fmt:formatNumber type="number" value="123456789.88" maxFractionDigits="1" /> *소수점 이하 한자리<br>

<fmt:formatNumber type="number" value="123456.78" pattern="#,###"/> <br>
<fmt:formatNumber type="number" value="123456.788" pattern=".##"/> <br>
<fmt:formatNumber type="number" value="123456.789" pattern="#,###.##" /><br>

<fmt:formatNumber type="number" value="0000.00" pattern="#,###.##" /><br>
<fmt:formatNumber type="number" value="0000.00" pattern="0,000.00" /> *강제로 0표시<br>
<fmt:formatNumber type="number" value="12.3" pattern="000.00" /><br>

<hr>
<c:set var="now" value="<%=new java.util.Date() %>"/>
<c:out value="${now }"/>
date: <fmt:formatDate value="${now }" type="date"/> <br>
time: <fmt:formatDate value="${now }" type="time"/> <br>
both: <fmt:formatDate value="${now }" type="both"/> <br>

<fmt:formatDate value="${now }" pattern="yyyy-MM-dd hh:mm" type="both"/> <br>
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" type="date"/> <br>
<fmt:formatDate value="${now }" pattern="yy-MM-dd E요일 a" type="date"/> <br>
<fmt:formatDate value="${now }" pattern="HH:mm:ss" type="time"/> <br>

</body>
</html>