<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTest2_remove2</title>
</head>
<body>
	<h1>sessionTest2_remove2.jsp</h1>
	
	<%
	
	session.removeAttribute("sessionValue2");
	response.sendRedirect("sessionTest2_get.jsp");
	
	%>
</body>
</html>