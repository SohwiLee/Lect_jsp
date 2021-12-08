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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<style>
	*{margin:0;padding:0; font-family: 'Noto Sans KR', sans-serif;word-break: keep-all;}
	body{background:#f5f6f7;}
	h1 span{display:block; margin:0 auto;width:210px; height:40px; background: url(https://static.nid.naver.com/images/ui/join/m_naver_logo_20191126.png); background-size:210px; color:transparent;}
	.wrap{width:500px; margin:80px auto;}
	form{margin-top:30px;}
	form > div{margin:30px 0;}
	form input{margin-right:8px;}
	form div input{margin-bottom:20px;}
	label{font-weight:500;}
	label span{font-weight:400;color:#08a600;font-size:0.8em;margin-left:5px;}
	.agreeBox{height:100px; margin: 0 auto;overflow: scroll; font-size:0.9em; border:1px solid lightgray;color:#333;}
	.promotion{font-size:0.9em; color:#333;}
	.btnChoice{display: flex; justify-content: space-between;}
	.btnCancle,.btnConfirm{padding:15px 105px; margin:0; text-align:center; font-size:1.2em; font-weight:300;border:none;color:white; cursor:pointer;}
	.btnCancle{background-color: #8e8e8e;}
	.btnConfirm{background-color: #08a600;}
</style>
<title>동의</title>
</head>
<body>
	<div class="wrap">
		<h1>
			<span>NAVER</span>
		</h1>
		<form action="join.jsp" method="get">
			<input type="checkbox" name="" id="wholeAgree"> 
			<label for="wholeAgree"> 네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택),
				프로모션 정보 수신(선택)에 모두 동의합니다. </label>

			<div>
				<input type="checkbox" name="terms" id="agree1"> 
				<label for="agree1"> 네이버 이용약관 동의<span>(필수)</span></label>
				<div class="agreeBox">
					<p>여러분을 환영합니다. 네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한
						네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버
						서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는
						유익한 정보를 포함하고 있습니다. 네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관
						및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 다양한 네이버
						서비스를 즐겨보세요. 네이버는 www.naver.com을 비롯한 네이버 도메인의 웹사이트 및 응용프로그램(어플리케이션,
						앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수
						있는 다양한 서비스를 제공하고 있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의
						네이버 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 네이버
						웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다. 네이버는 기본적으로 여러분 모두에게 동일한
						내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서
						연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는
						등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서
						확인하실 수 있습니다. 네이버 서비스에는 기본적으로 본 약관이 적용됩니다만 네이버가 다양한 서비스를 제공하는 과정에서
						부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 네이버페이, V LIVE 등)가 있습니다. 그리고
						네이버 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관,
						운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다. 회원으로
						가입하시면 네이버 서비스를 보다 편리하게 이용할 수 있습니다. 여러분은 본 약관을 읽고 동의하신 후 회원 가입을
						신청하실 수 있으며, 네이버는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 네이버 서비스 이용 계정(이하
						‘계정’)을 부여합니다. 계정이란 회원이 네이버 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로
						관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 네이버 서비스를 보다 편리하게
						이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 네이버 회원가입 방법 등에서 확인해
						주세요.</p>
				</div>
			</div>

			<div>
				<input type="checkbox" name="terms" id="agree2"> 
				<label for="agree2"> 개인정보 수집 및 이용 동의<span>(필수)</span></label>
				<div class="agreeBox">
					<p>개인정보보호법에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및
						이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은
						후 동의하여 주시기 바랍니다. 1. 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등
						대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화
						혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를
						수집합니다.</p>
				</div>
			</div>

			<div>
				<input type="checkbox" name="terms" id="agree3"> 
				<label for="agree3"> 위치정보 이용약관 동의<span>(선택)</span></label>
				<div class="agreeBox">
					<p>위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 네이버 위치기반 서비스를 이용할
						수 있습니다. 제 1 조 (목적) 이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는
						위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로
						합니다. 제 2 조 (약관 외 준칙) 이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률,
						정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및
						개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.</p>
				</div>
			</div>

			<div>
				<input type="checkbox" name="terms" id="agree4">
				<label for="agree4"> 프로모션 정보 수신 동의<span>(선택)</span></label>
				<p class="promotion">네이버에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(네이버앱 알림 또는
					문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 네이버 가입 이후 추가 가입하여
					이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로
					안내하고 동의를 받습니다.</p>
			</div>
			<div class="btnChoice">
				<input type="button" value="취소" class="btnCancle"> 
				<input type="submit" value="확인" class="btnConfirm" onclick="checkVal(form)">
			</div>
		</form>
	</div>
	<script type="text/javascript">
	// 전체선택
    function checkAll(checkAll){
        // console.log(checkAll.checked);
        const boxes = document.querySelectorAll('input[type="checkBox"]');
        for(let i=1;i<boxes.length;i++){
            boxes[i].checked=checkAll.checked;
        }
    }
   
    function checkVal(form){
        if(form.terms[1].checked && form.terms[2].checked){
            form.submit();
        }else{
            alert('네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.');
        }
    }
	</script>
	
</body>
</html>