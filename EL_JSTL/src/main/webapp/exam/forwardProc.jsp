<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setAttribute("apple", "바나나");

	// 페이지 이동 -> 인터페이스제공
	RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp"); //상대번지
	dispatcher.forward(request, response);	// 제어권 넘김
%>
<%--
<jsp:forward page="forwardResult.jsp" />
이건 잘 안써요
 --%>
 request.getRequestDispatcher("forwardResult.jsp") 에서 절대번지를 사용하면 안됩니다.<br>
 