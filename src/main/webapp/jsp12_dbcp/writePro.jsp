<%@page import="jsp12_dbcp.BoardDTO"%>
<%@page import="jsp12_dbcp.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// POST 방식 요청에 대한 한글 처리
request.setCharacterEncoding("UTF-8");

// writeForm.jsp 페이지로부터 전달받은 폼파라미터(작성자, 비밀번호, 제목, 내용)를 가져와서
// 변수에 저장한 후 출력하기
String name = request.getParameter("name");
String passwd = request.getParameter("passwd");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

//데이터베이스 작업 수행을 위해 BoardDAO 클래스 인스턴스 생성

BoardDAO dao = new BoardDAO();

//BoardDAO 객체의 insert() 메서드를 호출하여 글쓰기 작업 수행 => 메서드에 변수를 직접 전달할 경우
//=> 파라미터 : 게시물 정보(작성자, 패스워드, 글제목, 글내용)

// dao.insert(name, passwd, subject, content);

// DTO객체를 활용하여 변수를 저장 한 후 DTO객체를 파라미터로 전달할 경우
// => 파라미터 : 게시물 정보(BoardDTO 객체)
//1) BoardDTO클래스의 인스턴스(객체) 생성

BoardDTO board = new BoardDTO();

//2) BoardDTO 객체의 Setter메서드를 호출하여 각 게시물 정보를 멤버변수에 저장
board.setName(name);
board.setPasswd(passwd);
board.setSubject(subject);
board.setContent(content);

//3)BoardDTO 객체의 insert()메서드를 호출하여 글쓰기 작업 수행
// => 파라미터 : 게시물 정보(BoardDTO 객체) , 리턴타입 : int(insertCount)
int insertCount = dao.insert(board);


if(insertCount > 0) { // 글쓰기 성공 시
	response.sendRedirect("list.jsp");
} else { // 실패 시
	%>
	<script>
		alert("글쓰기 실패!");
		history.back();
	</script>
	<%
}

%>


















