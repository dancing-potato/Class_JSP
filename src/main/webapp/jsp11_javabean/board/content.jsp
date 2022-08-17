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
	<%
	// 파라미터 중 글번호(idx)가 없을 경우(= null)
	// 자바스크립트를 사용하여 "잘못된 접근입니다!" 출력 후 메인페이지(index.jsp)로 돌아가기
	if(request.getParameter("idx") == null) {
		%>
		<script>
			alert("잘못된 접근입니다!");
			location.href = "../index.jsp";
		</script>
		<%
	}
	%>
	<h1>글 상세내용 보기</h1>
	<%
	// 글번호(idx 파라미터) 가져와서 변수에 저장
	int idx = Integer.parseInt(request.getParameter("idx")); // String -> int 변환
	
	// 글번호에 해당하는 레코드 조회 후 조회 성공 시 테이블을 통해 게시물 상세 정보 출력
	// => 글번호, 작성자, 제목, 내용, 작성일, 조회수
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
	// 게시물 조회 전 조회수(readcount)증가 작업(+1) 수행
	String sql = "UPDATE board SET readcount=readcount+1 WHERE idx=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	
	pstmt.executeUpdate();	
	
	// => idx 가 일치하는 레코드 조회
	sql = "SELECT * FROM board WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	
	// 4단계. SQL 구문 실행 및 결과 처리
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()) { // 조회 결과가 존재할 경우
		%>
		<table border="1">
			<tr>
				<th width="100">글번호</th><td width="100"><%=idx %></td>
				<th width="100">작성자</th><td width="150"><%=rs.getString("name") %></td>
				<th width="100">작성일</th><td width="150"><%=rs.getDate("date") %></td>
			</tr>
			<tr>
				<th>제목</th><td colspan="3"><%=rs.getString("subject") %></td>
				<th>조회수</th><td><%=rs.getInt("readcount") %></td>
			</tr>
			<tr>
				<th>내용</th><td colspan="5"><%=rs.getString("content") %></td>
			</tr>
			<tr>
				<td colspan="6" align="right">
					<!-- 수정(updateForm.jsp), 삭제(deleteForm.jsp) 이동(파라미터 : 글번호) -->
					<input type="button" value="수정" onclick="location.href='updateForm.jsp?idx=<%=idx%>'">
					<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?idx=<%=idx%>'">
					<input type="button" value="목록" onclick="location.href='list.jsp'">
				</td>
			</tr>
		</table>
		<%
	}
	%>
	
</body>
</html>












