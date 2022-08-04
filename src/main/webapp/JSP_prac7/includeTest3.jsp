<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pageName = request.getParameter("pageName");

if(pageName == null){
	pageName = "main";
}

pageName = "includeTest3_" + pageName + ".jsp";

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest3</title>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="2" width="1024" height="200">
				<jsp:include page="includeTest3_top.jsp">
					<jsp:param name="id" value="admin" />
				</jsp:include>
			</td>
		</tr>
		<tr>
			<td width="200" height="300">
				<jsp:include page="includeTest3_left.jsp"/>
			</td>
			<td>
			<!-- 변수 선언 시 직접 문자열 결합을 통해 미리 페이지명을 지정할 수도 있음 -->
				<jsp:include page="<%=pageName %>"/>
			
			</td>
		</tr>	
		<tr>
		
			<td colspan="2" height="200">
				<jsp:include page="includeTest3_bottom.jsp"/>
		</tr>
	
	
	
	
	
	
	</table>
</body>
</html>