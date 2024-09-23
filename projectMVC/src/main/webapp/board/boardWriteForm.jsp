<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
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
#boardWriteForm div {
	color : red;
	font-size : 8pt;
	font-weight: bold;
}
#boardWriteForm {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 30px auto;
	text-align: left;
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
	</div>
	
	<div id="container">
		<jsp:include page="../main/boardMenu.jsp"></jsp:include>
		<div id="section">
			<form id="boardWriteForm" name="boardWriteForm">
				<table border="1" cellspacing="0" cellpadding ="5">
					<tr>
						<th>제목</th>
						<td>
							<input type="text" id="subject" class="subject" name="subject">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="40" id="content" class="content" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" id="writeBtn" value="글쓰기">
							<input type="reset" value="다시작성" onclick="location.reload()">
						</td>
					</tr>
				</table>
			</form>
		</div>	
	</div>
</div>
</body>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/board.js"></script>


</html>