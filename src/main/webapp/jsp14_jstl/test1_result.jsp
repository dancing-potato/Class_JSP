<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1_result.jsp</h1>
	<!-- 기존 자바 코드를 활용한 파라미터 및 속성값 처리 방법 -->
	<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 세션값 가져와서 변수 value 에 저장
	String value = (String)session.getAttribute("testValue");
	%>
	<h3>이름 : <%=name %></h3>
	<h3>값 : <%=num %></h3>
	<h3>세션값 : <%=value %></h3>
	<hr>
	
	<h3>이름 :<%=request.getParameter("name") %></h3>
	<h3>값 : <%=request.getParameter("num") %></h3>
	<h3>세션값 : <%=session.getAttribute("testValue") %></h3>
	<hr>	
	<%-- ==================================================== --%>
	<%-- 
	EL 을 사용하여 request 객체의 파라미터 처리하기 위해
	EL 내장 객체 param 활용 => ${param.파라미터명}
	--%>
	<h3>이름(\${param.name }) : ${param.name }</h3>
	<h3>값(\${param.num }) : ${param.num } </h3>
	<h3>세션값(\${sessionScope.testValue } : ${sessionScope.testValue })</h3>
	
	<%-- EL 의 연산자 --%>
	<h3>\${10 + 20 } = ${10 + 20 }</h3>
	
	<%-- 
	파라미터값을 연산자를 통해 연산에 활용도 가능하며, 
	숫자 데이터의 경우 별도의 형변환도 불필요(자동 변환) 
	--%>
	<h3>\${param.num + 20 } = ${param.num + 20 }</h3>
	<h3>\${10 >= 20 } = ${10 >= 20 }</h3>
	<h3>\${10 ge 20 } = ${10 ge 20 }</h3>
	
	<%-- 
	empty 연산자를 사용하여 비교 시 null 값이거나 값이 비어있거나 
	컬렉션 사이즈가 0일 경우 true 리턴 
	--%>
	<h3>\${empty param.name } = ${empty param.name }</h3>
	<h3>\${not empty param.name } = ${not empty param.name }</h3>
	<h3>\${empty param.age } = ${empty param.age }</h3>
	
	<%-- 
	주의! 
	동등 비교 연산에 사용되는 eq 와 null 을 조합하여 eq null 비교 시 
	진짜 null 값일 경우에만 true 리턴됨 
	--%>
	<%-- 
	주로, 지정한 파라미터 등이 
	존재하지 않을 경우(값이 없는 것이 아니라 파라미터 자체가 없는 것) 
	--%>
	
	<h3>\${param.age eq null } = ${param.age eq null }</h3>
	
	
	
	
	
</body>
</html>