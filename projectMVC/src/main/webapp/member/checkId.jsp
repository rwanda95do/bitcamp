<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	boolean exist = (boolean) request.getAttribute("exist");
%>

<c:if test="${exist }">exist</c:if>
<c:if test="${not exist }">non_exist</c:if>