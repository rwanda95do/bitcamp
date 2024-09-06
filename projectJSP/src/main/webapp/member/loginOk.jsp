<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 데이터 받기
	// String name = request.getParameter("name");
	// String id = request.getParameter("id");

	String name = null;
	String id = null;

/*
// 1. 쿠키
	// 쿠키는 특정쿠키(원하는 것)만 꺼내올 수 없고, 모든 쿠키를 다 가져온다. 
	Cookie[] ar = request.getCookies();
	
	 if(ar != null) {
        for(int i = 0; i < ar.length; i++) {
            String cookieName = ar[i].getName(); // 쿠키명
            String cookieValue = ar[i].getValue(); // 쿠키값

            System.out.println("쿠키명 = " + cookieName);
            System.out.println("쿠키값 = " + cookieValue);
            System.out.println();
            // 쿠키명=JSESSIONID는 접속한 컴퓨터래요???
            
            if(cookieName.equals("memName")) name = ar[i].getValue();
            if(cookieName.equals("memId")) id = ar[i].getValue();
            		
        }
    }
*/

// 2. 세션
	name = (String) session.getAttribute("memName"); // 다형성 >> 자식 = (자식)부모
	id = (String) session.getAttribute("memId"); // 다형성 >> 자식 = (자식)부모


%>

<%=name %>
