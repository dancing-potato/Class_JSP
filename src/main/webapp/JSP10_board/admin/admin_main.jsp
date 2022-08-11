<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
//현재 페이지는 관리자(세션아이디가 "admin")만 접근할 수 있어야 하므로
//세션 아이디가 없거나 또는 세션 아이디가 "admin" 이 아닌 경우
//자바스크립트를 사용하여 "잘못된 접근입니다!" 출력 후 index.jsp 페이지로 포워딩
 String sId = (String)session.getAttribute("sId");//Object -> String
 
 if(sId == null || !sId.equals("admin")){ 
	%>
	<script>
		alert("잘못된 접근입니다!");
		location.href="../index.jsp";
	</script>	 
	 
 <%
 }
 %>   
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<h1>관리자 페이지</h1>
</body>
</html>