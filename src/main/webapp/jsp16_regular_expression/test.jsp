<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.6.1.js"></script>
<script type="text/javascript">
	/*
	자바스크립트에서 정규표현식 사용 방법
	1. 정규표현식 패턴을 갖는 객체 생성
	   1) let 변수명 = new RegExp("패턴문자열");
	   2) let 변수명 = /패턴문자열/;
	   => 두 가지 방법 중 한 가지 방법을 사용하여 패턴 문자열을 갖는 객체 생성
	2. 변수명.exec(검사할 문자열) 형태로 유효성 검사
	   => 검사 결과를 true/false 형태로 리턴(적합할 경우 대상 문자열 리턴, 부적합할 경우 null 리턴)
	      if문 내에 문자열 등의 어떤 값이 있으면 무조건 true 로 취급, null 은 false 로 취급됨
	*/
	function checkName(name) {
		// 정규표현식에 사용될 패턴 문자열을 변수 regex 에 저장
		// => 패턴 규칙 : 한글 2글자 ~ 5글자(첫글자부터 마지막까지 한글 2글자 ~ 5글자만)
		// => 시작 : ^, 끝 : $, 한글 : [가-힣], 글자수 반복 : {최소횟수,최대횟수}
		let regex = /^[가-힣]{2,5}$/;
// 		alert(regex + " : " + typeof(regex));
		
		// 정규표현식에 따른 유효성 검사를 위해 if문 사용하여 id값 유효성 판별
		// => 결과를 HTML 형식으로 span 태그 내에 표시
// 		alert(regex.exec(name));
		if(regex.exec(name)) { // 정규표현식과 일치하는 데이터(= 적합한 데이터)일 경우
			// id 선택자명이 "nameResult" 인 요소에 HTML 태그로 "사용 가능" 문자열 추가(GREEN)
			$("#nameResult").html("사용 가능");
			$("#nameResult").css("color", "green");
		} else { // 정규표현식과 일치하지 않는 데이터(= 부적합한 데이터)일 경우
			// id 선택자명이 "nameResult" 인 요소에 HTML 태그로 "사용 불가능" 문자열 추가(RED)
			$("#nameResult").html("사용 불가능");
			$("#nameResult").css("color", "red");
		}
    }
	   
	function checkPhone1(phone1) {
		// 전화번호 가운데 자리 숫자 3 ~ 4자리 패턴 적용
		let regex = /^[0-9]{3,4}$/;
		// 규칙에 맞지 않으면 "전화번호 가운데 3~4자리 숫자 필수!" 출력 후 
		// 가운데자리 입력란 커서 요청 및 입력 데이터 블럭 지정 => select() 함수
		if(!regex.exec(phone1)) {
			alert("전화번호 가운데 3~4자리 숫자 필수!");
			$("#phone1").select();
		}
	}
	   
	function checkPhone2(phone2) {
// 		alert("전화번호 가운데 4자리 숫자 필수!");
		// 전화번호 뒷자리 숫자 4자리 패턴 적용
		let regex = /^[0-9]{4}$/;
		// 규칙에 맞지 않으면 "전화번호 마지막 4자리 숫자 필수!" 출력 후 
		// 뒷자리 입력란 커서 요청 및 입력 데이터 블럭 지정 => select() 함수
		if(!regex.exec(phone2)) {
			alert("전화번호 가운데 4자리 숫자 필수!");
			$("#phone2").select();
		}
	}
	
	function checkPhone(phone) {
		// 전화번호 전체 검증 양식
		// 1. 앞자리 번호 3자리 숫자(010 or 011 or 051 or 02 만 가능)
		// 2. 앞자리 번호 뒤에 하이픈(-) 필수
		// 3. 가운데자리 번호 3~4자리 숫자
		// 4. 가운데자리 번호 뒤에 하이픈(-) 필수
		// 5. 마지막자리 번호 4자리 숫자
		let regex = /^(010|011|051|02)-[0-9]{3,4}-[0-9]{4}$/;
		if(!regex.exec(phone)) {
			alert("전화번호 양식 확인 필수!");
			$("#phone").select();
		} else { // 전화번호 양식이 일치할 경우
			// 만약, 전화번호 사이에 숫자가 아닌 기호(-)를 제거해야할 경우
			// 1. 숫자가 아닌 데이터를 지정하는 패턴 작성 : [^0-9] 또는 \D(주의! 소문자 d는 숫자)
			var NaNRegex = /\D/g; // [^0-9] 와 동일
			// => 주의! /\D/ 지정 시 일치하는 대상 1개에 대한 적용을 수행하지만
			//    예외 문자 g 사용하여 /\D/g 형식으로 지정 시 전체에 대해 패턴을 여러번 적용시킴
			// 2. 대상 문자열 객체의 replace() 메서드를 호출하여 패턴과 일치하는 문자열을 치환
			//    => 파라미터 : 정규표현식 패턴, 치환할 문자열
			$("#phone").val(phone.replace(NaNRegex, "")); // - 기호를 "" 으로 변경(기호 제거)
		}
	}
	
	function checkEmail(email) {
		// 이메일 규칙 체크(계정명@도메인)
		// 1. 계정(@ 앞부분) : 알파벳, 숫자, -, _, . 을 포함할 수 있으며 1글자 이상
		// 2. 회사명(@ 뒷부분 첫번째) : 알파벳, 숫자, - 을 포함할 수 있으며 1글자 이상
		// 3. 도메인(@ 뒷부분 두번째부터) : 알파벳, 숫자, - 을 포함할 수 있으며 1글자 이상
		//    단, 도메인은 최상위 도메인만 존재하거나(.com .net 등)
		//    서브도메인.최상위도메인 형식으로도 올 수 있음(co.kr  or.kr 등)
		// => 계정명@회사명.최상위도메인 또는 계정명@회사명.서브도메인(갯수무관).최상위도메인
// 		let regex = /^[A-Za-z0-9-_.]+@[A-Za-z0-9-]+\.[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*$/;
		//            --- 계정명 ---  -- 회사명 --   -- 도메인 --  -- 도메인 --
		//    ex)         ytlee      @   itwillbs  .      co            kr
		let regex = /^[\w_.]+@[\w-]+\.[\w-]+(\.[\w-]+)*$/; // 단, 도메인에 _ 기호도 함께 포함됨
		
		if(!regex.exec(email)) {
			alert(email + " : 양식 틀림!");
		}
	}
	
</script>
</head>
<body>
	<h1>test.jsp - 정규표현식</h1>
	<form action="#">
		이름 <input type="text" name="name" id="name" placeholder="한글2~5글자" 
					onchange="checkName(this.value)">
		<span id="nameResult"></span><br>
<!-- 		이름 <input type="text" name="name2" id="name2" placeholder="한글2~5글자" pattern="^[가-힣]{2,5}$"><br> -->
		
		전화번호
		<select name="phone0">
			<option value="010">010</option>
			<option value="011">011</option>
		</select>
		- <input type="text" name="phone1" id="phone1" onchange="checkPhone1(this.value)"> 
		- <input type="text" name="phone2" id="phone2" onchange="checkPhone2(this.value)">
		<br>
		 
		전화번호 <input type="text" name="phone" id="phone" placeholder="000-0000-0000 형식"
					onchange="checkPhone(this.value)"><br>
		
		이메일 <input type="text" name="email" id="email" onchange="checkEmail(this.value)">
	</form>

</body>
</html>











