<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<%
	//java
	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");


	//DB
	boolean result= true;
	String message="안녕하세요 홍길동님";
	// ID:hong,  PW:111
	if(!user_id.equals("hong")){
		result = false;
		message = "가입되지 않은 아이디입니다.";
	} else if(!user_password.equals("111")){
		result = false;
		message = "비밀번호가 틀렸습니다.";
	}
	
%>



<?xml version="1.0" encoding="UTF-8"?>
<login>
	<result><%=result %></result>
	<message><%=message %></message>
</login>