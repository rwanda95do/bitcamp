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

input[type="button"] {
	margin: 5px 0px;	
}

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
			<jsp:include page="../main/imageboardMenu.jsp" />
		</div>
		
		<div id="section" class="imageboardListDiv">
			<input type="text" id="pg" value="${requestScope.pg }">
			
			<table border="1" cellspacing="0" cellpadding ="5">
				<tr>
					<th width="100">
						<input type="checkbox"> 번호
					</th>
					<th width="300">이미지</th>
					<th width="150">상품명</th>
					<th width="150">단가</th>
					<th width="100">개수</th>
					<th width="200">합계</th>
				</tr>
			
			<c:if test="${requestScope.list != null}">
				<c:forEach var="imageboardDTO"  items="${list }"  >
					<tr>
						<th>
							<input type="checkbox" id="allCheck"> ${imageboardDTO.seq}
						</th>
						<th>
							<a href="#" >
								<!-- src에는 가상 폴더의 주소를 줘야한다. -->

								<img src="http://localhost:8080/projectMVC/storage/${imageboardDTO.image1}" 
										alt="${imageboardDTO.imageName}" width="100px" height="100px">
								</img>
							</a>
						</th>
						<th>${imageboardDTO.imageName}</th>
						<th>
							<fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice}" />	
						</th>
						<th>
							<fmt:formatNumber pattern="#,###" value="${imageboardDTO.imageQty}" />
						</th>
						<th>
							<fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice * imageboardDTO.imageQty}" />
						</th>
					</tr>
				</c:forEach>
			</c:if>
			</table>
			<div style="border: 1px solid red;">
				<input type="button" value="선택삭제">
			</div>
			
			<div align="center">${imageboardPaging.pagingHTML}</div>
		</div>	<!-- div #section -->
	</div><!-- div #container -->
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/boardList.js"></script>
<script type="text/javascript">
function imageboardPaging(pg) {
	location.href = "/projectMVC/imageboard/imageboardList.do?pg=" +pg; 
}


$('#allCheck').click(function() {
	$('input[type="checkbox"]');
});
</script>

</body>
</html>