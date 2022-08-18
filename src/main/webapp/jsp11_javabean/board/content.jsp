<%@page import="jsp11_javabean.BoardDTO"%>
<%@page import="jsp11_javabean.BoardDAO"%>
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
	
	// 데이터베이스 작업을 수행할 BoardDAO 객체 생성
	BoardDAO dao = new BoardDAO();
	
	
	// 게시물 상세정보 조회를 수행할 BoardDAO객체의 selectContent() 메서드 호출
	// => 파라미터 : 글번호(idx)  리턴타입 : BoardDTO 객체(board)
	BoardDTO board = dao.selectContent(idx); 
	
	
	if(board != null) { // 조회 결과가 존재할 경우
		// 게시물 조회 수 증가 작업을 수행 할 BoardDAO 객체의 updateReadcount()메서드 호출
		// => 파라미터 : 글번호(idx) 리턴타입 : void
		dao.updateReadcount(idx);
		
		
		// 이미 조회수(readcount)는 저장되어있는 상태에서 조회수를 증가하므로
		// 기존에 조회한 조회수 +1 을 수행해야 정상적인 조회수가 반영됨
		// 만약,아예 dao.updateReadcount(idx);를 39행 객체부른거밑에 넣으면 굳이 이 과정 안넣어도됨
		board.setReadcount(board.getReadcount() + 1);
		%>
		<!-- 조회 결과 (게시물 상세정보)를 테이블에 출력 -->
		<table border="1">
			<tr>
				<th width="100">글번호</th><td width="100"><%=idx %></td>
				<th width="100">작성자</th><td width="150"><%=board.getName()%></td>
				<th width="100">작성일</th><td width="150"><%=board.getDate() %></td>
			</tr>
			<tr>
				<th>제목</th><td colspan="3"><%=board.getSubject() %></td>
				<th>조회수</th><td><%=board.getReadcount() %></td>
			</tr>
			<tr>
				<th>내용</th><td colspan="5"><%=board.getContent() %></td>
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
	} else {
		%>
		<script>
			alert("게시물 상세정보 조회 실패!");
			history.back();
		</script>
		<% 
	}
	%>
	
</body>
</html>












