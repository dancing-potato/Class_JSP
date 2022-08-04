<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션1</title>
</head>
<body>
	<h1>sessionTest1.jsp</h1>
	
	<h3>새 세션 여부: <%=session.isNew() %></h3>
	<h3>세션 ID : <%=session.getId() %></h3>
	<h3>세션 생성 시각 : <%=new Date(session.getCreationTime()) %></h3>
	<h3>마지막 세션 접근 시각 : <%=new Date(session.getLastAccessedTime()) %></h3>
	
	<h3>현재 세션 유지시간 : <%=session.getMaxInactiveInterval() %>초</h3>
	<hr>
<!-- 	세션 유지시간을 10초로 변경 -->
	<%session.setMaxInactiveInterval(10);%>
	<h3>현재 세션 유지시간 :  <%=session.getMaxInactiveInterval() %>초</h3>
	
	<hr>
<!-- 	세션 초기화(=세션 객체에 저장된 모든 값을 삭제) -->
	<%session.invalidate(); %>
</body>
</html>