<%@page import="com.jstl.PersonDTO"%>
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
	
	// -- java ------------------------------------------
	PersonDTO aa = new PersonDTO("홍길동", 25);
	PersonDTO bb = new PersonDTO("라이언", 23);
	PersonDTO cc = new PersonDTO("플도", 30);
	
	List<PersonDTO> list2 = new ArrayList<PersonDTO>();	
	list2.add(aa);
	list2.add(bb);
	list2.add(cc);
	
	request.setAttribute("list2", list2);
	
	// 페이지 이동 - 데이터 공유X
	RequestDispatcher dispatcher = request.getRequestDispatcher("forwardEnd.jsp");	//상대번지
	dispatcher.forward(request, response);
%>
<%--
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardEnd.jsp");	//상대번지
dispatcher.forward(request, response);


<jsp:forward page="forwardEnd.jsp" />
두개는 같음
 --%>