<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//java의 역할
	
	List<String> list = new ArrayList<String>();	
	list.add("호랑이");
	list.add("사자");
	list.add("기린");
	list.add("타조");
	list.add("코끼리");
	list.add("코알라");
	list.add("여우");
	
	// 객체 전달
	request.setAttribute("list", list);
	
	// 페이지 이동 - 데이터 공유X
	response.sendRedirect("sendRedirectEnd.jsp");
%>

submit, button을 통해서 넘어가는 데이터는 문자열(String)만 가능하다<br> 
절대 객체는 넘길 수 없다.<br> 
<br>
객체를 넘기려면 session을 사용하거나<br>
request.setAttribute를 사용한다.