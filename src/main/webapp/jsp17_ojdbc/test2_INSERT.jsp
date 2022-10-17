<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test.jsp - OJDBC</h1>
	<%
	// DB 접속에 필요한 문자열 설정
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@192.168.3.127:1521:orcl";
	String user = "hr";
	String password = "hr";
	
	// 1단계. 드라이버 클래스 로드
	Class.forName(driver);
	
	// 2단계. DB 연결 후 Connection 객체 리턴받기
	Connection con = DriverManager.getConnection(url, user, password);
	
	out.println("<h3>Oracle DB 연결 성공!</h3>");
	out.println("<hr>");
	
	// test_ojdbc 테이블에 레코드 추가(INSERT)
	int idx = 3;
	String name = "Admin";
	
	String sql = "INSERT INTO test_ojdbc VALUES (?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	pstmt.setString(2, name);
	int count = pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	out.println("<h3>SQL 구문 실행 성공! - " + count + "개 레코드</h3>");
	%>
</body>
</html>











