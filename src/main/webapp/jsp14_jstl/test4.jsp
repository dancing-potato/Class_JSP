<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="jsp14_jstl.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request 객체에 데이터 저장 후 test4_result.jsp 페이지로 포워딩(Dispatcher 방식)
request.setAttribute("idx", 3);
request.setAttribute("name", "홍길동");

// 1명의 회원정보를 MemberDTO 객체에 저장
MemberDTO member = new MemberDTO("hong","1234","홍길동",20);
//생성된 MemberDTO 객체를 request 객체에 저장
request.setAttribute("member", member);


//1명의 회원정보가 저장된 MemberDTO 객체 생성 후 ArrayList 객체에 MemberDTO 객체 저장
List<MemberDTO> memberList = new ArrayList<MemberDTO>();
memberList.add(new MemberDTO("admin","1234","관리자",0));
memberList.add(new MemberDTO("hone","1234","홍길동",20));
memberList.add(new MemberDTO("leess","1234","이순신",44));
//생성된 ArrayList 객체도 request 객체에 저장
request.setAttribute("memberList", memberList);

//String 타입 배열 names 생성 및 "홍길동", "이순신", "강감찬" 저장 후 request 객체에 저장
String[] names = {"홍길동","이순신","강감찬"};
request.setAttribute("names", names);

//request 객체를 유지하면서 test4_result.jsp 페이지로 포워딩하기 위해 
//Redirect 방식(response.sendRedirect()) 대신 Dispatcher 방식(pageContext.forward())의 포워딩 사용
pageContext.forward("test4_result.jsp");
//=> 주소 표시줄에 이전 요청 주소인 http://localhost:8080/StudyJSP/jsp14_jstl/test4.jsp 주소가 그대로 유지됨(request 객체도 유지됨)


%>