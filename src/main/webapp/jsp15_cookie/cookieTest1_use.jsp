<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>클라이언트에 저장된 쿠키 확인하기</h1>
	<%
	// 1. request 객체의 헤더에 "Cookie" 문자열 존재 여부 확인(= 쿠키 존재 여부 확인)
	String cookieHeader = request.getHeader("Cookie");
	
	// 2. 리턴받은 헤더 정보에 대한 문자열이 null 이 아닐 경우 쿠키가 존재한다는 의미
	if(cookieHeader != null) {
		// 3. request 객체를 활용하여 클라이언트에 저장된 Cookie 객체(들) 가져오기
		// => request 객체의 getCookies() 메서드를 호출하여 Cookie[] 타입으로 리턴받기
		Cookie[] cookies = request.getCookies();
		
		// 4. for 문을 사용하여 Cookie 배열 크기만큼 반복을 통해 쿠키에 접근 가능
// 		for(int i = 0; i < cookies.length; i++) {
// 			Cookie cookie = cookies[i];
// 		}
		
		for(Cookie cookie : cookies) {
			// 5. Cookie 객체의 getName() 메서드와 getValue() 메서드를 호출하여 쿠키 정보 가져오기
			out.println("쿠키명 : " + cookie.getName() + "<br>");
			out.println("쿠키값 : " + cookie.getValue() + "<br>");
		}
		
	}
	%>
	<button onclick="location.href='cookieTest1.jsp'">쿠키 메인</button>
</body>
</html>












