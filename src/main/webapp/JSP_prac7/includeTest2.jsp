<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//현재페이지(includeTest2.jsp) 는 includeTest.jsp 페이지에 포함(삽입)될 페이지이며
//include 액션 태그에서 param 태그로 전달한 파라미터 가져와서 사용도 가능함
String paramValue = request.getParameter("paramValue");

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest2</title>
</head>
<body>
	<h1>includeTest2.jsp</h1>
	<h3>include 액션 태그에 의해 포함되는 페이지입니다.</h3>
	<h3>전달받은 파라미터값 : <%=paramValue %></h3>
</body>
</html>