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
  input {
    width:500px;
    height:40px;
    border:1px solid #dddddd;
    border:none;
    border-bottom:1px solid #dddddd;
    font-color:#EAEAEA;
    font-size:15px;
  }
  .check_font {
    width:400px;
    height:25px;
    font-size:14px;
  }
  .div_input{
    margin-top:7px;
  }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
  $(function(){
	  
	  var pwdJ = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,}$/;
	  
	  $("#pwd").blur(function(){
		  if(pwdJ.test($(this).val())){
			  console.log(pwdJ.test($(this).val()));
			  $("#pwd_chk").text("");
			  $("#member_submit").attr("disabled",false);
		  }
		  else
		  {
			  $("#pwd_chk").text("비밀번호를 확인해주세요");
			  $("#pwd_chk").css("color","red");
			  $("#member_submit").attr("disabled",true);
		  }
	  });
	  
	  $("#pwd2").blur(function(){
		  if(pwdJ.test($(this).val())){
			  console.log(pwdJ.test($(this).val()));
			  $("#pwd2_chk").text("");
			  $("#member_submit").attr("disabled",false);
		  }
		  else
		  {
			  $("#pwd2_chk").text("비밀번호를 확인해주세요");
			  $("#pwd2_chk").css("color","red");
			  $("#member_submit").attr("disabled",true);
		  }
	  });
	  
	  //*****비밀번호 일치 여부확인
	  $("#pwd2").blur(function(){
			if($("#pwd").val() != $("#pwd2").val()){
				if($("#pwd2").val() != ""){
					$("#pwd2_chk").text("비밀번호가 일치하지 않습니다");
					$("#pwd").val("");
				$("#pwd2").val("");
				}
			} 
	  });
  });
</script>
</head>
<body>
<div id="section">
  <div id="section_center">
    <h1>비밀번호 재설정</h1>
    <form method="post" action="pwd_change_ok">
      <input type="hidden" name="email" value="${email }">
      
      <div class="form-group">
        <label for="pwd">비밀번호</label>
          <div class="div_input">
            <input type="password" id="pwd" name="pwd" placeholder="비밀번호는 영문/숫자/특수문자를 섞어서 4~16자로 입력해주세요" autocomplete="off">
          </div>
          <div class="check_font" id="pwd_chk"></div>
      </div>
      
      <div class="form-group">
        <label for="pwd_chk">비밀번호 확인</label>
          <div class="div_input">
            <input type="password" id="pwd2" name="pwd2" placeholder="비밀번호는 영문/숫자/특수문자를 섞어서 4~16자로 입력해주세요" autocomplete="off">
          </div>
          <div class="check_font" id="pwd2_chk"></div>
      </div>
        
        <div>
          <button type="submit">비밀번호 변경</button>
        </div>
    </form>
  </div>
</div>
</body>
</html>