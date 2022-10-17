<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EMPLOYEE DETAIL</h1>
	<table border="1">
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
	String sql = "SELECT * FROM employees WHERE employee_id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("employee_id"));
	
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
	%>
		<tr>
			<th>EMPLOYEE_ID</th>
			<td><%=rs.getInt("EMPLOYEE_ID") %></td>
			<th>FIRST_NAME</th>
			<td><%=rs.getString("FIRST_NAME") %></td>
			<th>LAST_NAME</th>
			<td><%=rs.getString("LAST_NAME") %></td>
		</tr>
		<tr>
			<th>EMAIL</th>
			<td><%=rs.getString("EMAIL") %></td>
			<th>PHONE_NUMBER</th>
			<td><%=rs.getString("PHONE_NUMBER") %></td>
			<th>HIRE_DATE</th>
			<td><%=rs.getDate("HIRE_DATE") %></td>
		</tr>
		<tr>
			<th>JOB_ID</th>
			<td><%=rs.getString("JOB_ID") %></td>
			<th>SALARY</th>
			<td><%=rs.getDouble("SALARY") %></td>
			<th>COMMISION_PCT</th>
			<td><%=rs.getDouble("COMMISSION_PCT") %></td>
		</tr>
		<tr>
			<th>MANAGER_ID</th>
			<td><%=rs.getInt("MANAGER_ID") %></td>
			<th>DEPARTMENT_ID</th>
			<td><%=rs.getInt("DEPARTMENT_ID") %></td>
			<td colspan="2">
		</tr>
	<%		
	}
	
	rs.close();
	pstmt.close();
	con.close();
	%>
	</table>
	<input type="button" value="BACK" onclick="history.back()">
</body>
</html>











