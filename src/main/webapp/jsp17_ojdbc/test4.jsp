<%@page import="java.sql.ResultSetMetaData"%>
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
	<h1>test4</h1>
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
	
	// test_ojdbc 테이블의 모든 레코드 조회하여 테이블에 표시
	String sql = "SELECT * FROM employees";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	// 데이터베이스 조회 결과에 대한 대상의 부가 정보(DB 또는 테이블 정보)에 접근하기 위해서는
	// DB 의 경우 Connection 객체의 getMetaData() 메서드를 호출하여 DataBaseMetaData 객체 리턴받고,
	// 테이블의 경우 ResultSet 객체의 getMetaData() 메서드를 통해 ResultSetMetaData 객체 리턴받음
	ResultSetMetaData rsmd = rs.getMetaData();
	%>
	<h3>employees 테이블 컬럼 갯수 : <%=rsmd.getColumnCount() %></h3>
	<hr>
	<%
	// 일반 for문을 사용하여 1 ~ 컬럼갯수까지 1씩 증가하면서 반복
	for(int i = 1; i <= rsmd.getColumnCount(); i++) {
		// 컬럼명 : getColumnLabel()
		// 컬럼 데이터타입 : getColumnTypeName()
		out.println(rsmd.getColumnLabel(i) + " : " + rsmd.getColumnTypeName(i) + " - " + rsmd.getColumnDisplaySize(i) + "<br>");
	}
	
	rs.close();
	pstmt.close();
	con.close();
	%>
	
</body>
</html>






















