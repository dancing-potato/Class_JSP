<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// "language" 라는 이름의 쿠키 설정하기
// => "lang" 파라미터 값을 쿠키값으로 설정(유효기간 : 1일)
Cookie cookie = new Cookie("language", request.getParameter("lang"));
cookie.setMaxAge(60 * 60 * 24); // 60초 * 60분 * 24시간 = 1일
response.addCookie(cookie);

// cookieTest2.jsp 페이지로 포워딩
response.sendRedirect("cookieTest2.jsp");
%>