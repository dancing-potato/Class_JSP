<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteForm</title>
</head>
<body>
	<h1>학생 정보 삭제</h1>
		<form action="deletePro.jsp" method="post">
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
					<td colspan="2"  align="center">
						<input type="submit" name="삭제">
						
					</td>
				</tr>
			
			</table>
		</form>
</body>
</html>