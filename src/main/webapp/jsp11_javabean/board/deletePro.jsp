<%@page import="jsp11_javabean.BoardDAO"%>
<%@page import="jsp11_javabean.BoardDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
	// DELETE 구문을 사용하여 글번호(idx) 와 패스워드(passwd) 가 일치하는 게시물 삭제 후
	// 삭제 성공 시 글목록(list.jsp) 으로 이동하고
	// 삭제 실패 시(패스워드 틀림 등) 자바스크립트를 사용하여 "글 삭제 실패!" 출력 후 이전페이지로 돌아가기
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passwd = request.getParameter("passwd");
	// out.println("번호 : " + idx + ", 패스워드 : " + passwd);
	
	
	//가져온 폼 파라미터 데이터를 BoardDTO 객체를 생성하여 저장하기
	BoardDTO board = new BoardDTO();
	
	//변수에 저장안할거면 위에 그대로 가져와서 
	//board.setIdx(Integer.parseInt(request.getParameter("idx")))
	//board.setPasswd(request.getParameter("passwd"))로도 쓸수있음
	board.setIdx(idx);
	board.setPasswd(passwd);
	
	//데이터베이스 작업 수행을 위한 BoardDAO 클래스 객체(dao)를 생성하기
	BoardDAO dao = new BoardDAO();
	
	//BoardDAO 객체의 delete()메서드를 호출해 글삭제 작업 수행
	//=>파라미터: 삭제할 게시물 정보(BoardDTO 객체 - board) 리턴타입 : int(deleteCount)
	int deleteCount = dao.delete(board);
	
	// int deleteCount = pstmt.executeUpdate();
	
	// deleteCount 가 0보다 크면 성공, 아니면 실패
	if(deleteCount > 0) {
		// 성공 시 자바스크립트 사용하여 "게시물 삭제 성공!" 출력 후 글목록(list.jsp)으로 포워딩
		%>
		<script>
			alert("게시물 삭제 성공!");
			location.href = "list.jsp";
		</script>
		<%
	} else {
		// 실패 시 자바스크립트 사용하여 "게시물 삭제 실패!" 출력 후 이전 페이지로 돌아가기
		%>
		<script>
			alert("게시물 삭제 실패!");
			history.back();
		</script>
		<%
	}
	
	%>



















