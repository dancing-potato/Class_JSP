<%@page import="jsp11_javabean.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
		// 데이터베이스 작업 수행을 위한 BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
		
		// 데이터베이스 조회작업을 수행하기 위해 BoardDAO객체의 select()메서드 호출
		// =>파라미터 : 없음   리턴타입 : java.util.ArrayList(boardList)
		ArrayList boardList = dao.select();
		
		// for문을 사용하여 ArrayList 객체 크기만큼 반복
		for(int i = 0; i < boardList.size(); i++){
			// ArrayList 객체의 get(index) 메서드를 호출하여 ArrayList 객체 내의 데이터 꺼내기
			// 주의! 데이터 저장 시 BoardDTO -> Object 업캐스팅이 일어났으므로
			// 데이터를 꺼내는 시점에서 리턴타입도 Object 타입이다!
 			// Object o = boardList.get(i);
			// 주의! 업캐스팅 된 객체는 상속받은 멤버(공통 멤버)에만 접근 가능
			// int idx = o.getIdx(); // BoardDTO 객체의 getter 호출 불가능! 
			//-----------------------------------------------------------------
			// BoardDTO 객체의 고유멤버에 접근하기 위해서는 다운캐스팅 필수!!
			BoardDTO board = (BoardDTO)boardList.get(i); // Object -> BoardDTO 다운캐스팅!
			%>
			
			
			<!-- BoardDTO 객체에 저장된 멤버변수 값(데이터)을 테이블에 표시 -->
			<tr>
				<td><%=board.getIdx() %></td>
				<!-- 게시물 제목 클릭 시 content.jsp 페이지로 이동(글번호(idx)를 파라미터로 전달) -->
				<td><a href="content.jsp?idx=<%=board.getIdx()%>"><%=board.getSubject() %></a></td>
				<td><%=board.getName() %></td>
				<td><%=board.getDate() %></td>
				<td><%=board.getReadcount() %></td>
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












