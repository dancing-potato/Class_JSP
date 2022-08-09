<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteForm</title>
</head>
<body>
	<%
	//파라미터 중 글번호(idx)가 없을 경우(=null)
	//자바스크립트를 사용하여 "잘못된 접근입니다!" 출력 후 메인페이지(index.jsp)로 돌아가기
	if(request.getParameter("idx") == null){%>
		<script>
			alert("잘못된 접근입니다!");
			location.href="../index.jsp";
		</script>
	<%}%>
	<h1>글 삭제</h1>
	<form action="deletePro.jsp" method="post">
	<!-- post방식 일 때 입력받지 않는 데이터를 폼파라미터로 전달하는 방법 = hidden속성 -->
		<input type="hidden" name="idx" value="<%=request.getParameter("idx")%>">
		<table border="1">
			<tr>
				<th>비밀번호</th><td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>