<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
    *{margin:0;padding:0; font-family: 'Noto Sans KR', sans-serif;word-break: keep-all;}
    body{background:#f5f6f7;}
    h1 span{display:block; margin:0 auto;width:210px; height:40px; background: url(https://static.nid.naver.com/images/ui/join/m_naver_logo_20191126.png); background-size:210px; color:transparent;}
    .wrap{width:450px; margin:80px auto;}
    form{margin-top:30px;}
    form div p{margin-top:30px;margin-bottom:8px; font-weight:500;font-size:0.95em;}
    p.warning{margin:5px 0 0; font-size: 0.8em; font-weight:400; color:red;}
    form div input{width:95%; padding:15px 10px; border:1px solid lightgray;}
    form div select{width:100%; padding:15px 10px; border:1px solid lightgray;}
    .birth{display: flex; gap:5px;}
    .telephone{margin-bottom:50px;}
    .tel-auth{display: flex; align-items: center; gap:5px; margin:10px 0 10px; }
    .tel-auth a{width:150px;padding:13px;background-color: #03c75a; color:white;text-decoration: none; text-align: center;}
    .btnConfirm{width:100%; background-color: #08a600; padding:15px 90px; text-align:center; font-size:1.2em; font-weight:300;border:none;color:white; cursor:pointer;}
    .warning{display: none;}
</style>
<title>회원가입</title>
</head>
<body>
	<div class="wrap">
		<h1>
			<span>NAVER</span>
		</h1>
		<form action="joinPro.jsp" method="post">
			<div class="aboutNick">
				<p>아이디</p>
				<input type="text">
				<p class="warning required" id="idReq">필수 정보입니다.</p>
				<p>비밀번호</p>
				<input type="password">
				<p class="warning required" id="pwReq">필수 정보입니다.</p>
				<p class="warning inappropriate">8~16자 영문 대 소문자, 숫자, 특수문자를
					사용하세요.</p>
				<p>비밀번호 재확인</p>
				<input type="password">
				<p class="warning required" id="checkPwReq">필수 정보입니다.</p>
				<p class="warning inaccordance" id="checkPwFalse">비밀번호가 일치하지 않습니다.</p>
			</div>
			<div class="authentication">
				<p>이름</p>
				<input type="text">
				<p>생년월일</p>
				<div class="birth">
					<input type="text" placeholder="년(4자)" maxlength="4" id="yy">
					<select name="" id="mm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" placeholder="일" maxlength="2" id="dd">
				</div>
				<p class="warning year-required">태어난 년도 4자리를 정확하게 입력하세요.</p>
				<p class="warning month-required">태어난 월을 선택하세요.</p>
				<p class="warning date-required">태어난 일(날짜) 2자리를 정확하게 입력하세요.</p>
				<p class="warning inexsistable">정말이세요?</p>

				<p>성별</p>
				<select name="" id="">
					<option value="">성별</option>
					<option value="남">남</option>
					<option value="여">여</option>
				</select>
				<p>
					본인 확인 이메일 <span>선택</span>
				</p>
				<input type="text" placeholder="선택입력">
			</div>
			<div class="telephone">
				<p>휴대전화</p>
				<select name="" id="">
					<option value="30">그리스 +30</option>
					<option value="82" selected>대한민국 +82</option>
					<option value="52">멕시코 +52</option>
					<option value="591">볼리비아 +591</option>
					<option value="44">영국 +44</option>
				</select>
				<div class="tel-auth">
					<input type="tel" name="" id="" placeholder="전화번호 입력"> <a
						href="">인증번호 받기</a>
				</div>
				<p class="warning required" style="margin-bottom: 20px">필수
					정보입니다.</p>
				<input type="number" name="" id="" placeholder="인증번호를 입력하세요">
			</div>

			<input type="submit" value="가입하기" class="btnConfirm" onclick="checkVal(form)">
			
			<script type="text/javascript">
			
			function checkVal(form){}
			</script>

		</form>
	</div>

</body>
</html>