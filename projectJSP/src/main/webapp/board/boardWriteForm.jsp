<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	color : red;
	font-size : 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<img alt="home" src="../image/1.jpg" onclick="location.href='../index.jsp'" style="cursor: pointer;">
<h1>글쓰기</h1>
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
</body>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/board.js"></script>


</html>