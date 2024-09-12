<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO"%>

<%
// 데이터 받기
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email1") + "@" + request.getParameter("email2");		// 게시글 작성 

// DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	String name = memberDAO.memberLogin(id, pwd);

%>

<%
// 뿌리기
if(name==null){ 
// 페이지 이동
	response.sendRedirect("loginFail.jsp");
} else {
	// 중요한 데이터는 주소표시줄에 실어서 보내지 말아라
	//response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name,"UTF-8")+"&id="+id);
	
	
// 그럼 어디에?
/*
// 1. 쿠키 (클라이언트)
	Cookie cookie = new Cookie("memName", name); // 쿠키 생성
	cookie.setMaxAge(3*60*10);	// 초 단위, 30분뒤에 사라짐
	response.addCookie(cookie);	// 클라이언트에 저장
	
	Cookie cookie2 = new Cookie("memId", id); // 쿠키 생성
	cookie.setMaxAge(3*60*10);	// 초 단위, 30분뒤에 사라짐
	response.addCookie(cookie2);	// 클라이언트에 저장
*/
	
	
// 2. 세션 (서버)
	//HttpSession session = request.getSession();		// 세션 생성 : jsp에서 내장객체로 이미 정의 되어있기 때문에 선언할 팔요가 없다.
	session.setAttribute("memId", id);	// 세션생성
	session.setAttribute("memName", name);	// 세션생성
	session.setAttribute("memEmail", email);
	
	// session.setAttribute("memDTO", memberDTO);

// 페이지 이동
	response.sendRedirect("loginOk.jsp");
}
%>
