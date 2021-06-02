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
		margin:auto;
		padding-top:100px;
		padding-bottom:100px;
	}
	#section #btn1 {
		display:inline-block;
		width:90px;
		height:25px;
		border:1px solid black;
		cursor:pointer;
		padding-left:20px;
		
	}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script> 
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  	new daum.Postcode({
      	oncomplete: function(data) {
          	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              	addr = data.roadAddress;
          	} else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          	}

          	// 우편번호와 주소 정보를 해당 필드에 넣는다.
          	document.pkc.zip.value = data.zonecode; // 우편번호
          	document.pkc.juso.value = addr;  // 주소
          	// 커서를 상세주소 필드로 이동한다.
          	document.pkc.juso_etc.focus();
      	}
  	}).open();
}
</script>
</head>
<body>
 <div id="section">
  <form method="post" action="bae_write_ok" name="pkc">
    <table width="900" align="center">    
      <caption><h1>배송지 입력</h1></caption>
      <tr>
        <td> 이름 </td>
        <td> <input type="text" name="name"> </td>
      </tr>
      <tr>
        <td rowspan="3"> 주소 </td>
        <td>
          <input type="text" name="zip">
          <span id="btn1" onclick="juso_search()"> 우편번호 </span> </td>
      </tr>
      <tr>
        <td> <input type="text" name="juso"> </td>
      </tr>
      <tr>
        <td> <input type="text" name="juso_etc"> </td>
      </tr> 
      <tr>
        <td> 전화번호 </td>
        <td>
          <input type="text" name="phone" placeholder="'-'없이 입력해주세요">
      </tr>
      <tr>
        <td> 배송메세지 </td>
        <td>
           <textarea cols="30" rows="3" name="bae_msg"></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="완료"> </td>
      </tr>
    </table>
  </form>
 </div>
</body>
</html>