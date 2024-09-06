<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 데이터 받기
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName") ;
	String email = (String)session.getAttribute("memEmail");
	
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");


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