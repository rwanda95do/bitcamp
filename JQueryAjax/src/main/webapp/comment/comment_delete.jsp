<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%!
%>

<%
// java
	String num = request.getParameter("num");

// DB: 고유값인 num을 이용해서 DB에서 삭제 
	boolean result = true;
	String message = "삭제하였습니다.";
	

%>

<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result><%=result %></result>
	<message><%=message %></message>
</comment>