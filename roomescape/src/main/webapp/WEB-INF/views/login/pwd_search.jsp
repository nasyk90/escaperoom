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
    height:700px;
    margin:auto;
  }
  #section_center {
    width:510px;
    margin:auto;
    padding-top:100px;
    
  }
  input {
    width:500px;
    height:40px;
    border:1px solid #dddddd;
    border:none;
    border-bottom:1px solid #dddddd;
    font-color:#EAEAEA;
    font-size:15px;
  }
  input:focus{
    outline:none;
  }
  label {
    font-size:17px;
  }
  button[type=submit] {
    width:505px;
    height:50px;
    background:#474747;
    color:white;
    border:1px solid #dddddd;
    border-radius:7px;
  }
  .div_input{
    margin-top:20px;
  }
  .div_button{
    margin-top:25px;
  }
  .check_font {
    width:500px;
    height:25px;
    font-size:15px;
  }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script> 
  var aj=new XMLHttpRequest();
	 function pwd_search()
	 {
		 var email=$("#email").val();
		 
		 if(email != ""){
			 aj.open("get","pwd_search_ok2?email="+email);
			 aj.send();
		 }
		 aj.onreadystatechange=function()
		 {
			 if(aj.readyState==4){
				 if(aj.responseText==0){
					 chk=0;
					 $("#email_chk").text("해당 정보로 가입되어 있는 계정은 없습니다. 다시 확인해주세요");
					 $("#email_chk").css("color","red");
					 $("#search_submit").attr("disabled",true);
				 }
				 else{
					 chk=1;
					 $("#email_chk").text("비밀번호 찾기를 누르시면 비밀번호 재설정 이메일이 보내집니다");
					 $("#email_chk").css("color","black");
					 $("#search_submit").attr("disabled",false);
				 }
			 }
		 }
	 }
	 
	 
</script>
</head>
<body>
<div id="section">
  <div id="section_center">
    <h1 align="center">비밀번호 찾기</h1>
    <form method="post" action="pwd_search_ok" id="pwd_search_ok">
      <div class="div_input">
        <label for="email">이메일(아이디)</label>
          <input type="text" id="email" name="email" onblur="pwd_search()" placeholder="이메일주소를 입력해주세요" autocomplete="off">
        </div>
        <div class="check_font" id="email_chk"></div>
      <!-- <label for="name">이름</label>
        <div>
          <input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
        </div>
      <label for="phone">전화번호</label>
        <div>
          <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요">
        </div> -->
        <div class="div_button">
          <button type="submit" id="search_submit" onclick="search_submit()">비밀번호 찾기</button>
        </div>
    </form>
  </div>
</div>
</body>
</html>