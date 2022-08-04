<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest</title>
</head>
<body>
	<h1>includeTest.jsp</h1>
<%--기본 	<jsp:forward page="includeTest2.jsp"></jsp:forward> --%>
<%--문법 	<jsp:include page="includeTest2.jsp"/> --%>

<!-- includeTest2.jsp 페이지로 파라미터값 전달할 경우 -->
	<jsp:include page="includeTest2.jsp">
		<jsp:param  name="parameterValue" value="Parameter Value"/>
	</jsp:include>
</body>
</html>