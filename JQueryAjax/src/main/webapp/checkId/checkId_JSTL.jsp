<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="result" value="false"/>
<c:if test="${param.user_id == 'hong'}">
	<c:set var="result" value="true"/>
</c:if>


<?xml version="1.0" encoding="UTF-8"?>
<checkId>
	<result>${result}</result>
</checkId>
