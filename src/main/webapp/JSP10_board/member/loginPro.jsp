<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

// member 테이블에서 id 가 파라미터와 같고, passwd 도 파라미터와 같은 레코드를 조회(SELECT)
// => 조회 결과가 있을 경우 로그인 성공이므로 session 객체에 "sId" 라는 속성으로 아이디를 저장하고
//    메인페이지(index.jsp)로 이동
// => 조회 결과가 없을 경우 로그인 실패이므로
//    자바스크립트를 사용하여 "로그인 실패!" 출력 후 이전 페이지로 돌아가기


	String driver = "com.mysql.cj.jdbc.Driver"; 
	String url = "jdbc:mysql://localhost:3306/study_jsp3"; 
	String user = "root"; 
	String password = "1234";
	
	Class.forName(driver);
	Connection con = DriverManager.getConnection(url, user, password);
	
	//member테이블에서 id가 파라미터와 같고, 패스워드도 파라미터와 같은 레코드를 조회(SELECT)

	String sql = "SELECT * FROM member WHERE id=? AND passwd=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	
	ResultSet rs = pstmt.executeQuery();
	// 만약, 조회 결과가 있을 경우(rs.next() 가 true) 로그인 성공이므로
	// => 세션 객체에 "sId" 라는 속성명으로 로그인 아이디를 저장하고 메인페이지(index.jsp)로 이동
	// 아니면(rs.next() 가 false) 로그인 실패이므로 자바스크립트를 사용하여
	// "아이디 또는 패스워드가 틀렸습니다!" 출력 후 이전페이지로 돌아가기
	
	if(rs.next()){
		session.setAttribute("sId", id);
		response.sendRedirect("../index.jsp");
	}else {
		%>
		<script>
			alert("아이디 또는 패스워드가 틀렸습니다!");
			history.back();
		</script>
		<% 
	}
	%>