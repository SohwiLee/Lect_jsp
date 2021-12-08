<%@page import="java.util.ArrayList"%>
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
<link rel="icon" type="image/png" sizes="96x96" href="https://favicon-generator.org/favicon-generator/htdocs/favicons/2014-12-19/a387e83fdefca59b0f928f867c0120ee.ico">
    <style>
        *{margin:0;padding:0; font-family: 'Noto Sans KR', sans-serif;word-break: keep-all;}
        body{background:#f5f6f7;}
        h1 a{display:block; margin:0 auto;width:210px; height:40px; background: url(https://static.nid.naver.com/images/ui/join/m_naver_logo_20191126.png); background-size:210px; color:transparent;}
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
        <h1><a href="http://www.naver.com"><span>NAVER</span></a></h1>
        <form action="joinPro.jsp" method="post">
            <div class="aboutNick">
                <p>아이디</p><input type="text" id="id" name="id">
                <p class="warning required id">필수 정보입니다.</p>
                <p>비밀번호</p><input type="password" id="pw" name="pw">
                <p class="warning required pw">필수 정보입니다.</p>
                <p class="warning inappropriate">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>
                <p>비밀번호 재확인</p><input type="password" id="checkPw" name="checkPw">
                <p class="warning required checkPw">필수 정보입니다.</p>
                <p class="warning inaccordance">비밀번호가 일치하지 않습니다.</p>
            </div>
            <div class="authentication">
                <p>이름</p><input type="text" id="name" name="name">
                <p class="warning required name">필수 정보입니다.</p>
                <p>생년월일</p>
                <div class="birth">
                    <input type="text" placeholder="년(4자)" maxlength="4" id="yy" name="yy">
                    <select id="mm" name="mm">
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
                    </select>
                    <input type="text" placeholder="일" maxlength="2" id="dd" name="dd">
                </div>
                <p class="warning required yy">태어난 년도 4자리를 정확하게 입력하세요.</p>
                <p class="warning required mm">태어난 월을 선택하세요.</p>
                <p class="warning required dd">태어난 일(날짜) 2자리를 정확하게 입력하세요.</p>
                <p class="warning inexsistable">정말이세요?</p>

                <p>성별</p>
                <select name="gender" id="gender" name="gender">
                    <option value="">성별</option>
                    <option value="남">남</option>
                    <option value="여">여</option>
                </select>
                <p>본인 확인 이메일 <span>선택</span></p>
                <input type="text" placeholder="선택입력" name="email">
            </div>
            <div class="telephone">
                <p>휴대전화</p>
                <select name="national" id="national" name="national">
                    <option value="30">그리스 +30</option>
                    <option value="82" selected>대한민국 +82</option>
                    <option value="52">멕시코 +52</option>
                    <option value="591">볼리비아 +591</option>
                    <option value="44">영국 +44</option>
                </select>
                <div class="tel-auth">
                    <input type="tel" name="myTel" id="myTel" placeholder="전화번호 입력" name="myTel">
                    <a onclick="codeUsable()">인증번호 받기</a>
                </div>
                <input type="number" name="code" id="code" placeholder="인증번호를 입력하세요" disabled>
                <p class="warning required myTel" style="margin-bottom:20px">필수 정보입니다.</p>
                <!-- <p class="warning required code" style="margin-bottom:20px">인증번호가 필요합니다.</p> -->
            </div>

            <input type="submit" value="가입하기" class="btnConfirm" onclick="checkVal(form); return false">
           <script>

               let passId = false;
               let passPw = false;
               let passPwChk = false;
               let passName = false;
               let passYY = false;
               let passMM = false;
               let passDD = false;
               let passMyTel = false;

               // focus out일 때 반응
               const id = document.querySelector('input#id');
               id.addEventListener('blur',e=>{
                   if(id.value === ''){
                     document.querySelector('.id').setAttribute('style','display:block');
                    }else{
                       document.querySelector('.id').setAttribute('style','display:none');
                       passId = true;
                    }
               });

               const pw = document.querySelector('input#pw');
               pw.addEventListener('blur',e=>{
                   if(pw.value === ''){
                     document.querySelector('.pw').setAttribute('style','display:block');
                   }else{
                       document.querySelector('.pw').setAttribute('style','display:none');
                       passPw=true;
                    }
               });

               const checkPw = document.querySelector('input#checkPw');
               checkPw.addEventListener('blur',e=>{
                   if(checkPw.value === ''){
                     document.querySelector('.checkPw').setAttribute('style','display:block');
                    }else if(checkPw.value !== pw.value){
                       document.querySelector('.inaccordance').setAttribute('style','display:block');
                   }else{
                       document.querySelector('.checkPw').setAttribute('style','display:none');
                       document.querySelector('.inaccordance').setAttribute('style','display:none');
                       passPwChk=true;
                    }
               });

               const name = document.querySelector('input#name');
               name.addEventListener('blur',e=>{
                   if(name.value === ''){
                     document.querySelector('.name').setAttribute('style','display:block');
                   }else{
                       document.querySelector('.name').setAttribute('style','display:none');
                       passName=true;
                    }
               });

               const yy = document.querySelector('input#yy');
               yy.addEventListener('blur',e=>{
                   if(yy.value === ''){
                     document.querySelector('.yy').setAttribute('style','display:block');
                    }else if( parseInt(yy.value)<1899){
                       document.querySelector('.inexsistable').setAttribute('style','display:block');
                   }else{
                       document.querySelector('.yy').setAttribute('style','display:none');
                       document.querySelector('.inexsistable').setAttribute('style','display:none');
                       passYY=true;
                    }
               });
               const mm = document.querySelector('select#mm');
               mm.addEventListener('blur',e=>{
                   if(mm.value === ''){
                     document.querySelector('.mm').setAttribute('style','display:block');
                   }else{
                       document.querySelector('.mm').setAttribute('style','display:none');
                       document.querySelector('.inexsistable').setAttribute('style','display:none');
                       passMM=true;
                    }
               });
               const dd = document.querySelector('input#dd');
               dd.addEventListener('blur',e=>{
                   if(dd.value === ''){
                     document.querySelector('.dd').setAttribute('style','display:block');
                   }else if(parseInt(dd.value)>31){
                	   document.querySelector('.inexsistable').setAttribute('style','display:block');
                   }else{
                       document.querySelector('.dd').setAttribute('style','display:none');
                       document.querySelector('.inexsistable').setAttribute('style','display:none');
                       passDD=true;
                    }
               });

               const myTel = document.querySelector('input#myTel');
               myTel.addEventListener('blur',e=>{
                   if(myTel.value === ''){
                     document.querySelector('.myTel').setAttribute('style','display:block');
                   }else{
                       document.querySelector('.myTel').setAttribute('style','display:none');
                       passMyTel=true;
                    }
               });

                // 인증번호 받을때 활성화
                function codeUsable(){
                    if(myTel.value === ''){
                        document.querySelector('.myTel').setAttribute('style','display:block');
                    }else{
                        document.querySelector('.myTel').setAttribute('style','display:none');
                        document.querySelector('input#code').removeAttribute('disabled');
                    }
                }

                // submit 전
                function checkVal(form){
                    // 모든 요소 통과가능한 상태일 때 가입완료
                    if(passId && passPw && passPwChk && passName && passYY && passMM && passDD && passMyTel){
                        form.submit();
                        console.log("pass");
                    }else{
                        const required = document.querySelectorAll('.required');
                        for(let i=0;i<required.length;i++){
                        	required[i].setAttribute('style','display:block');
                        }
                        console.log("fail");
                    }

                }

           </script>
        </form>
    </div>

</body>
</html>