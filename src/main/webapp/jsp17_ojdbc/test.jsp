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
	/*
	[ JDBC 를 활용한 Oracle DB 접속 ]
	- Oracle JDBC(OJDBC) 라이브러리 활용
	- 기본적인 표준 쿼리만 사용한다고 가정했을 때 MySQL 과 1단계&2단계 정보만 다름
	  (접근 방법은 동일 = JDBC 는 공통된 방법으로 DB 에 접근할 수 있도록 도와줌)
	
	1단계. 드라이버 로드
	- oracle.jdbc.OracleDriver 클래스 필요
	  => ojdbc8.jar(JDK 8 일 경우) 라이브러리 Build Path 추가 필수!
	  => JDK 11 부터는 ojdbc11.jar 라이브러리 사용
	
	2단계. DB 연결
	- MySQL 의 경우 "jdbc:mysql://DB주소:포트번호/DB명"
	  => 기본 서비스 포트 : 3306번
	- Oracle 의 경우 "jdbc:oracle:thin:@DB주소:포트번호:DB명"
	  => 기본 서비스 포트 : 1521번
	*/
	
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
	
	// orcl 데이터베이스에 test_ojdbc 테이블 생성
	// => 컬럼 : idx(번호) - 정수 8자리(NUMBER(8)), name - 이름(VARCHAR2(10))
	String sql = "CREATE TABLE test_ojdbc (idx NUMBER(8), name VARCHAR2(10))";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	out.println("<h3>SQL 구문 실행 성공!</h3>");
	%>
</body>
</html>











