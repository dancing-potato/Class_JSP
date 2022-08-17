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
	<h1>글 목록</h1>
	<table border="1">
		<tr>
			<th width="50">번호</th>
			<th width="400">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
			<th width="100">조회수</th>
		</tr>
		<%
		// SELECT 구문을 사용하여 board 테이블의 모든 레코드 조회 후 테이블에 출력
		// DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
		String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
		String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
		String user = "root"; // 계정명
		String password = "1234"; // 패스워드
		
		// 1단계. 드라이버 클래스 로드
		Class.forName(driver);
		
		// 2단계. DB 연결
		// => 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
		Connection con = DriverManager.getConnection(url, user, password);
		
		// 3단계. SQL 구문 작성 및 전달
// 		String sql = "SELECT * FROM board";
		// 조회 시 글번호(idx)를 기준으로 내림차순 정렬 필요
		// => ORDER BY 절 필요
		// < 기본 문법 > SELECT 컬럼명 FROM 테이블명 [ORDER BY 컬럼명 정렬방식]
		// => ORDER BY 뒤의 정렬방식은 오름차순(ASC), 내림차순(DESC) 으로 지정하며
		//    복수개의 컬럼을 순서대로 정렬할 때 콤마(,)로 컬럼 구분
		// => 오름차순(0 -> 9, A -> Z, 가 -> 힣), 내림차순(9 -> 0, Z -> A, 힣 -> 가)
		String sql = "SELECT * FROM board ORDER BY idx DESC";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 4단계. SQL 구문 실행 및 결과 처리
		ResultSet rs = pstmt.executeQuery();
		
		// while 문을 사용하여 다음 레코드 존재(rs.next() 가 true)할 동안 반복
		while(rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("idx") %></td>
				<!-- 게시물 제목 클릭 시 content.jsp 페이지로 이동(글번호(idx)를 파라미터로 전달) -->
				<td><a href="content.jsp?idx=<%=rs.getInt("idx") %>"><%=rs.getString("subject") %></a></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getDate("date") %></td>
				<td><%=rs.getInt("readcount") %></td>
			</tr>
			<%
		}
		%> 
	</table>
	<div align="right">
		<input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'">
	</div>
</body>
</html>












