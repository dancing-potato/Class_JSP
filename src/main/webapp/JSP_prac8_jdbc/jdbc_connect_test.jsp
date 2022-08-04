<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc_connect_test_create</title>
</head>
<body>
	
	<%
	//DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
	
	//1단계. JDBC 드라이버 클래스 로드
	Class.forName(driver);
	
	//2단계.DB연결 
	//=>연결 성공시 리턴되는 connection 타입 객체를 java.sql.Connection 타입으로 저장
	Connection con = DriverManager.getConnection(url, user, password);
	
	//3단계.SQL구문 작성 및 전달
	//1)SQL구문 작성 
	String sql = "CREATE TABLE test2 (idx INT,name VARCHAR(10))";
	//2)connection 객체(변수con)의 prepareStatement()메서드를 호출, sql구문전달
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	
	//4단계.SQL구문 실행 및 결과 처리 
	//=>CREATE, DROP, INSERT, DELETE 등을 실행하기 위해 executeUpdate()메소드 호출
	int count = pstmt.executeUpdate();
	%>
	
	<h3>SQL 구문 실행 완료! - <%=count %></h3>
	
	
	
</body>
</html>