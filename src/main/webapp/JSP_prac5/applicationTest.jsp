<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>applicationTest</title>
</head>
<body>
	<h1>applicationTest.jsp</h1>
	
	<h3>서버 정보 : <%=application.getServerInfo() %></h3>
	<h3>서버 물리적 경로 정보 : <%=application.getRealPath("/") %></h3>
	<h3>서버 컨텍스트 경로 정보 : <%=application.getContextPath() %></h3>
</body>
</html>