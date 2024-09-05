<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! 
	// JAVA 구역 : 전역변수
	// 1번만 실행
	String name = "홍길동";
	int age = 25;
%>
<%
	// JAV 구역 : 지역변수
	// 요청시마다 실행
	age++;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
hello JSP!! <br/>
안녕하세요~~~~~~JSP <br/>
나의 이름은 <%=name %>입니다. <br>
<% out.println("나의 이름은 " + name + "입니다."); %> <br>
<pre>
Q. JSP는 out을 선언하지 않았는데 왜 되는건가요???
A. 내장객체
	1. request : javax.servlet.http.HttpServletReqeuest 
	2. response : javax.servlet.http.HttpServletResponse
	3. out : javax.servlet.jsp.JspWriter
	4. session : javax.servlet.http.HttpSession
	5. application : javax.servlet.ServletContent
	6. pageContent : javax.servlet.jsp.PageContext
	7. page : javax.servlet.jsp.HttpJspPage
	8. config : javax.servlet.ServletConfig
	9. exception : java.lang.Throwable

+ 추가 
JSP는 서블릿 파일(.java), 컴파일파일(.class)을 알아서 만들어 준다. 
확인: [D:\WEB\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\testJSP\org\apache\jsp\exam]
그래서 JSP는 무겁다.
에러도 두번이나 발생 JSP한번, 서블릿에 한번
그래서 out.println을 사용하는것을 권장하지 않는다. 
</pre>
<br>
나의 나이는 <%=age %>살 입니다.

<!-- HTML 주석 -->
<%-- JSP 주석 --%>
<pre>
HTML주석과 JSP주석의 사용

페이지보기를 누르면 html주석은 웹에는 보이지만 브라우저에는 뜨진 않는다. -> 학원엔 왔지만 문이 잠겨서 강의실에 못 들어옴
JSP주석은 웹에 도착은 조차 안함 -> 학원에 안옴

즉, 완전 소멸은 JSP 주석을 사용해야 한다.
</pre>
<!-- 나의 나이는 <%=age %>살 입니다. -->
<%-- 나의 나이는 <%=age %>살 입니다. --%>










</body>
</html>