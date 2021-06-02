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
    width:510px;
    margin:auto;
    padding-top:50px;
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
  
  .check_font {
    width:400px;
    height:25px;
    font-size:14px;
  }
  .div_input{
    margin-top:7px;
  }
  #email {
    width:420px;
    
  }
  button[name=checkbtn] {
    width:76px;
    height:44px;
    background:none;
    border:none;
    border-bottom:1px solid #dddddd;
    cursor:pointer;
  }
  button[name=member_submit]{
    width:505px;
    height:50px;
    background:#474747;
    color:white;
    border:1px solid #dddddd;
    border-radius:7px;
  }
  label {
    font-size:17px;
  }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
  /* $(function(){
	 $(".birth").datepicker({
		 dateFormat:"yy-mm-dd",  //날짜 형식
	     yearRange: 'c-100:c+0',
		 changeMonth: true,  //월을 변경
		 changeYear: true  //년을 변경
	 }); 
  }); */
 
	 function email_checkbtn(){
		 var email=$("#email").val();
		 /* console.log('btn click') */
		 $.ajax({
			 
			 type:"post",
			 url:"/roomescape/member/email_check",
			 dataType:'text',
			 data:{email:email},
			 success:function(data){
				 if(data=='1'){
					 $("#email_chk").text("사용중인 아이디입니다");
					 $("#email_chk").css("color","red");
					 $("#member_submit").attr("disabled",true);
				 }
				 else{
					 $("#email_chk").text("사용가능한 아이디입니다");
					 $("#email_chk").css("color","black");
					 $("#member_submit").attr("disabled",false);
				 }
			}
		});
		 
	 }
	 
	 //*****email 중복체크
	/*  var aj=new XMLHttpRequest();
	 function email_checkbtn()
	 {
		 var email=$("#email").val();
		 
		 if(email != ""){
			 aj.open("get","email_check?email="+email);
			 aj.send();
		 }
		 aj.onreadystatechange=function()
		 {
			 if(aj.readyState==4){
				 if(aj.responseText==0){
					 chk=0;
					 $("#email_chk").text("사용가능한 아이디입니다");
					 $("#email_chk").css("color","black");
					 $("#member_submit").attr("disabled",false);
				 }
				 else{
					 chk=1;
					 $("#email_chk").text("사용불가능한 아이디입니다");
					 $("#email_chk").css("color","red");
					 $("#member_submit").attr("disabled",true);
				 }
			 }
		 }
	 } //*****email중복체크 close  */
	 
	 
	//*****유효성검사
    $(function(){
    	
    	//*****입력이 
    	$('form').on('submit',function(){
 			var inval_Arr = new Array(5).fill(false);
 			
 			if(emailJ.test($("#email").val())){
 				console.log(phoneJ.test($('#email').val()));
 				inval_Arr[0]=true;
 			}else{
 				inval_Arr[0]=false;
 				return false;
 			}
 			
 			if(($("#pwd").val()==($("#pwd2").val()))
 					&& pwdJ.test($("#pwd").val())){
 				inval_Arr[1]=true;
 			} else{
 				inval_Arr[1]=false;
 				return false;
 			}
 			
 			if(nameJ.test($("#name").val())){
 				console.log(phoneJ.test($('#name').val()));
 				inval_Arr[2]=true;
 			}else{
 				inval_Arr[2]=false;
 				return false;
 			}
 			
 			if(phoneJ.test($("#phone").val())){
 				console.log(phoneJ.test($('#phone').val()));
 				inval_Arr[3]=true;
 			}else{
 				inval_Arr[3]=false;
 				return false;
 			}
 			
 			if(birthJ){
 				console.log(birthJ);
 				inval_Arr[4]=true;
 			}else{
 				inval_Arr[4]=false;
 				return false;
 			}
 			
 			var validAll = true;
 			for(var i = 0; i < inval_Arr.length; i++){
 				
 				if(inval_Arr[i] == false){
 					validAll = false;
 				}
 			}
 			
 			if(validAll==true){ // 유효성 모두 통과
 				confirm('회원가입이 정상적으로 완료됐습니다. 바로 로그인 하시겠습니까?');
 			      if(true){
 			    	  location="../login/login";
 			      }
 			      else{
 			    	  location="../main/index";
 			      }
 				
 			} else{
 				alert('입력한 정보들을 다시 한번 확인해주세요');
 				
 			}
 		});
    	
	  //모든 공백 체크 정규식
	  var empJ = /\s/g;
	  // 이메일 검사 정규식
	  var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  // 비밀번호 정규식
	  var pwdJ = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,}$/;
	  // 이름 정규식
	  var nameJ = /^[가-힣]{2,6}$/;
	  // 휴대폰 번호 정규식
	  var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	  
	  var birthJ=false;
	  
	  $("#name").blur(function(){
		  if(nameJ.test($(this).val())){
			  console.log(nameJ.test($(this).val()));
			  $("#name_chk").text("");
			  $("#member_submit").attr("disabled",false);
		  }
		  else
		  {
			  $("#name_chk").text("이름을 확인해주세요");
			  $("#name_chk").css("color","red");
			  $("#member_submit").attr("disabled",true);
		  }
	  });
	  
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
	  
	  
	  $("#phone").blur(function(){
		  if(phoneJ.test($(this).val())){
			  console.log(emailJ.test($(this).val()));
			  $("#phone_chk").text("");
			  $("#member_submit").attr("disabled",false);
		  }
		  else{
			  $("#phone_chk").text("전화번호를 확인해주세요");
			  $("#phone_chk").css("color","red");
			  $("#member_submit").attr("disabled",true);
		  }
	  });
	  
	  $("#email").blur(function(){
		  if(emailJ.test($(this).val())){
			  console.log(emailJ.test($(this).val()));
			  $("#email_chk").text("");
			  $("#member_submit").attr("disabled",false);
		  }
		  else{
			  $("#email_chk").text("이메일을 확인해주세요");
			  $("#email_chk").css("color","red");
			  $("#member_submit").attr("disabled",true);
		  }
	  });
	  
    
      $("#birth").blur(function(){
    	 var dateStr = $(this).val();		
  	     var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
  	     var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
  	     var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
  	     var today = new Date(); // 날짜 변수 선언
  	     var yearNow = today.getFullYear(); // 올해 연도 가져옴
    	 
  	     if (dateStr.length <=8) {
  	    	 if (1900 > year || year > yearNow){
 			 
    			 $('#birth_chk').text('생년월일을 확인해주세요');
    			 $('#birth_chk').css('color','red');	 
    			 
    		 }else if (month < 1 || month > 12) {
		    		
 		    	 $('#birth_chk').text('생년월일을 확인해주세요');
 				 $('#birth_chk').css('color', 'red'); 
 		    
 		     }else if (day < 1 || day > 31) {
 		    	
 		    	 $('#birth_chk').text('생년월일을 확인해주세요');
 				 $('#birth_chk').css('color', 'red'); 
 		    	
 		     }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
 		    	 
 		    	 $('#birth_chk').text('생년월일을 확인해주세요');
 				 $('#birth_chk').css('color', 'red'); 
 		    	 
 		     }else if (month == 2) {
 		    	 
 		       	 var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
 		       	
 		     	 if (day>29 || (day==29 && !isleap)) {
 		     		
 		     		 $('#birth_chk').text('생년월일을 확인해주세요');
 					 $('#birth_chk').css('color', 'red'); 
 		    	
 				}else{
 					$('#birth_chk').text('');
 					birthJ = true;
 				}
 		     	
 		     }else{
 		    	 $('#birth_chk').text(''); 
 				 birthJ = true;
 			 }
 			
 		 }else{
 				 //1.입력된 생년월일이 8자 초과할때 :  auth:false
 				 $('#birth_chk').text('생년월일을 확인해주세요');
 				 $('#birth_chk').css('color', 'red');  
 			  }
 		});
    });  //*****유효성검사 close

</script>
</head>
<body>
<div id="section">
  <div id="section_center">
    <h1 align="center">회원가입</h1>
    <form method="post" id="member" action="member_ok"> <!-- onsubmit="return validate()" -->
      <div class="form-group">
        <label for="email">이메일(아이디)</label>
          <div class="div_input">
            <input type="text" id="email" name="email" placeholder="이메일 주소를 입력해주세요" autocomplete="off">
            <button type="button" name="checkbtn" id="checkbtn" onclick="email_checkbtn()">중복확인</button>
          </div>
          <div class="check_font" id="email_chk"></div>
      </div>
      
      <div class="form-group">
        <label for="name">이름</label>
          <div class="div_input">
            <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" autocomplete="off">
          </div>
          <div class="check_font" id="name_chk"></div>
      </div>
      
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
      
      <div class="form-group">
        <label for="phone">전화번호</label>
          <div class="div_input">
            <input type="text" id="phone" name="phone" placeholder="'-'없이 번호만 입력해주세요" autocomplete="off">
          </div>
          <div class="check_font" id="phone_chk"></div>
      </div>
      
      <div class="form-group">
        <label for="birth">생년월일</label>
          <div class="div_input">
            <input type="text" class="birth" id="birth" name="birth" placeholder="ex)19990707 형식으로 입력해주세요" autocomplete="off">
          </div>
          <div class="check_font" id="birth_chk"></div>
      </div>
      
      <div style="padding-top:15px;">
        <button type="submit" name="member_submit" id="member_submit">가입하기</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>