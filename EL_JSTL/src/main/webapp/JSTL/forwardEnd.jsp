<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
forward로 보낸 데이터는 공유한다. <br>
주손느 forwardStart.jsp가 보이지만 화면은 forwardEnd.jsp가 보인다.<br>
<br><br>
결과 : ${requestScope.list } <br>
리스트의 값이 아니라 리스트의 주소 값이 나온것이니 주의!<br>
<br><br>
3번째 항목 : ${requestScope.list[2] }
<br><br>
확장형for<br>
<c:forEach var="data" items="${requestScope.list}">
${data }
</c:forEach>
 데이터를 찾는 순서 : pageScope - requestScope - sessionScope <br>
<br>
 pageScope - requestScope - sessionScope <br>
                 list<br>
 *지금 list는 requestScope에만 있다. 그래서  items="${list}"라고만 적어도 가능
 <br>
  pageScope - requestScope - sessionScope <br>
    list         list<br>
 *지금 list가 여러군데 있다면, items="${requestScope.list}"라고 정확히 적어줘야한다.
 
 <br>
 <hr>
 <br>
 
 <c:forEach var="personDTO" items="${list2 }">
 ${personDTO } <br>
 </c:forEach>

 <c:forEach var="personDTO" items="${list2 }">
 ${personDTO.getName()} &emsp;&emsp; ${personDTO.getAge()}<br>
 </c:forEach>

*JSTL에서는 메서드 이름을 변수처럼 사용한다. 절대 변수명아님. 함수명임!! <br>
왜 변수명 아니냐? private걸었는데 어찌 쓸수 이쎇냐!! 
<c:forEach var="personDTO" items="${list2 }">
 ${personDTO.name} &emsp;&emsp; ${personDTO.age}<br>

 </c:forEach>
</body>
</html>