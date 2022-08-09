<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    
  //post방식 요청에 대한 한글처리
    request.setCharacterEncoding("UTF-8");
    
    
  //writeForm.jsp페이지로부터 전달받은 폼파라미터(작성자,비밀번호,제목,내용)를
  //가져와서 변수에 저장한 후 출력하기 
    String name = request.getParameter("name");
  	String passwd = request.getParameter("passwd");
  	String subject = request.getParameter("subject");
  	String content = request.getParameter("content");
  			
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/study_jsp3";
	String user = "root";
	String password = "1234";
	
  //1단계
    Class.forName(driver);
    
  //2단계   
    Connection con = DriverManager.getConnection(url, user, password);
    
  
// 	--------------------------------------------------------
//  <명령프롬프트로 jsp_10 실습용 board 테이블 정의 >
// 1) idx (번호, 정수형) NN
// 2) name (작성자, 문자 20자) NN
// 3) passwd (패스워드, 문자16자) NN
// 4) subject (제목, 문자50자) NN
// 5) content (내용, 문자2000자) NN
// 6) date (작성일, 날짜(DATE)) NN
// 7) readcount (조회수, 정수) NN

// CREATE TABLE board (
// 	idx INT NOT NULL,
// 	name VARCHAR(20) NOT NULL,
// 	passwd VARCHAR(16) NOT NULL,
// 	subject VARCHAR(50) NOT NULL,
// 	content VARCHAR(2000) NOT NULL,
// 	date DATE NOT NULL,
// 	readcount INT NOT NULL);
// 	-------------------------------------------------------- 
	
	//board 테이블에 폼 파라미터 사용하여 글쓰기 작업 수행(INSERT)
	// =>단, 글번호는 가장 큰 번호 + 1 값으로 새로 설정
	//   작성일(date)은 데이터베이스의 now()함수 사용
	//   조회수(readcount)는 기본값인 0 으로 설정

	// 1) 새 글 번호 계산
	//    => board 테이블의 모든 레코드의 idx컬럼값 중
	//		 가장 큰 값 조회(데이터베이스 max()함수활용)  
    
    
    // 새 글 번호를 저장할 변수 선언(기본값 1)
    int idx = 1;
    
    //3단계
	//=>MySQL 의 MAX(컬럼명) 함수를 사용하면 특정 컬럼에서 가장 큰 값 조회 가능
	String sql = "SELECT MAX(idx) FROM board";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//4단계.
    ResultSet rs = pstmt.executeQuery();
    
	
	//다음 레코드가 존재할 경우 첫번재 컬럼 값(INT타입) + 1 값을 idx 변수에 저장
	if(rs.next()){
		idx = rs.getInt(1) + 1;
	}
	
	
// 	--------------------------------------------------------
	// 	2)글 등록(INSERT) 작업 수행
	// 	3단계.
	//	=>작성일(6번 파라미터: now()함수 호출), 조회수(7번 파라미터 : 기본값 0)

	sql = "INTSET INTO board VALUES(?,?,?,?,?,now(),0)";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	pstmt.setString(2, name);
	pstmt.setString(3, passwd);
	pstmt.setString(4,subject);
	pstmt.setString(5, content);


	//	4단계.
	//	=>INSERT 구문 실행 시 리턴되는 값(int타입)을 insertCount 변수에 저장 후 
	//    insertCount가 0보다 크면 "list.jsp"페이지로 포워딩하고
	//	  아니면 자바스크립트를 통해 "글쓰기 실패!" 출력 후 이전페이지로 돌아가기

	int insertCount = pstmt.executeUpdate();
	if(insertCount > 0){ //글쓰기 성공시
		
		response.sendRedirect("list.jsp");
		
	} else { //글쓰기 실패시
		%>
		<script>
			alert("글쓰기 실패!");
			history.back();
		</script>
		
	<%}
    	%>