<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc_connect_select</title>
</head>
<body>

	<%
	
	//DB연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
	String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
	String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
	String user = "root"; 
	String password = "1234"; 
	
	//1단계.드라이버클래스 로드
	Class.forName(driver);
	//2단계.DB연결
	Connection con = DriverManager.getConnection(url, user, password);
	//3단계.SQL구문 작성 및 전달
	String sql = "SELECT * FROM test2";
	PreparedStatement pstmt = con.prepareStatement(sql);
	//4단계.SQL구문 실행 및 결과 처리
	//=>PreparedStatement 객체의 executeQuary()메서드를 호출해 SELECT 구문을 실행하고
	//  리턴되는 결과를 java.sql.ResultSet 타입 변수에 저장
	ResultSet rs = pstmt.executeQuery();
	
	/*
	다음 형태의 테이블이 ResultSet 타입 객체로 리턴됨
    +------+--------+
    | idx  | name   | <- 현재 커서(Cursor) 위치(항상 첫번째 레코드 위에 위치)
    +------+--------+
    |    1 | 홍길동 | <- rs.next() 메서드를 한 번 호출했을 때의 커서 위치(true 리턴 = 레코드 있음)
    |    2 | 이순신 | <- rs.next() 메서드를 두 번 호출했을 때의 커서 위치(true 리턴 = 레코드 있음)
    +------+--------+ <- rs.next() 메서드를 세 번 호출했을 때의 커서 위치(false 리턴 = 레코드 없음)
	*/
	
// 	조회할 레코드가 복수개(2개이상)일 경우
// 	if문 대신 while문을 사용, 다음 레코드가 존재할 동안 반복!
//  ResultSet 객체의 getXXX()메서드 호출, 각 컬럼데이터 가져오기
//  XXX는 컬럼타입에 대한 *자바* 데이터타입명 사용!!!
	while(rs.next()){
// 		int idx = rs.getInt(1);		//컬럼인덱스 번호를 지정하는 방법
		int idx = rs.getInt("idx"); //컬럼명을 지정하는 방법
// 		String name = rs.getString(2);
		String name = rs.getString("name");
		out.println(idx + ", " + name + "<br>");
	}
	
	
	%>


</body>
</html>