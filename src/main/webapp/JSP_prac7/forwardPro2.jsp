<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardPro2</title>
</head>
<body>
	
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String jumin = request.getParameter("jumin");
	String name = request.getParameter("name");
	
	String num = request.getParameter("num");
	String str = request.getParameter("str");
	
	%>
	
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>주민번호 : <%=jumin %></h3>
	<h3>이름 : <%=name %></h3>
	<hr>
	<h3>num : <%=num %></h3>
	<h3>str : <%=str %></h3>
	
</body>
</html>