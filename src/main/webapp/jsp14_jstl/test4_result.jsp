<%@page import="jsp14_jstl.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test4_result.jsp</h1>
<%--request 객체의 속성값(저장된 데이터)을 가져올 때 request.getAttribute() 메서드 사용--%>
<%-- 	<h3>번호 : <%=request.getAttribute("idx") %></h3> --%>
<%-- 	<h3>이름 : <%=request.getAttribute("name") %></h3> --%>

	<%
	//request.getAttribute() 메서드로 가져온 속성값을 변수에 저장 시 형변환 필요(Object 타입 -> X 타입)
	int idx = (int)request.getAttribute("idx"); // request.getParameter() 와 다름
	String name = (String)request.getAttribute("name");
	
// 	MemberDTO member = (MemberDTO)request.getAttribute("member");
// 	out.println(member.getId());
	%>
<%-- 	<h3>번호 : <%=idx %></h3> --%>
<%-- 	<h3>이름 : <%=name %></h3> --%>
	<%-- 
	request.getAttribute() 메서드 대신 EL 문법을 사용하여 속성명을 직접 지정 시 데이터 접근 가능하며
	page, request, session, applicateion 영역을 차례대로 검사하며 일치하는 속성을 자동으로 꺼내옴
	=> ${속성명} 형식으로 지정(주의! request.getParameter() 의 ${param.파라미터명} 문법과 다름)	
	--%>

	<h3>번호(\${idx}) : ${idx }</h3>
	<h3>번호(\${name}) : ${name }</h3>
	<hr>

	<%--
	request 객체에 저장된 MemberDTO 객체로부터 멤버변수 값을 꺼내서 출력하기
	=> ${속성명.변수명} 형식으로 지정
	=> 주의! 실제 변수에 직접 접근하는 것이 아닌 해당 변수에 맞는 Getter 를 자동으로 호출함
	   (따라서, MemberDTO 클래스에 Getter 가 정의되어 있지 않을 경우 변수 접근 코드 사용 시 오류 발생!)
	=> request.getAttribute() 메서드 호출까지 생략되어 문장이 매우 간결해짐(별도의 형변환도 불필요)
	--%>
	
	<%-- MemberDTO 객체의 getId() 메서드 자동 호출(= member.getId() 와 동일) --%>
	<h3>아이디 : ${member.id }</h3>
	<h3>패스워드 : ${member.passwd }</h3>
	<h3>이름 : ${member.name }</h3>
	<h3>나이 : ${member.age }</h3>
	<hr>
	
	<%-- 일반적인 for문을 사용하여 제어변수 i값이 1 ~ 10 까지 1씩 증가하면서 반복 => i값 출력 --%>
	일반 for문 : 
	<%for(int i = 1; i <= 10; i++) { %>
		<%=i %>&nbsp;
	<%} %>
	<hr>
	
	<%--
	[ JSTL - forEach 문 ]
	<c:forEach var="변수명" begin="시작값" end="종료값" step="증감값">
		// 반복 실행 과정에서 수행할 문장들...
		// var 속성에 지정된 변수는 EL 을 통해 ${변수명} 형태로 접근 가능
	</c:forEach>
	--%>
	<%-- JSTL 의 c:forEach 태그를 사용하여 위의 for문과 동일한 작업 수행 --%>
	c:forEach 문 :
	<c:forEach var="i" begin="1" end="10" step="1">
		<%-- i를 1부터 10까지 1씩 증가하는 forEach 문 --%>
		${i }&nbsp;
	</c:forEach>
	<hr>

<%-- 10 에서 1 까지 1씩 감소하면서 i값 출력 => step 값 음수 사용 불가! --%>
<%-- 	<c:forEach var="i" begin="10" end="1" step="-1"> --%>
<%-- 		${i }&nbsp; --%>
<%-- 	</c:forEach> --%>
	
	<%-- i를 1부터 10까지 2씩 증가하는 forEach 문 --%>
	<c:forEach var="i" begin="1" end="10" step="2">
		${i }&nbsp;
	</c:forEach>
	<hr>

	<%-- 자바의 객체에 접근하여 객체 내의 데이터를 차례대로 접근하는 forEach 문 --%>
	<c:forEach var="item" items="${names }" varStatus="status">
		<%-- names 라는 속성명을 갖는 객체(배열 포함)에서 값을 차례대로 꺼내서 item 이라는 변수에 저장 --%>
		<%-- varStatus 속성에 지정된 이름으로 객체의 상태 정보 관리(이름.index 지정 시 인덱스 값 가져올 수 있음) => 생략 가능 --%>
		${status.index } 번 배열 데이터 : ${item }<br>
	</c:forEach>
	<hr>
	
	<%-- 자바 기본 문법(for문)을 사용하여 List 객체(memberList) 에 저장된 MemberDTO 객체를 차례대로 접근하여 값 출력 --%>
	<%
	List<MemberDTO> memberList = (List<MemberDTO>)request.getAttribute("memberList");
	for(MemberDTO member : memberList){
		out.println(member.getId() + ", " + member.getPasswd() + ", " + member.getName() + ", " + member.getAge() + "<br>");
	}
	%>
	<hr>
	
	<%-- c:forEach 태그를 사용하여 List 객체에 접근할 경우 --%>
	<c:forEach var="member" items="${memberList }">
		<%-- memberList 라는 속성(객체)에 접근하여 MemberDTO 타입 객체를 꺼내어 member 변수에 차례대로 저장 --%>
		<%-- 별도로 객체의 타입을 명시하지 않아도 자동으로 해당 타입의 변수로 사용할 수 있도록 해 줌 --%>
		${member.id }, ${member.passwd }, ${member.name }, ${member.age }<br>
	</c:forEach>
	
	<hr>
	
	<%
	// 1명의 회원 정보를 MemberDTO 객체에 저장
	MemberDTO member2 = new MemberDTO("hong", "1234", "홍길동", 20);
	// 현재 페이지 내에서 생성한 객체를 현재 페이지 내에서 JSTL 등을 통해 접근해야할 경우
	// pageContext 객체의 setAttribute() 메서드를 사용하여 현재 페이지에 객체 형태로 저장해야함(request 객체 등도 사용 가능)
	pageContext.setAttribute("member2", member2);
	%>
	${member2.id }, ${member2.passwd }, ${member2.name }, ${member2.age }<br>
	
	
	

</body>
</html>