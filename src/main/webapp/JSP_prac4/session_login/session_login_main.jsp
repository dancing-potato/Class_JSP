<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String sId = (String)session.getAttribute("sId");
    %>
<!--     =>세션에 아이디 존재하지 않을 경우 null값이 저장됨 -->
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session_login_main</title>
</head>
<body>
	<div align="right">
		<%if(sId==null){%>
			<a href="session_login_form.jsp">로그인</a> | <a href="session_join_form.jsp">회원가입</a>
		<% } else {%>
			<%=sId %>님 | <a href="session_logout.jsp">로그아웃</a>
		<% }%>
	</div>
	<h1 align="center">메인화면</h1>
</body>
</html>