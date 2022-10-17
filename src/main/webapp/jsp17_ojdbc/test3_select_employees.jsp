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
	<table border="1">
		<tr>
			<th>EMPLOYEE_ID</th>
			<th>FIRST_NAME</th>
			<th>LAST_NAME</th>
			<th>EMAIL</th>
			<th>HIRE_DATE</th>
			<th></th>
		</tr>
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
	
	// employees 테이블의 모든 레코드 조회하여 테이블에 표시
	String sql = "SELECT * FROM employees";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		out.println("<tr>");
			out.println("<td>" + rs.getString("EMPLOYEE_ID") + "</td>");
			out.println("<td>" + rs.getString("FIRST_NAME") + "</td>");
			out.println("<td>" + rs.getString("LAST_NAME") + "</td>");
			out.println("<td>" + rs.getString("EMAIL") + "</td>");
			out.println("<td>" + rs.getDate("HIRE_DATE") + "</td>");
			// DETAIL 버튼 생성 및 test3_select_employee_detail.jsp 페이지로 포워딩
			// => URL 파라미터로 EMPLOYEE_ID 파라미터 전달
			out.println("<td><input type='button' value='DETAIL' onclick='location.href=\"test3_select_employee_detail.jsp?employee_id=" + rs.getString("employee_id") + "\"'></td>");
			%>
<%-- 			<td><input type="button" value="DETAIL" onclick="location.href='test3_select_employee_detail.jsp?employee_id=<%=rs.getString("employee_id")%>'"></td> --%>
			<%
		out.println("</tr>");
	}
	
	rs.close();
	pstmt.close();
	con.close();
	%>
	</table>
</body>
</html>









