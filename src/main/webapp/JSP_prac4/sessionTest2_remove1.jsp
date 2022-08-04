<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTest2_remove1</title>
</head>
<body>
	<h1>sessionTest2_remove1.jsp</h1>
	<%
	//세션값 삭제
	session.removeAttribute("sessionValue1");
	//삭제 후 포워딩(이동)
	response.sendRedirect("sessionTest2_get.jsp"); 
	
	
	%>



</body>
</html>