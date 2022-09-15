<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// session 객체를 사용하여 "testValue" 라는 속성명으로 "Session Value" 문자열 저장
session.setAttribute("testValue", "Session Value");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1.jsp</h1>
	<form action="test1_result.jsp" method="post">
		<table border="1">
			<tr>
				<th>이름</th><td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>값</th><td><input type="text" name="num"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>