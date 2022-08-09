<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
// updateForm.jsp 페이지로부터 전달받은 파라미터(글번호, 작성자(선택), 패스워드, 제목, 내용) 가져오기
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx")); // 글번호
// String name = request.getParameter("name"); // 작성자(수정 대상에서 제외)
	String passwd = request.getParameter("passwd"); // 패스워드
	String subject = request.getParameter("subject"); // 제목
	String content = request.getParameter("content"); // 내용
// out.println(idx + ", " + name + ", " + passwd + ", " + subject + ", " + content);

// 글번호(idx)가 일치하고 패스워드(passwd)도 일치하는 레코드(게시물)의
// 제목과 내용을 수정(UPDATE)
// => 수정 결과를 updateCount 에 리턴받기
//    1) 성공 시 게시물 상세 정보 조회(content.jsp)로 포워딩
//    2) 실패 시 자바스크립트를 사용하여 "글 수정 실패!" 출력 후 이전 페이지로 돌아가기

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
// => idx 와 passwd 가 일치하는 레코드의 subject, content 수정(UPDATE)
	String sql = "UPDATE board SET subject=?,content=? WHERE idx=? AND passwd=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, subject);
	pstmt.setString(2, content);
	pstmt.setInt(3, idx);
	pstmt.setString(4, passwd);

// 4단계. SQL 구문 실행 및 결과 처리
	int updateCount = pstmt.executeUpdate();

	if(updateCount > 0) { // 수정 성공 시
	// content.jsp 페이지로 포워딩 => URL 파라미터로 글번호(idx) 전달
		response.sendRedirect("content.jsp?idx=" + idx);
	} else { // 수정 실패 시
	%>
		<script>
			alert("글 수정 실패!");
			history.back();
		</script>
	<%
}
%> 