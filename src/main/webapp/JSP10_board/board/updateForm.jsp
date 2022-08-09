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
<title>updateForm</title>
</head>
<body>
	<%
	//파라미터 중 글번호(idx)가 없을 경우(=null)
	//자바스크립트를 사용하여 "잘못된 접근입니다!" 출력 후 메인페이지(index.jsp)로 돌아가기
	if(request.getParameter("idx") == null){
		%>
		<script>
		alert("잘못된 접근입니다!");
		location.href="../index.jsp";
		</script>	
	<% }
	
// 글수정(updateForm.jsp) 페이지는 글번호(idx)에 해당하는 게시물 조회(SELECT) 후
// 작성자, 패스워드, 제목, 내용 항목 중
// 작성자(편집불가)를 제외한 제목과 내용은 입력(편집) 가능하도록 표시
// 단, 패스워드는 입력창만 놔두고 기존 패스워드를 표시하지 않도록 주의!
// => 수정 버튼 클릭 시 제목, 내용, 패스워드 입력항목과 함께 글번호도 updatePro.jsp 로 전달하여
//    글번호에 해당하는 레코드(게시물)의 패스워드를 조회 후 비교하여
//    일치할 경우 제목과 내용을 수정(UPDATE)
// 글번호(idx 파라미터) 가져와서 변수에 저장
	
	int idx = Integer.parseInt(request.getParameter("idx")); // String -> int 변환
// 글번호에 해당하는 레코드 조회 후 조회 성공 시 테이블을 통해 게시물 상세 정보 출력
// => 글번호, 작성자, 제목, 내용, 작성일, 조회수
// DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장	
	String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
	String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
	String user = "root"; // 계정명
	String password = "1234"; // 패스워드
	
	Class.forName(driver);
	
	Connection con = DriverManager.getConnection(url, user, password);
	
// => idx 가 일치하는 레코드 조회
	String sql = "SELECT * FROM board WHERE idx=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);		
	
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()) {
		%>
	<h1>글 수정</h1>
	<form action="updatePro.jsp" method="post">
			<!-- 게시물 수정에 필요한 글번호(idx) 를 "hidden" 타입으로 전달 -->
			<input type="hidden" name="idx" value="<%=idx %>">
			<table border="1">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" value="<%=rs.getString("name")%>" readonly="readonly" required="required" ></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" required="required"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="<%=rs.getString("subject")%>" required="required"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="10" cols="20" required="required"><%=rs.getString("content")%></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="reset" value="초기화">
						<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
		
		<%
	} else { // 글번호에 해당하는 게시물이 존재하지 않을 경우
		%>
		<script>
			alert("잘못된 접근입니다!");
			location.href = "../index.jsp";
		</script>
		<%
	}
	%>
</body>
</html>