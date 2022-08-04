<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
 	request.setCharacterEncoding("UTF-8");
 
 	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
 	String name = request.getParameter("name");
 	
 	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	Class.forName(driver);
	
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql = "DELETE FROM student WHERE student_no=? AND name=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,studentNo);
	pstmt.setString(2, name);
	
	int count = pstmt.executeUpdate();
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro</title>
</head>
<body>
	<h1>학생 삭제 정보 출력</h1>
	<!-- 폼 파라미터 값 출력 -->
	<h3>학번 : <%=studentNo %></h3>
	<h3>이름 : <%=name %></h3>
	<hr>
	<h3>학생 정보 DB 삭제 완료 - <%=count %>개 레코드</h3>
</body>
</html>