<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
   //로그인 폼에서 입력받은 아이디,패스워드 가져오기
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   //로그인 성공/실패 여부를 확인 -> 차후에 DB연동(지금은임의처리)
   //임의 아이디,패스워드 변수에 저장
   String dbId = "admin";
   String dbPasswd = "1234";

	if(id.equals(dbId) && passwd.equals(dbPasswd)){
		session.setAttribute("sId", id);
		response.sendRedirect("session_login_main.jsp");
	} else {%>
		<script>
			alert("로그인 실패!");
			history.back();
		</script>
	<% } %>
   
   
   
   
   
   