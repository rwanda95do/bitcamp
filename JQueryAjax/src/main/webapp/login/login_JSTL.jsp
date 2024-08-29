<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="result" value="true"></c:set>
<c:set var="message" value="안녕하세요 홍길동님"></c:set>

<c:if test="${param.user_id != 'hong'}" >
	<c:set var="result" value="false"></c:set>
	<c:set var="message" value="id틀림"></c:set>	
</c:if>

<c:if test="${param.user_password != 'hong'}" >
	<c:set var="result" value="false"></c:set>
	<c:set var="message" value="pw틀림"></c:set>	
</c:if>


<?xml version="1.0" encoding="UTF-8"?>
<login>
	<result><${result}</result>
	<message><${message}</message>
</login>