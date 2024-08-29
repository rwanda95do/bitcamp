<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>


<c:set var="num" value="3"></c:set>

<%!
// 전역변수 → 삭제가 되도 몇개의 덧글을 작성했는지 볼려면 전역으로 써야하는건가?
	int num = 3;
%>

<%
// java

	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	num++;
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
	String datetime = sdf.format(date);
	
	boolean result = true;
	String message = "덧글 작성 완료!";
%>

<?xml version="1.0" encoding="UTF-8"?>
<comment>
		<result><%=result %></result>
		<message><%=message %></message>
	<item>
		<num><%=num %></num>
		<writer><%=writer %></writer>
		<content><%=content %></content>
		<datetime><%=datetime %></datetime>
	</item>
</comment>