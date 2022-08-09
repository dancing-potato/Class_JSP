<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<!-- ========= inc/top.jsp 페이지 포함시키기 ========== -->
	<jsp:include page="inc/top.jsp"></jsp:include>
	<!-- ============================================= -->
	<h1 align="center">메인페이지</h1>
	<hr>
	<!-- 하위폴더인 board폴더 내의 writeForm.jsp페이지,list.jsp페이지 링크 -->
	<h1><a href="board/writeForm.jsp">글쓰기</a></h1>
	<h1><a href="board/list.jsp">글목록</a></h1>
</body>
</html>