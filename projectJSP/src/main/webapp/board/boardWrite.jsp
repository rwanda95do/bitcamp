<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 데이터 받기
	// session
	String id = (String)session.getAttribute("memId");				// session.getAttribute() object타입 
	String name = (String)session.getAttribute("memName") ;
	String email = (String)session.getAttribute("memEmail");
	// boardWriteFroam.jsp
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");

	
	Map<String, String> map = new HashMap<>();
	map.put("id", id);			//map.put(" 이름", 값)
	map.put("name", name);
	map.put("email", email);
	map.put("subject", subject);
	map.put("content", content);
// DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	boardDAO.write(id, name, email, subject, content);

// 응답(뿌리기)

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>