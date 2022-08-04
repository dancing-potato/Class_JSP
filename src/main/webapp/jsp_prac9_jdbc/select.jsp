<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String url ="jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";


	Class.forName(driver);
	Connection con = DriverManager.getConnection(url, user, password);
	
	String sql = "SELECT * FROM student";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select</title>
</head>
<body>
	<h1>학생 목록 조회</h1>
	<!-- 학생 목록을 표시하기 위한 테이블 생성(제목열까지만 표시) -->
	<table border="1">
		<tr>
			<th width="100">학번</th>
			<th width="150">이름</th>
			<th width="250">E-Mail</th>
			<th width="200">전화번호</th>
			<th width="100"></th>
		</tr>
		<!-- while문을 사용해 Resultset객체에 대해 반복하면서 tr td태그를 통해 데이터 출력 -->
				<%
					while(rs.next()){
						int studentNo = rs.getInt("student_no");
						String name = rs.getString("name");
						String email = rs.getString("email");
						String phone = rs.getString("phone");
				%>
				
				<tr>
				<td><%=studentNo %></td>
				<td><%=name%></td>
				<td><%=email %></td>
				<td><%=phone %></td>
				<!-- 한 명 학생의 상세정보 조회를 위한 버튼생성 -->
				<!-- 클릭 시 select_student_info.jsp 페이지로 이동(파라미터로 학번 전달) -->
				<td><button onclick="location.href='select_student_info.jsp?studentNo=<%=studentNo%>'">상세정보</button></td>
				</tr>
			<%} %>
		
	</table>
</body>
</html>