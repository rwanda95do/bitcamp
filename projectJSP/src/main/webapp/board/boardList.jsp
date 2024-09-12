<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.dto.BoardPaging"%>
<%@page import="board.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDAO"%>
    
<%
	
	int pg = Integer.parseInt(request.getParameter("pg"));

	// 1페이지당 5개
	int endNum = pg*5;
	int startNum = endNum-4;
	
	
// DB
	BoardDAO boardDAO = BoardDAO.getInstance();
	List<BoardDTO> list=boardDAO.boardList(startNum, endNum);
	
// 페이징 처리 
	// 1. 총글수
	int totalA = boardDAO.getTotalA();

	BoardPaging boardPaging = new BoardPaging();
	boardPaging.setCurrentPage(pg);
	boardPaging.setPageBlock(3);
	boardPaging.setPageSize(5);
	boardPaging.setTotalA(totalA);
	
	boardPaging.makePagingHTML();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
table {
	border-collapse: collapse;
}

td, th {
padding: 5px;
}
div {
	text-align: center;
	border: 1px solid red;
	width: 850px;
}
#currentPaging{
	color:red;
	font-size: 15pt;
	border: 1px solid blue;
}
#paging{
	color:black;
	font-size: 15pt;
}
span:hover{
	text-decoration: underline;
}

</style>


<title>Insert title here</title>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding ="5">
		<tr>
			<th width="100">글번호</th>
			<th width="300">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>
		
	<%
	if(list != null) { %>
		<%for(BoardDTO boardDTO :list){ %>
		<tr>
			<th><%=boardDTO.getSeq() %></th>
			<th><%=boardDTO.getSubject() %></th>
			<th><%=boardDTO.getId() %></th>
			<th><%=boardDTO.getLogtime() %></th>
			<th><%=boardDTO.getHit() %></th>
		</tr>
		<% } %>
	<% } %>
	</table>
	
	<div><%=boardPaging.getPagingHTML() %></div>
</body>


<script type="text/javascript">
function boardPaging(pg) {
	location.href = "boardList.jsp?pg=" +pg; 
}

</script>
</html>