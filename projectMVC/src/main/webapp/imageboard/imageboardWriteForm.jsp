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
#imageboardWriteForm div {
	color : red;
	font-size : 8pt;
	font-weight: bold;
}
#imageboardWriteForm {
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
		<jsp:include page="../main/imageboardMenu.jsp"></jsp:include>
		<div id="section">
		<!--
			 enctype
			 기본 : enctype="application/x-www-form-urlencoded"
		 -->
			<form id="imageboardWriteForm" name="imageboardWriteForm" method="post" enctype="multipart/form-data"
					action="${pageContext.request.contextPath }/imageboard/imageboardWrite.do">
				<table border="1" cellspacing="0" cellpadding ="5">
					<tr>
						<th width="100px">상품코드</th>
						<td>
							<input type="text" id="imageId" class="imageId " name="imageId">
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>
							<input type="text" id="imageName" class="imageName " name="imageName">
						</td>
					</tr>
					<tr>
						<th>단가</th>
						<td>
							<input type="text" id="imagePrice" class="imagePrice " name="imagePrice">
						</td>
					</tr>
					<tr>
						<th>개수</th>
						<td>
							<input type="text" id="imageQty" class="imageQty " name="imageQty">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="40" id="imageContent" class="imageContent" name="imageContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<img id="showImg" width="100" height="100" alt="" src="" >
							<img id="camera" alt="카메라" src="../image/camera.png" width="30" height="30">
							<input type="file" id="image1" name="image1" style="visibility: hidden;"> 
							<div id="image1Div"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" id="imageboardWriteBtn" value="이미지등록">
							<!-- <input type="button" id="imageboardWriteBtn" value="이미지등록"> -->
							<input type="reset" value="다시작성" onclick="location.reload()">
						</td>
					</tr>
				</table>
				<div id="Div"></div>
			</form>
		</div>	
	</div>
</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$('#camera').click(function() {
	// 강제 이벤트 발생 : trigger()
	$("#image1").trigger('click');
});

// 선택한 이미지 확인하기
$('#image1').change(function () {
	 readURL(this); 
});

function readURL(input) {
var reader = new FileReader();
	
	var show;
	reader.onload = function(e) {
		$('#showImg').attr('src', e.target.result);  // e.target - 이벤트가 발생하는 요소를 반환해준다.
	}
	
	reader.readAsDataURL(input.files[0]);
}

$('#imageboardWriteBtn').click(function() {
	
});
</script>


</body>
</html>


<!-- 
FileReader 란?
FileReader는 type이 file인 input 태그 또는 API 요청과 같은 인터페이스를 통해 
File 또는 Blob 객체를 편리하게 처리할수있는 방법을 제공하는 객체이며
abort, load, error와 같은 이벤트에서 발생한 프로세스를 처리하는데 주로 사용되며,
File 또는 Blob 객체를 읽어서 result 속성에 저장한다.

FileReader도 비동기로 동작한다.

FileReader.onload()
load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료되었을 때마다 발생한다.
 -->