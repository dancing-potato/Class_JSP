<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 1. 쿠키 생성 - Cookie 객체 생성(실제 쿠키 파일이 생성되는 시점이 아님!)
Cookie cookie = new Cookie("cookieName", "cookieValue");
// => cookieName 이라는 속성명(이름)으로 cookieValue 라는 값 저장

// 2. 생성된 쿠키의 유효기간(만료기간) 설정
// => Cookie 객체의 setMaxAge() 메서드를 호출하여 유효기간 지정(초 단위)
//    만약, 생략할 경우 웹브라우저 동작할 동안만 쿠키 유지됨(= 웹브라우저 종료 시 삭제됨)
cookie.setMaxAge(60); // 60초 = 1분간 쿠키 유지됨

// 3. 쿠키를 클라이언트로 전송(= 클라이언트에 실제 쿠키 생성됨)
// => 응답 객체인 response 객체의 addCookie() 메서드를 호출하여 생성된 Cookie 객체를 파라미터로 전달
response.addCookie(cookie);

// ----------------------------------------
// 새로운 쿠키 생성하여 추가하기
// => 쿠키명 : "id", 쿠키값 : "admin"
// => 타이머 : 30분
Cookie cookie2 = new Cookie("id", "admin");
cookie2.setMaxAge(60 * 30); // 1800초 = 30분
response.addCookie(cookie2);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쿠키 생성 페이지</h1>
	<%--
	Cookie 객체 정보 확인(임시로 쿠키를 생성한 현재 페이지에서 확인)
	- getName() 메서드 : 쿠키 이름 리턴
	- getValue() 메서드 : 쿠키값 리턴
	- getMaxAge() 메서드 : 쿠키 유효기간 리턴
	--%>
	<h3>쿠키명 : <%=cookie.getName() %></h3>
	<h3>쿠키값 : <%=cookie.getValue() %></h3>
	<h3>쿠키 유효기간 : <%=cookie.getMaxAge() %>초</h3>
	<hr>
	<%-- 
	EL 의 내장객체 cookie 를 사용하여 쿠키에 접근하기 
	${cookie.쿠키명.name} 또는 ${cookie.쿠키명.value}
	--%>
	<h3>쿠키명 : ${cookie.id.name }</h3>
	<h3>쿠키값 : ${cookie.id.value }</h3>
	
	<button onclick="location.href='cookieTest1_use.jsp'">쿠키 확인</button>
	<button onclick="history.back()">돌아가기</button>
</body>
</html>














