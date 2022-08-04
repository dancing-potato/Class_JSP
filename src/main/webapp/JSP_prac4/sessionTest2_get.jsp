<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionTest2_get</title>
</head>
<body>
	<h1>sessionTest2_get.jsp</h1>
	<h3>세션에 저장된 값 : <%=session.getAttribute("sessionValue1") %></h3>
	<h3>세션에 저장된 값 : <%=session.getAttribute("sessionValue2") %></h3>
	<!--
	sessionTest2_set.jsp 페이지에서 설정한 세션값은 현재 페이지에서도 표시되지만
	단, 웹브라우저를 완전히 종료한 후 다시 요청하거나, 타이머(기본 30분)가 만료되거나
	또는 invalidate() 메서드를 호출하게 되면 저장되어 있는 세션값은 제거됨(= 접근 불가능)
	-->
	<hr>
	<h3><a href="sessionTest2.jsp">돌아가기</a></h3>
</body>
</html>