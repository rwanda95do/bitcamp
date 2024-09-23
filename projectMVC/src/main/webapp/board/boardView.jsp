<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th, td {width: 100px;}
input[type='button'] {
	margin: 10px 5px;
}

</style>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<h1>
			<img alt="" src="${pageContext.request.contextPath }/image/s4.png" width="50" height="50"
			onclick="location.href='${pageContext.request.contextPath }/index.do'" >
			MVC를 활용한 미니프로젝트
			</h1>
			<hr style="border-color: #483D8B; border-width: 3px;">
		</div> 	<!--div #header  -->
		
		<div id="container">
			<div>
				<jsp:include page="../main/boardMenu.jsp" />
			</div>
			<div>
			<form id="boardViewForm" action="">
				<input type="text" id="memId" value="${sessionScope.memId }">
				<input type="text" name="seq" value="${boardDTO.seq}">
				<input type="text" name="pg" value="${requestScope.pg}">
				
				<table border="1" cellspacing="0" cellpadding ="5">
				 	<tr>
				 		<th>제목</th>
				 		<td id="subject" colspan="5">${boardDTO.getSubject() }</td>
				 	</tr>
				 	<tr>
				 		<th>글번호</th>
				 		<td>${boardDTO.seq }</td>
				 		<th>작성자</th>
				 		<td><span id="id">${boardDTO.id }</span></td>
				 		<th>조회수</th>
				 		<td>${boardDTO.hit }</td>
				 	</tr>
				 	<tr>
				 		<th>내용</th>
				 		<td id="content" colspan="5">
				 			<div style="width: 100%; height: 100%; overflow: auto">
				 				<pre style="white-space: pre-line; word-break: break-all; ">${boardDTO.content }</pre>
				 			</div>
				 		</td>
				 	</tr>
				</table>
	
				<div style="width: 800px;" align="center">
					<input type="button" value="목록" 
						onclick="location.href='${pageContext.request.contextPath}/board/boardList.do?pg=${pg}'">
					<span id="boardViewSapn">
						<input id="boardUpdateFormBtn" type="button" value="수정">
						<input id="boardDeleteFormBtn" type="button" value="삭제">
					</span>
				</div>
			</form>
				
			</div>
		</div> <!-- div #container -->
	</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>

</body>
</html>