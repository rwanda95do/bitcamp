<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
<style type="text/css">

table {
	border-collapse: collapse;
}

td, th {
padding: 5px;
}

#currentPaging{
	color:red;
	font-size: 15pt;
	padding: 5px 8px;
	margin: 3px;
}
#paging{
	color:black;
	font-size: 15pt;
	padding: 5px 8px;
	margin: 3px;
}
span:hover{
	text-decoration: underline;
}
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited {color: black; text-decoration: none;}
.subjectA:hover {color: green; text-decoration: underline;}
.subjectA:active {color: black; text-decoration: none;}

</style>


<title>Insert title here</title>
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
	</div>

	<div id="container">
		<div>
			<jsp:include page="../main/boardMenu.jsp" />
		</div>
		
		<div id="section" class="boardListDiv">
		
			<input type="text" id="memId" value="${sessionScope.memId }">
			<input type="text" id="pg" value="${requestScope.pg }">
			
			<table border="1" cellspacing="0" cellpadding ="5">
				<tr>
					<th width="100">글번호</th>
					<th width="300">제목</th>
					<th width="150">작성자</th>
					<th width="150">작성일</th>
					<th width="100">조회수</th>
				</tr>
			
			<c:if test="${requestScope.list != null}">
				<c:forEach var="boardDTO"  items="${list }"  >
					<tr>
						<th>${boardDTO.seq}</th>
						<th><a class="subjectA">${boardDTO.getSubject()}</a></th>
						<th>${boardDTO.id}</th>
						<th><fmt:formatDate value="${boardDTO.getLogtime()}" pattern="yyyy.MM.dd"/></th>
						<th>${boardDTO.hit}</th>
					</tr>
				</c:forEach>
			</c:if>
			</table>
			
			<div align="center">${boardPaging.pagingHTML}</div>
		</div>	<!-- div #section -->
	</div><!-- div #container -->
</div>
</body>

<script type="text/javascript">
function boardPaging(pg) {
	location.href = "/projectMVC/board/boardList.do?pg=" +pg; 
}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardList.js">

</script>

</html>