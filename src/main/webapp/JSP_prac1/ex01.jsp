<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%!
 	String str1 = "멤버(전역)변수입니다.";
 
 	public void method1(){
	 System.out.println("선언문 내의 method1() 메서드 호출됨!");
 }
	public String method2(){
	return "method2() 메서드의 리턴값";
}
 
 %>   
 <%
 	Calendar c = Calendar.getInstance();
 	int hour = c.get(Calendar.HOUR_OF_DAY);
 	int min = c.get(Calendar.MINUTE);
 	int sec = c.get(Calendar.SECOND);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP복습_1</title>
</head>
<body>
	<h1>수업내용 복습_1</h1>
	<hr>
	<%
	Timestamp now = new Timestamp(System.currentTimeMillis());
	%>
	<h3>현재 시각 : <%=now %></h3>
		
	<hr>
	<h3>멤버변수 str = <%=str1 %></h3>
	<h3>method2() 메소드 호출 결과 : <%=method2() %></h3>
	<hr>
	
	<%
	
	String str2 = "로컬(지역)변수 입니다.";
	method1();
	System.out.println("이 문장은 이클립스 콘솔에 출력됩니다.");
	out.println("<h3>스크립틀릿에서 출력한 데이터<h3>");
	%>

	<h3>로컬변수 str2= <%=str2 %></h3>
	<h3>멤버변수 str3(선언문 위) = <%=str3 %></h3>
	
	<%!String str3 = "멤버변수 str3입니다.";%>
	<h3>멤버변수 str3 = <%=str3 %></h3>
	<hr>
	
	현재시각 : <%=hour %>시 <%=min %>분 <%=sec %>초
	<%
	if(hour < 12){
		out.println("오전입니다.");
	}else {
		out.println("오후입니다.");
	}
	%>
	<hr>
	<%
	if(hour<12){
		%><h3>오전입니다.</h3><%
	 }else {
		%><h3>오후입니다.</h3><%
	}%>

	<% if(hour<12){%>
		<h3>오전입니다.</h3>	
	<% }else {%>
		<h3>오후입니다.</h3>
	<% }%>
	<hr>
	
	<%! 
	
	public int sum(){
		int total = 0;
		
		for(int i = 1;i <=100 ;i++){
			total += i;
		}
		return total;
	}
	%>
	
	<h3>1~100 까지의 정수의 합 = <%=sum() %></h3>
	
	
</body>
</html>