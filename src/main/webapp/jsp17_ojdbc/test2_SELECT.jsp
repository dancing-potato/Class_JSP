<%@page import="java.sql.ResultSet"%>
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
	System.out.println("드라이버 로드 성공!");
	
	// 2단계. DB 연결 후 Connection 객체 리턴받기
	Connection con = DriverManager.getConnection(url, user, password);
	
	out.println("<h3>Oracle DB 연결 성공!</h3>");
	System.out.println("Oracle DB 연결 성공!");
	out.println("<hr>");
	
	// test_ojdbc 테이블의 모든 레코드 조회하여 테이블에 표시
	String sql = "SELECT * FROM test_ojdbc";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	out.println("<table>");
	
	while(rs.next()) {
		out.println("<tr>");
			out.println("<td>");
			out.println(rs.getInt("idx"));
			out.println("</td>");
			
			out.println("<td>");
			out.println(rs.getString("name"));
			out.println("</td>");
		out.println("</tr>");
	}
	
	out.println("</table>");
	
	rs.close();
	pstmt.close();
	con.close();
	%>
</body>
</html>











