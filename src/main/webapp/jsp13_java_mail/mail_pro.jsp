
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="jsp13_java_mail.GoogleSMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String sender = request.getParameter("sender");		// 발신자 주소
String receiver = request.getParameter("receiver");	// 수신자 주소
String title = request.getParameter("title");		// 메일 제목
String content = request.getParameter("content");	// 메일 본문

try{
	
	// --------- 메일 전송에 필요한 설정 작업 ---------------
	// 메일 전송 프로토콜 : SMTP(Simple Mail Transfer Protocol)
	// (참고. 메일 수신 프로토콜 : POP3)
	
	// 시스템(서버)의 속성 정보 ( = 서버정보 ) 를 관리하는 java.util.Properties 객체 리턴받기
	Properties properties = System.getProperties();
	
	// 메일 발송 프로토콜 정보 설정
	// 메일 전송에 필요한 정보를 Properties 객체(서버 속성 정보)에 추가 => put()메서드 활용
	// => 첫번째 파라미터는 고정, 두번째 파라미터는 메일 서버와 전송 상황에 따라 값이 달라짐
	// TLS(Transport Layer Security)인증 관련 설정
	
	properties.put("mail.smtp.starttls.enable","true");
	properties.put("mail.smtp.ssl.protocols","TLSv1.2");
	
	// 메일 전송에 사용할 메일 서버 지정(Gmail, 네이버, 네이트 등) => 각메일서비스에 설정방법 설명되어있음
	properties.put("mail.smtp.host","smtp.gmail.com"); //구글(gmail)메일 발송 서버 주소 지정
	properties.put("mail.smtp.auth","true"); // 인증 여부 설정(로그인 필요 시)
	properties.put("mail.smtp.port","587"); // 메일 전송에 사용될 서비스포트 설정(SMTP 포트) => 기본25번. 각 서버별로 달라질 수 있음
	
	// 메일 서버에 대한 인증 정보를 관리하는 사용자정의 클래스(GoogleSMTPAuthenticator)의 인스턴스 생성
	Authenticator authenticator = new GoogleSMTPAuthenticator(); // 슈퍼클래스(Authenticator) 타입으로 업캐스팅
	
	
	// 자바 메일의 기본 전송 단위를 javax.mail.Session 객체 단위로 관리
	// => Session 클래스의 getDefaultInstance() 메서드를 호출하여 파라미터로 서버정보와 인증정보 객체 전달
	// =>주의 ! JSP 내장 객체인 Session 객체와 별개의 객체이므로 변수명은 session 이 아닌 다른이름 사용 필수! 
	Session mailSession = Session.getDefaultInstance(properties, authenticator);
	
	// 메일 정보를 관리할 javax.mail.Internet.MimeMessage 객체 생성
	// => 파라미터로 서버정보와 인증정보를 관리하는 javax.mail.Session객체전달
	// => MimeMessage 객체를 사용하여 전송할 메일에 대한 발송 정보 설정
	Message mailMessage = new MimeMessage(mailSession);
	
	//----------------------------------------------------------------
	
	// 전송할 메일에 대한 발송 정보 설정
	// 1. 발신자 정보 설정(발신자 정보를 주소 형태로 관리하는 InternetAddress객체 생성)
	// => 파라미터 : 발신자 메일 주소, 발신자 이름
	// => 단, 스팸 메일 방지정책으로 인해 상용메일 사이트(구글,네이버 등)에서는 발신자주소 설정(변경) 불가능(연동된 메일주소 그대로 적용)
	Address sender_address = new InternetAddress(sender,"아이티윌"); // 두번째파라미터(발신자 이름)은 변경가능
	
	// 2. 수신자 정보 설정(InternetAdderess 객체를 사용하여 수신자 주소 설정)
	Address receiver_address = new InternetAddress(receiver);
	
	// 3. 위에서 생성한 Message 객체를 활용하여 전송할 메일 정보 설정
	// 1) 메일 헤더 정보 설정
	
	mailMessage.setHeader("content-type","text/html; charset=UTF-8");
	
	// 3-2) 발신자 정보 설정
	mailMessage.setFrom(sender_address);
	
	// 3-3) 수신자 정보 설정(파라미터로 RecipientType 클래스의 TO상수와 수신자 주소 전달)
	// => 참조의 경우 RecipientType.CC 사용
	mailMessage.addRecipient(RecipientType.TO, receiver_address);
	
	// 3-4) 메일 제목 설정
	mailMessage.setSubject(title);
	// 3-5) 메일 본문 설정(본문과 함께 본문의 컨텐츠타입 전달)
	mailMessage.setContent(content,"text/html; charset=UTF-8");
	
	// 3-6) 메일 전송 날짜 및 시각 정보 설정(java.util.Date객체를 활용)
	mailMessage.setSentDate(new Date());
	
	// 4. 메일 전송
	// javax.mail.Transport클래스의 static 메서드 send()메서드 호출
	// => 파라미터로 메일 정보가 저장된 Message 객체 전달
	
	Transport.send(mailMessage);
	
	out.println("<h3>메일이 정상적으로 전송되었습니다!</h3>");
	
} catch(Exception e){
	e.printStackTrace();
	out.println("<h3>SMTP 서버 설정 또는 서비스 문제 발생!</h3>");
	
}


%>