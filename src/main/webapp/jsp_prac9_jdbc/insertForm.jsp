<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertFrom</title>
</head>
<body>
<body>
	<h1>학생 정보 입력</h1>
	<form action="insertPro.jsp" method="post">
		<table border="1">
			<tr>
				<th>학번</th>
				<td><input type="text" name="studentNo"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2"  align="center">
					<input type="submit" name="등록">
					<input type="reset" name="초기화">
				</td>
			</tr>
		
		</table>
	</form>
</body>
</html>