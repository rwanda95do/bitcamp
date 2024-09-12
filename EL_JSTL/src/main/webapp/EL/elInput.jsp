<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="get" action="elResult.jsp" >
	<table border="1" width="50%" style="border-collapse: collapse;">
		<tr>
			<th width="50%">x</th>
			<td>
				<input type="text" id="x" name="x">
			</td>
		</tr>
		<tr>
			<th>y</th>
			<td>
				<input type="text" id="y" name="y">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="계산">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>