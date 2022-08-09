<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	var isDuplicate = true; // 아이디 중복 여부를 저장할 변수 선언(true : 중복, false : 중복아님)
	// => 기본값으로 부정의 의미인 true 값 설정
	var isSamePassword = false; // 패스워드 일치 여부를 저장할 변수(true : 일치, false : 불일치)
	// => 기본값으로 부정의 의미인 false 값 설정
	var isCorrectPassword = false; // 패스워드 사용 가능 여부(true : 가능, false : 불가능)
	// => 기본값으로 부정의 의미인 false 값 설정
	
	// 아이디 중복체크
	function checkDuplicateId() {
		// ID 입력란에 입력된 아이디 가져오기
		var id = document.fr.id.value;
// 		alert(id);

		// 입력받은 아이디가 4 ~ 8글자 사이일 경우 새 창에 check_id.jsp 페이지 표시
		if(id.length >= 4 && id.length <= 8) {
			window.open("check_id.jsp", "check", "width=400,height=200");
			// 버튼 우측 span 영역에 중복확인완료 표시
			document.getElementById("checkIdResult").innerHTML = "중복확인완료";
			
			// 중복확인완료 표시를 위해 isDuplicate 변수(전역변수)를 false 로 변경
			isDuplicate = false;
		} else {
			alert("아이디는 4 ~ 8글자 사이 필수!");
			
			// 만약, 중복체크 과정에서 중복이 발생했다고 가정(또는 아이디가 사용 불가능하다고 가정)
			// => 중복확인완료 표시를 제거하기 위해 isDuplicate 변수를 true 로 변경
			isDuplicate = true;
			
			document.fr.id.select(); // 아이디 입력창 커서 요청 및 입력 항목 선택
		}
	}
	
	/*
	2. 비밀번호 입력란에 키를 누를때마다 비밀번호 길이 체크하기
	=> 체크 결과를 비밀번호 입력창 우측 빈공간에 표시하기
	=> 비밀번호 길이 체크를 통해 8 ~ 16글자 사이이면 "사용 가능한 패스워드"(파란색) 표시,
       아니면, "사용 불가능한 패스워드"(빨간색) 표시
	*/
	function checkPasswd(passwd) { // 함수 호출될 때 입력된 패스워드 전달받기
		var span_checkPasswdResult = document.getElementById("checkPasswdResult");
		
		// 패스워드가 변경될 때 패스워드 확인 동작도 함께 수행하기 위해
		// checkConfirmPassword() 함수를 이 위치에서 호출
		checkConfirmPasswd(document.fr.passwd2.value);
	
		// 입력된 패스워드 길이 체크
		if(passwd.length >= 8 && passwd.length <= 16) { // 사용 가능
			span_checkPasswdResult.innerHTML = "사용 가능한 패스워드";
			span_checkPasswdResult.style.color = "BLUE";
			isCorrectPassword = true;
		} else { // 사용 불가능
			span_checkPasswdResult.innerHTML = "사용 불가능한 패스워드";
			span_checkPasswdResult.style.color = "RED";
			isCorrectPassword = false;
		}
	}
	
	/*
	3. 비밀번호확인 입력란에 키를 누를때마다 비밀번호와 같은지 체크하기
	=> 체크 결과를 비밀번호확인 입력창 우측 빈공간에 표시하기
	=> 비밀번호와 비밀번호확인 입력 내용이 같으면 "비밀번호 일치"(파란색) 표시,
	   아니면, "비밀번호 불일치"(빨간색) 표시
	*/
	function checkConfirmPasswd(passwd2) { // 함수 호출될 때 입력된 패스워드 전달받기
		var span_checkPasswd2Result = document.getElementById("checkPasswd2Result");
		
		// 입력된 패스워드 길이 체크
		if(passwd2 == document.fr.passwd.value) { // 두 패스워드 일치
			span_checkPasswd2Result.innerHTML = "비밀번호 일치";
			span_checkPasswd2Result.style.color = "BLUE";
			
			// 비밀번호 일치 표시를 위해 isSamePassword 변수값을 true 로 변경
			isSamePassword = true;
		} else { // 패스워드 불일치
			span_checkPasswd2Result.innerHTML = "비밀번호 불일치";
			span_checkPasswd2Result.style.color = "RED";
			
			// 비밀번호 불일치 표시를 위해 isSamePassword 변수값을 false 로 변경
			isSamePassword = false;
		}
	}
	
	// 주민번호 앞자리 6자리 입력되면 뒷자리로 커서 요청
	function checkJumin1(jumin1) {
		if(jumin1.length == 6) {
			document.fr.jumin2.focus(); // 커서 요청(포커스 요청)
		}
	}

	// 주민번호 뒷자리 7자리 입력되면 커서 해제
	function checkJumin2(jumin2) {
		if(jumin2.length == 7) {
			document.fr.jumin2.blur(); // 커서 제거(포커스 해제)
		}
	}
	
	// 도메인 셀렉트박스 처리
	function selectDomain(domain) {
		document.fr.email2.value = domain;
		
		// 만약, 직접입력 항목 선택 시("" 입력 시) 
		if(domain == "") {
			document.fr.email2.focus();
		}
	}
	
	// 체크박스 전체 선택 기능
	function checkAll(isChecked) {
		if(isChecked) { // true
			document.fr.hobby[0].checked = true;
			document.fr.hobby[1].checked = true;
			document.fr.hobby[2].checked = true;
		} else { // false
			document.fr.hobby[0].checked = false;
			document.fr.hobby[1].checked = false;
			document.fr.hobby[2].checked = false;
		}
	}
	
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="joinPro.jsp" method="post" name="fr">
		<table border="1">
			<tr><td>이름</td><td><input type="text" name="name" required="required"></td></tr>
			<tr>
				<td>ID</td>
				<td>
					<input type="text" name="id" placeholder="4 ~ 8글자 사이 입력" required="required">
					<input type="button" value="ID중복확인" onclick="checkDuplicateId()">
					<span id="checkIdResult"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<!-- 패스워드 입력란에 패스워드 입력 시마다 checkPasswd() 함수 호출(입력된 패스워드값 파라미터로 전달) -->
					<!-- onchange 이벤트 적용 시 패스워드 입력 후 포커스가 해제되면 이벤트 동작 -->
					<!-- 단, 원래 텍스트와 동일한 텍스트가 최종 상태일 경우 onchange 는 동작X -->
					<input type="password" name="passwd" onchange="checkPasswd(this.value)" placeholder="8 ~ 16글자 사이 입력" required="required">
					<span id="checkPasswdResult"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" name="passwd2" onchange="checkConfirmPasswd(this.value)" required="required">
					<span id="checkPasswd2Result"></span>
				</td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" required="required" onkeyup="checkJumin1(this.value)"> -
					<input type="text" name="jumin2" required="required" onkeyup="checkJumin2(this.value)">
				</td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td>
					<input type="text" name="email1" required="required">@
					<input type="text" name="email2" required="required">
					<!-- 도메인 선택 시 email2 입력창에 해당 도메인 입력 -->
					<select name="emailDomain" onchange="selectDomain(this.value)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="job" required="required">
						<option value="">항목을 선택하세요</option>
						<option value="개발자">개발자</option>
						<option value="DB엔지니어">DB엔지니어</option>
						<option value="관리자">관리자</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="가입">
					<input type="reset" value="초기화">
					<input type="button" value="돌아가기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>