<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardForm</title>
</head>
<body>
	<h1>forwardForm.jsp</h1>
	<form action="forwardPro.jsp" method="get">
		
		<input type="hidden" name="jumin" value="112233-1234567">
		
		<h3>아이디 : <input type="text" name="id"></h3>
		<h3>패스워드 : <input type="password" name="passwd"></h3>
		<h3>이름 : <input type="text" name="name"></h3>
		<input type="submit" value="전송">
	</form>
	
	</body>
</html>