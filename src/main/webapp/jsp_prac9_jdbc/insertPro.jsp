<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 		insertForm.jsp페이지에서 입력받아 전달된 폼파라미터값을 가져와서 변수에 저장하기
// 		post방식의 요청에 대한 한글 파라미터
		request.setCharacterEncoding("UTF-8");
	
// 		폼 파라미터 가져오기 
// 		String studentNo = request.getParameter("studentNo"); //학번
// 		=> 주의!! request.getParameter() 메서드 리턴타입이 String이지만
// 		DB의 학번 컬럼은 int 타입이므로 String => int 변환 해야한다!
// 	 	int studentNo = (int)request.getParameter("studentNo"); //일반 형변환 연산자를 통한 변환 사용 불가!
// 		=> String 타입을 int타입으로 변환 시 Integer 클래스의 static메서드인 parseInt()메서드를 호출해
// 	    정수로 변환할 문자열을 파라미터로 전달하면 int 타입으로 변환 가능하다!
// 		(int xxx = Integer.parseInt("문자열로 된 정수데이터");)

		int studentNo = Integer.parseInt(request.getParameter("studentNo"));
		
		String name = request.getParameter("name");   
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
	
	
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/study_jsp3";
		String user = "root";
		String password = "1234";
	
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, user, password);
		
		String sql = "INSERT INTO student VALUES(?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, studentNo);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		pstmt.setString(4, phone);
		
		int count = pstmt.executeUpdate();
				
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPro</title>
</head>
<body>
	<h1>학생 정보 출력</h1>
		<!-- 폼 파라미터 값 출력 -->
		<h3>학번 : <%=studentNo %></h3>
		<h3>이름 : <%=name %></h3>
		<h3>E-Mail : <%=email %></h3>
		<h3>전화번호 : <%=phone %></h3>
		<hr>
		<h3>학생 정보 DB 저장 완료 - <%=count %>개 레코드</h3>
</body>
</html>