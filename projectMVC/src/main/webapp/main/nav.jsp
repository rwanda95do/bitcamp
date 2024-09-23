<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${memId == null }">
	<input type="button" value="로그인" onclick="location.href='${pageContext.request.contextPath }/member/loginForm.do'" /><br/><br/>
	<input type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath }/member/writeForm.do'"/><br/><br/>
</c:if>
<c:if test="${sessionScope.memId != null }">
	<h3><a href="${pageContext.request.contextPath }/member/updateForm.do">${memId }님</a> 로그인</h3>
	<input type="button" value="로그아웃" id="logoutBtn"/><br/><br/>
	<input type="button" value="회원정보수정" onclick="location.href='${pageContext.request.contextPath }/member/updateForm.do'" /><br/><br/>
</c:if>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	// 로그아웃
	$('#logoutBtn').click(function() {
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath }/member/logout.do',
			success: function() {
				alert('로그아웃');
				location.href='${pageContext.request.contextPath }/index.do';
			},
			error: function(e) {
				console.log(e);
			}
		});
	});
</script>