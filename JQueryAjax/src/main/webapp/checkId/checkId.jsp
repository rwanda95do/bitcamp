<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>		<%--xml 태그는 자기보다 앞에 뭐가 있으면 에러냄.. → xml태그 시작전의 모든 공백 제거 --%>


 
<%-- JAVA --%>
<%--
	html 변수 = DTO.java 파일의 컬럼 = DB의 테이블 컬럼명  
 --%>
<%
	String user_id = request.getParameter("user_id");


// DB연동 구역
	
	// 중복체크
	 // id=hong이라면 이미 저장된 id → 사용 불가능
	boolean result = false;
	if(user_id.equals("hong")){
		result = true;
	} else {
		
		// $('#idDiv').text('아이디를 입력해주세요');
	}
	

%>




<%-- XML --%>
<?xml version="1.0" encoding="UTF-8"?>
<checkId>
	<result><%=result %></result>
</checkId>

