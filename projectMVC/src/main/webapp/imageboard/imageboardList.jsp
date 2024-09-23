<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	</div> <!-- div #header -->

	<div id="container">
		<div>
			<jsp:include page="../main/imageboardMenu.jsp" />
		</div>
		
		<div id="section" class="boardListDiv">
			<table border="1" cellspacing="0" cellpadding ="5">
				<tr height="150">
					<th width="100">번호</th>
					<th width="150">이미지</th>
					<th width="150">상품명</th>
					<th width="150">단가</th>
					<th width="100">개수</th>
					<th width="100">합계</th>
				</tr>
			
			</table>
		
		
		</div>
	</div>
	
	
	
</div>
</body>
</html>