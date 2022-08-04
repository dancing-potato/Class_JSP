<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attributeTest1</title>
</head>
<body>
	<h1>attributeTest1.jsp</h1>
	
	<%
// 각 영역 객체에 값을 저장 => setAttribute(String key, Object value) 메서드 사용	
	pageContext.setAttribute("pageContext", "pageContext value");
	request.setAttribute("requestValue", "request value");
	session.setAttribute("sessionValue", "session value");
	application.setAttribute("applicationValue", "application value");
	
	%>
<!-- 각 영역 객체에 저장된 값을 가져오기 => Object getAttribute(String key) 메서드 사용 -->
	<h3>pageContext 객체 값 : <%=pageContext.getAttribute("pageContext") %></h3>
	<h3>request 객체 값 : <%=request.getAttribute("requestValue") %></h3>
	<h3>session 객체 값 : <%=session.getAttribute("sessionValue") %></h3>
	<h3>application 객체 값 : <%=application.getAttribute("applicationValue") %></h3>
	
	<%
// pageContext 객체의 forward() 메서드를 호출하여 "attributeTest2.jsp" 페이지로 이동
// => request 객체를 다음페이지까지 유지(= 공유)하기 위해서 Dispatcher 방식으로 포워딩
	pageContext.forward("attributeTest2.jsp");
	%>
	
	
</body>
</html>