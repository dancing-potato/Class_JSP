<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// joinForm.jsp 페이지에서 전달받은 파라미터 저장 및 확인
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
// 주민번호 = jumin1 + "-" + jumin2
String jumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
// 이메일 = email1 + "@" + email2
String email = request.getParameter("email1") + "@" + request.getParameter("email2");
String job = request.getParameter("job");
String gender = request.getParameter("gender");

// member 테이블에 파라미터 추가(INSERT)
// => 추가 성공 시 메인페이지(index.jsp)로 이동하고
//    실패 시 자바스크립트를 사용하여 "회원가입 실패!" 출력 후 이전페이지로 돌아가기
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

// 2) 회원 가입(INSERT) 작업 수행
// 3단계. SQL 구문 작성 및 전달
// => 가입일(hire_date)의 경우 now() 함수 사용
String sql = "INSERT INTO member VALUES (?,?,?,?,?,?,?,now())";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, name); // 이름
pstmt.setString(2, id); // 아이디
pstmt.setString(3, passwd); // 패스워드
pstmt.setString(4, jumin); // 주민번호
pstmt.setString(5, email); // 이메일
pstmt.setString(6, job); // 직업
pstmt.setString(7, gender); // 성별

// 4단계. SQL 구문 실행 및 결과 처리
// => INSERT 구문 실행 시 리턴되는 값(int 타입)을 insertCount 변수에 저장 후
//    insertCount 가 0보다 크면 "list.jsp" 페이지로 포워딩하고
//    아니면, 자바스크립트를 통해 "글쓰기 실패!" 출력 후 이전페이지로 돌아가기
int insertCount = pstmt.executeUpdate();

if(insertCount > 0) { // 회원가입 성공 시
	response.sendRedirect("../index.jsp");
} else { // 실패 시
	%>
	<script>
		alert("회원가입 실패!");
		history.back();
	</script>
	<%
}
%>












