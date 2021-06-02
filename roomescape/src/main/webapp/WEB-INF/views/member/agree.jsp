<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  #section {
    width:1200px;
    height:900px;
    margin:auto;
  }
  #section_center {
    width:1200px;
    margin:auto;
    padding-top:50px;
  }
  
  textarea{
    width:530px;
    height:300px;
    font-size:15px;
    align:center;
  }
  #textarea #textarea_first{
    background: #fbfbfb;
    -webkit-box-sizing: border-box;
       -moz-box-sizing: border-box;
            box-sizing: border-box;
    padding: 19px 14px;
    border: 1px solid #ccc;
    width: 570px;
    height: 420px;
    float: left;
    
  }
  #textarea #textarea_second{
    background: #fbfbfb;
    -webkit-box-sizing: border-box;
       -moz-box-sizing: border-box;
            box-sizing: border-box;
    padding: 19px 14px;
    border: 1px solid #ccc;
    width: 570px;
    height: 420px;
    float: left;
    margin-left: 20px;
  }
  
  #all_check {
    float:none;
    margin-top:10px;
  }
  
  button{
    width:250px;
    height:50px;
    background:#474747;
    color:white;
    border:1px solid #dddddd;
    border-radius:7px;
  }
  #btn{
    text-align:center;
    padding-top:30px;
  }

</style>
<script>
  //*****id=all인 체크박스가 체크되면 class=agree인 모든 체크박스를 체크해야 된다
  //*****id=all인 체크박스가 해제되면 class=agree인 모든 체크박스를 해제해야 된다. 
  function change_all_agree(all_agree)
  {
	  if(all_agree.checked)  //*****모든동의체크박스에 체크가 되면
	  {
		  for(i=0; i<2; i++)
			  document.getElementsByClassName("agree")[i].checked=true;
	  }
	  else  //*****체크 해제가 되면
	  { 
		  for(i=0; i<2; i++)
			  document.getElementsByClassName("agree")[i].checked=false;
	  }
  }
  //*****class=agree인 체크박스가 클릭되었을때=> id=agree1,2가 체크 되어있으면 id=all인 체크박스가 체크
  //*****class=agree인 체크박스가 클릭되었을때=> id=agree1,2중 하나라도 체크가 안되어 있으면 id=all인 체크박스 체크 해재
  function change_agree()
  {
	  var ch=0;
	  //*****2개의 agree전부 체크 여부 검사
	  for(i=0; i<2; i++)
		  if(document.getElementsByClassName("agree")[i].checked)
			  ch++;  //*****agree가 체크되었다면 1씩 증가
		
	  if(ch==2)
		  document.getElementById("all").checked=true;
	  else
		  document.getElementById("all").checked=false;
  }
  
  //*****모든 체크박스에 체크가 되어있어야 회원가입으로 넘어갈 수 있다.
  function member()
  {
	  if(document.getElementById("all").checked)
		  location="member";
	  else
		  alert("모든 약관의 대해 동의하셔야 회원가입을 하실 수 있습니다.");
  }
</script>
</head>
<body>
<div id="section">
  <div id="section_center">
    <h1 align="center">회원가입 약관 동의</h1>
    <p align="center" style="font-size:17px;"><b>이용약관 및 개인정보 수집 및 이용 내용에 동의 하셔야 회원가입 하실 수 있습니다.</b></p>
      <form method="post" action="member">
        <div id="textarea">
          <div id="textarea_first">
            <p><b>이용 약관 동의</b></p>
            <textarea readonly>
정보통신망법 규정에 따라 주식회사 roomescape에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 대부분의 roomescape 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 개인 기록과 같은 회원제 서비스를 이용하기 위해 홈페이지 회원 가입 시에 “아이디(이메일), 비밀번호, 이름, 생년월일,휴대폰 번호”를 필수항목으로 수집합니다. 
2. 개인정보의 수집 및 이용목적
주식회사 roomescape는 홈페이지 회원 가입 및 관리, 예약서비스 제공에 관한 결제정보, 상품구매에 대한 결제정보 및 주소정보, 신규 서비스 개발 및 마케팅 광고에의 활용을 위하여 아래와 같은 최소한의 개인정보를 필수항목으로 온라인상에서 입력 받아 수집하고 있으며, 별도의 민간정보를 수집하지 않습니다.
1) 홈페이지 회원 가입 및 관리
   - 아이디(이메일), 비밀번호, 이름, 생년월일,휴대폰 번호 
2) 예약서비스 제공에 관한 결제 정보 등 개인정보 수집
   - 이용자가 구매한 재화나 용역의 대금 결제
   - 결제 과정 중 본인 식별, 인증, 실명확인 및 이용자가 결제한 거래의 내역을 요청하는 경우 응대 및 확인
   - 이용자가 결제한 거래의 취소 또는 환불, 상품 배송 등 전자상거래 관련 서비스 제공
   - 이용자가 결제한 대금의 청구 및 수납
   - 전자금융거래 및 통신과금 서비스 이용 불가능한 이용자(미성년자 등)와 불량, 불법 이용자의 부정 이용 방지
   - 서비스 제공 및 관련 업무 처리에 필요한 동의 또는 철회 등 의사확인
   - 회사가 제공하는 결제알림메일 발송
   - 고객 불만 및 민원처리
3) 신규 서비스 개발 및 마케팅 광고에의 활용
   - 이용 빈도 파악 및 마케팅 특성에 따른 서비스 제공 및 CRM 용도
   - 신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트, 광고성 정보 제공(결제알림메일 내) 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계
3. 개인정보 보유 및 이용기간
주식회사 roomescape는 이용자의 개인정보에 대해 개인정보의 수집 목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 다만, 수집 목적이 살성된 경우에도 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 회원의 개인정보를 보유할 수 있습니다.
   - 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우
   - 부정이용기록(부정가입, 징계기록 등의 비정상적 서비스 이용기록) : 1년
   - 계약 또는 청약철회 등에 관한 기록 : 5년
   - 대금결제 및 재화 등의 공급에 관한 기록 : 5년
   - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
   - 정당한 절차에 따라 보유기간을 미리 회원에게 고지하거나 명시한 경우
            </textarea>
            <div style="padding-top:10px;">
              <input type="checkbox" name="agree1" id="agree1" class="agree" onclick="change_agree()" value="1">이용약관의 내용에 동의합니다
            </div>
          </div>
          
          <div id="textarea_second">
            <p><b>개인정보 수집 및 이용 동의</b></p>
            <textarea readonly>
주식회사 roomescape는 본 개인정보처리방침을 정보통신망법, 개인정보 보호법 등 관련 법률을 준수하고 있습니다. 
주식회사 roomescape는 이용자의 ‘동의를 기반으로 개인정보를 수집 이용 및 제공’하고 있으며, 이용자의 ‘개인정보자기결정권’을 보장하는 수단이 됩니다.

1. 개인정보의 수집 목적 및 항목
주식회사 roomescape는 홈페이지 회원 가입 및 관리, 예약서비스 제공에 관한 결제정보, 상품구매에 대한 결제정보 및 주소정보, 신규 서비스 개발 및 마케팅 광고에의 활용을 위하여 아래와 같은 최소한의 개인정보를 필수항목으로수집하며, 별도의 민간정보를 수집하지 않습니다.
1) 홈페이지 회원 가입 및 관리
   - 아이디(이메일), 비밀번호, 이름, 생년월일, 휴대폰 번호 
2) 예약서비스 제공에 관한 결제 정보 등 개인정보 수집
   - 이용자가 구매한 재화나 용역의 대금 결제
   - 결제 과정 중 본인 식별, 인증, 실명확인 및 이용자가 결제한 거래의 내역을 요청하는 경우 응대 및 확인
   - 이용자가 결제한 거래의 취소 또는 환불, 상품 배송 등 전자상거래 관련 서비스 제공
   - 이용자가 결제한 대금의 청구 및 수납
   - 전자금융거래 및 통신과금 서비스 이용 불가능한 이용자(미성년자 등)와 불량, 불법 이용자의 부정 이용 방지
   - 서비스 제공 및 관련 업무 처리에 필요한 동의 또는 철회 등 의사확인
   - 회사가 제공하는 결제알림메일 발송
   - 고객 불만 및 민원처리
3) 신규 서비스 개발 및 마케팅 광고에의 활용
   - 이용 빈도 파악 및 마케팅 특성에 따른 서비스 제공 및 CRM 용도
   - 신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트, 광고성 정보 제공(결제알림메일 내) 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계

 주식회사 roomescape는 아래의 방법을 통해 개인정보를 수집합니다.
   - 회원가입 과정에서 이용자가 	개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우, 해당 개인정보를 수집합니다.
   - 오프라인에서 진행되는 이벤트, 세미나 등에서 서면을 통해 개인정보가 수집될 수 있습니다.
   - 고객 상담 과정에서 웹페이지, 메일, 팩스, 전화 등을 통해 이용자의 개인정보가 수집될 수 있습니다.

2. 개인정보 보유 및 이용 기간
 주식회사 roomescape는 이용자의 개인정보에 대해 개인정보의 수집 목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 다만, 수집 목적이 달성된 경우에도 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 회원의 개인정보를 보유할 수 있습니다.
   - 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우
   - 계약 또는 청약철회 등에 관한 기록 : 5년
   - 대금결제 및 재화 등의 공급에 관한 기록 : 5년
   - 정당한 절차에 따라 보유기간을 미리 회원에게 고지하거나 명시한 경우

3. 기타사항
주식회사 roomescape 서비스 이용 과정에서 이용자에게 보다 빠르고 편리한 웹사이트 사용을 지원하고 맞춤형 서비스를 제공하기 위해 쿠키가 사용됩니다.
   - 쿠키란 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에 보내는 아주 작은 텍스트 파일로서 이용자의 컴퓨터에 저장됩니다.
   - 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 이용자는 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수도 있습니다. 다만 쿠키 설치를 거부할 경우 웹 사용이 불편해지며 로그인이 필요한 일부 서비스 이용에 어려움이 있을 수 있습니다.
설정 방법의 예
1)	Internet Explorer의 경우 :
웹 브라우저 상단의 도구 메뉴 &gt; 인터넷 옵션 &gt; 개인정보 &gt; 설정
2)	Chrome의 경우 :
웹 브라우저 우측의 설정 메뉴 &gt; 화면 하단의 고급 설정 표시 &gt; 개인정보의 콘텐츠 설정 버튼 &gt; 쿠키 
주식회사 roomescape는 이용자의 권리를 다음과 같이 보호하고 있습니다.
   - 이용자는 언제든지 자신의 개인정보를 조회하고 수정할 수 있습니다.
   - 이용자는 언제든지 개인정보 제공에 관한 동의철회/회원가입해지를 요청할 수 있습니다.
   - 회원가입해지는 “홈페이지 마이 페이지 &gt; 회원 탈퇴”를 클릭하여 직접 하실 수 있습니다.
   - 주식회사 roomescape는 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.

4. 개인정보관리책임자
개인정보보호 책임자
책임자 : roomescape
전화 : 02-000-0000

 기타 개인정보 침해에 대한 신고나 상담이 필요한 경우에 아래 기관에 문의 가능합니다.
   - 개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)
   - 대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)
   - 경찰청 사이버안전국 (cyberbureau.police.go.kr / 국번없이 182)	
            </textarea>
            <div style="padding-top:10px;">
              <input type="checkbox" name="agree2" id="agree2" class="agree" onclick="change_agree()" value="2">개인정보 수집 및 이용에 동의합니다.
            </div>
          </div>
        </div>
        
          <div id="all_check" style="clear:both; padding-top:15px; font-size:17px;" align="center">
            <input type="checkbox" id="all" onclick="change_all_agree(this)" style="width:15px; height:15px;"><b>회원가입 약관에 대해 모두 동의 합니다.</b>
          </div>
          
        <div id="btn">
          <button type="button" onclick="member()">회원가입</button>
          <button type="button" onclick="location='../main/index';">취소</button>
        </div>
      </form>
  </div>
</div>
</body>
</html>