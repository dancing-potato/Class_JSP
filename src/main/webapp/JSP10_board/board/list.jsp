<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	request.setCharacterEncoding("UTF-8");

	String driver = "com.mysql.cj.jdbc.Driver";
	String url ="jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";

	Class.forName(driver);
	Connection con = DriverManager.getConnection(url, user, password);

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list/글목록</title>
</head>
<body>
	<h1 align="center">글 목록</h1>
	<table border="1">
		<tr>
			<th width="50">번호</th>
			<th width="400">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>
		<%
// 		String sql = "SELECT * FROM board";
// 		조회시 글번호(idx)를 기준으로 내림차순(9->1) 정렬 필요
//		=>ORDER BY 절 필요

//		<기본문법> SELECT 컬럼명 FROM 테이블명 [ORDER BY 컬럼명 정렬방식][WHERE절]
//		=>정렬방식은 오름차순(ASC), 내림차순(DESC) 으로 지정
//		복수개의 컬럼을 순서대로 정렬할 때 콤마(,)로 컬럼 구분
//		=>오름차순(0->9, A->Z, 가->힣), 내림차순(9->0, Z->A, 힣->가)
		String sql = "SELECT * FROM board ORDER BY idx DESC";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();

// 		while문을 사용하여 다음 레코드 존재(rs.next()가 true)할 동안 반복
		while(rs.next()){		
		%>
		<tr>
			<td><%=rs.getInt("idx") %></td>
<!-- 게시물 제목 클릭 시 content.jsp페이지로 이동(글번호(idx)를 파라미터로 전달) -->
			<td><a href="content.jsp?idx=<%=rs.getInt("idx")%>"><%=rs.getString("subject") %></a></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getDate("date") %></td>
			<td><%=rs.getInt("readCount") %></td>
		</tr>	
		<%} %>
		
	</table>
	<div align="right">
		<input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'">
	</div>
</body>
</html>