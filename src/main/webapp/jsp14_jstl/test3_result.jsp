<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test3_result.jsp</h1>
	<%-- 자바에서 가장 많이 사용하는 문장에 대한 JSTL 문법(조건문, 반복문 등) --%>
	<%-- 변수 num2 선언 및 10으로 초기화 --%>
	<c:set var="num2" value="10" />
	
	<%-- EL 을 사용하여 파라미터 name, num 및 변수 num2 값 출력 --%>
	<h3>파라미터 name = ${param.name }, 파라미터 num = ${param.num }</h3>
	<h3>변수 num2 : ${num2 }</h3>
	<hr>
	
	<%-- ============================================================ --%>
	<%--
	[ 조건문 - if문 ]
	- c:if 태그 : if문에 해당하는 커스텀 태그(단일 if문과 동일 - else 문 없음)
	- 주의! 조건식에 들어갈 문장도 EL 을 사용하여 표기
	
	<c:if test="조건식">
		// 조건식 판별 결과가 true 일 때 실행할 문장들...
	</c:if>
	--%>
	
	<%-- param.num 값이 0 보다 큰가? --%>
	<c:if test="${param.num gt 0 }">
		<%-- if 문 판별 결과가 true 일 때 실행할 태그를 기술하는 공간(c:if 시작태그와 끝 태그 사이에 위치) --%>
		<h3>\${param.num } 이 0보다 크다!</h3>
		<h3>그러므로 이 태그는 현재페이지에서 출력된다!</h3>
	</c:if>
	<hr>	
	
	<%--
	<c:choose> <c:when> <c:otherwise> 태그
		- if ~ else 문 또는 if ~ else if ~ else 문에 해당하는 커스텀 태그
		- <c:choose> 태그를 사용하여 조건문이라는 표시를 달고
		  <c:when> 태그를 사용하여 조건식을 지정(복수개 사용 시 else if 문이 됨)하고
		  <c:otherwise> 태그를 사용하여 조건식 판별 결과가 false 일 때 수행할 문장을 기술(= else 문과 동일)
	  
	<c:choose>
		<c:when test="조건식1">
			// 조건식1 이 true 일 때 실행할 문장들...
		</c:when>
		<c:when test="조건식2">
			// 조건식2 가 true 일 때 실행할 문장들...
		</c:when>
		<c:otherwise>
			// 조건식이 모두 false 일 때 실행할 문장들...(= else 문) => 생략 가능
		</c:otherwise>
	</c:choose>
	--%>
	<%-- 변수 num3 에 대해 양수, 음수, 0 판별 --%>
	<c:set var="num3" value="5" />
	<c:choose>
		<c:when test="${num3 gt 0 }">
			<h3>num3(${num3 }) : 양수!</h3>		
		</c:when>
		<c:when test="${num3 lt 0 }">
			<h3>num3(${num3 }) : 음수!</h3>
		</c:when>
		<c:otherwise><%-- 위의 모든 조건이 false 일 때(else 문과 같으므로 조건 불필요) --%>
			<h3>num3(${num3 }) : 양수도 아니고 음수도 아니다!</h3>
		</c:otherwise>
	</c:choose>
	<hr>	
	<%-- 
	
	파라미터 name 값에 대해 "홍길동", "이순신", 비어있을 경우, 그 외 나머지 판별
	=> "홍길동" 일 경우 "홍길동입니다!" 출력, "이순신" 일 경우 "이순신입니다!" 출력
	=> 비어있을 경우 자바스크립트를 사용하여 "이름 입력 필수!" 출력 후 이전 페이지로 돌아가기
	=> 그 외 나머지는 "그 외 나머지" 출력
	
	--%>
	<c:choose>
	<%-- 주의! 큰따옴표 내에서 문자열 비교 시 작은따옴표 사용 필요 --%>
		<c:when test="${param.name eq '홍길동' }">
			<h3>홍길동입니다!</h3>
		</c:when>
		<c:when test="${param.name eq '이순신' }">
			<h3>이순신입니다!</h3>
		</c:when>
		<c:when test="${empty param.name }">
<!-- 			<h3>이름 입력 필수!</h3> -->
			<script>
				alert("이름 입력 필수!");
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			<h3>그 외 나머지!</h3>		
		</c:otherwise>
	</c:choose>
	
</body>
</html>