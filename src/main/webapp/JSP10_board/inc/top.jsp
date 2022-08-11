<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//세션 아이디("sId") 가져와서 id 변수에 저장
String sId = (String)session.getAttribute("sId"); //Object -> String
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>
</head>
<body>
	<div align="right">
<%-- 세션 아이디(sId) 가 없을 경우(= null) 로그인, 회원가입 링크 표시 --%>
<%-- 아니면, 로그인 된 아이디와 로그아웃 링크(member/logout.jsp) 표시 --%>
		<% if(sId == null){%>
			<a href="member/loginForm.jsp">로그인</a> | <a href="member/joinForm.jsp">회원가입</a>
		<% }else {%>
		<%=sId %> 님 | <a href="member/logout.jsp">로그아웃</a>
		
<%-- 만약, 로그인 된 아이디가 "admin" 일 경우 관리자 페이지(admin/admin_main.jsp) 링크 표시 --%>					
			<% if(sId.equals("admin")){%>
				| <a href="admin/admin_main.jsp">관리자 페이지</a>	
			<%} %>
		<%} %>
	</div>
	<div align="center">
		<a href="index.jsp">HOME</a> 상단메뉴1 상단메뉴2 상단메뉴3 상단메뉴4 상단메뉴5
	</div>
</body>
</html>















