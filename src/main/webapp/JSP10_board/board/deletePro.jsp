<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//out.println(request.getParameter("idx") + ", " + request.getParameter("passwd"));
//DELETE 구문을 사용하여 글번호(idx)와 패스워드(passwd)가 일치하는 게시물 삭제
//삭제성공시 글목록(list.jsp)로 이동하고
//삭제 실패 시(패스워드 틀림 등) 자바스크립트를 사용하여 "글 삭제 실패!" 출력 후 이전페이지로 돌아간다
int idx = Integer.parseInt(request.getParameter("idx"));
String passwd = request.getParameter("passwd");

//0. DB 연결에 필요한 문자열 4개 저장
String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/study_jsp3";
String user = "root";
String password = "1234";

//1단계. 드라이버 클래스 로드
Class.forName(driver);

//2단계. DB 연결
Connection con = DriverManager.getConnection(url, user, password);

//3단계. SQL 구문 작성 및 전달
// 방법이 두가지가 있다.
//=> 1) 번호(idx)와 패스워드(passwd)가 모두 일치하는 게시물 삭제(DELETE) - 사용할 방법
//=> 2) 번호(idx)가 일치하는 레코드를 검색(SELECT)하여 
//    존재할 경우 패스워드(passwd)를 검사하여 일치하면 삭제(DELETE)

//이건 1번방법
// String sql = "DELETE FROM board WHERE idx=? AND passwd=?";
// PreparedStatement pstmt = con.prepareStatement(sql);
// pstmt.setInt(1, idx);
// pstmt.setString(2, passwd);

// int deleteCount = pstmt.executeUpdate();
//deleteCount 가 0보다 크면 성공, 아니면 실패
// if(deleteCount > 0){
	// 성공 시 자바스크립트 사용하여 
	// "게시물 삭제 성공!" 출력 후 글목록(list.jsp)으로 포워딩
	%>
	<script>
// 		alert("게시물 삭제 성공!");
// 		location.href="list.jsp";
	</script>
	<% 
// 	} else {
	// 실패 시 자바스크립트 사용하여 "게시물 삭제 실패!" 출력 후 
	// 이전 페이지로 돌아가기
	%>
	<script>
// 	alert("글 삭제 실패!");
// 	history.back();
	</script>

	<% 
// 	}
// ============================================================
// 2번 방법!!!!
// 2) 번호(idx)가 일치하는 레코드의 패스워드를 검색(SELECT)하여 
//    존재할 경우 패스워드(passwd)를 일치 여부 검사하여 일치하면 삭제(DELETE)할 경우

String sql = "SELECT passwd FROM board WHERE idx=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);

// 4단계. SQL 구문 실행 및 결과 처리
ResultSet rs = pstmt.executeQuery();

// 조회 결과(패스워드)가 존재할 경우 패스워드 비교 작업 수행
if(rs.next()) { // 번호가 일치하는 패스워드 존재할 경우
	// 조회된 패스워드와 입력받은 패스워드를 비교
	if(passwd.equals(rs.getString("passwd"))) { // 패스워드가 일치할 경우
		// 글번호(idx)에 해당하는 레코드(게시물) 삭제(DELETE)
		sql = "DELETE FROM board WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		int deleteCount = pstmt.executeUpdate();
		// deleteCount 가 0보다 크면 삭제 성공, 아니면 삭제 실패(시스템 상의 오류) => 옵션
		if(deleteCount > 0) { // 삭제 성공 시
			// 자바 코드를 사용하여 글목록(list.jsp)으로 포워딩
			response.sendRedirect("list.jsp");
		} else { // 삭제 실패 시
			%>
			<script>
				alert("게시물 삭제 실패!");
				history.back();
			</script>
			<%
		}
		
	} else { // 패스워드가 일치하지 않을 경우
		%>
		<script>
			alert("패스워드 틀림!");
			history.back();
		</script>
		<%
	}
} else { // 잘못된 번호가 전달되어 패스워드가 존재하지 않을 경우(옵션)
	%>
	<script>
		alert("잘못된 접근입니다!");
		location.href = "../index.jsp";
	</script>
	<%
}
%>


