<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--

JSTL(JSP Standard Tag Library)

- JSP 에서 사용 가능한 커스텀 태그 라이브러리
  => JSTL Core : JSTL 의 기본 핵심 기능
  (조건문, 반복문, 변수 설정 및 출력 등)을 제공
- JSTL 기능을 사용하려면 해당 라이브러리 다운로드 후 Build path 추가 필요
  또한, 등록된 JSTL 라이브러리를 실제 사용하려면 
  반드시 <%@ %> 디렉티브를 사용하여
  taglib 디렉티브를 등록하고 prefix 값과 uri 정보를 설정해줘야함
  
  => prefix : 태그에서 사용할 문구(접두어)를 지정하며, 
  주로 core 의 약자 c 를 사용
  
  => uri : 태그 라이브러리가 존재하는 위치
  
--%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int num = 20;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp</h1>
	<%--
	c:set 태그를 사용하여 변수 설정(선언 및 초기화)
	=> var 속성에 변수명, value 속성에 변수값 지정
	=> scope 속성을 사용하여 변수의 유효범위 지정 가능하며, 
	생략 시 page 속성이 지정됨
	   (현재 페이지에서만 유효한 변수로 선언됨)
	=> 선언(생성)된 변수는 EL 을 사용하여 접근 가능함 
	--%>	
	<c:set var="str" value="Hello,World!" />
	
	<%-- c:set 태그를 통해 생성된 str 변수를 EL 을 통해 접근 가능 --%>
	<h3>\${str } = ${str }</h3>
	
	<%-- 주의! 
	c:set 태그를 통해 생성된 str 변수는 표현식 등의 자바 문법 기준으로는 
	존재하지 않는 변수이므로 접근 불가 --%>
	<%-- 	<%=str %> --%>
	
	<%-- 주의! 
	자바 문법으로 선언된 변수(상단 스크립틀릿 안에있는 변수num)를 
	EL 에서 사용하려면 JSTL 에서의 변수로 변환해야함 --%>
<%-- 	<h3>\${num } = ${num }</h3> <!-- num 값이 출력되지 않는다! --> --%>
	
	
	<%
	int num2 = 100;
	%>
	
	<c:set var="num2" value="<%=num %>" />
	<h3>\${num2 } = ${num2 }</h3>
	
	<hr>
	<%-- c:remove 태그를 사용하여 변수값 삭제
	(주의! c:set 태그에서 사용된 var 속성의 변수명만 지정) --%>
	<c:remove var="str" />
	<h3>\${str }값 삭제 후 = ${str }</h3>
	<h3>\${str }값이 비어있는가? ${empty str }</h3>
</body>
</html>