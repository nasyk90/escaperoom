<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
  .div_input{
    margin-top:7px;
  }
  .div_input2{
    margin-top:12px;
  }
  .check_font {
    width:400px;
    height:25px;
    font-size:14px;
  }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
  $(function(){
	 /* $(".birth").datepicker({
		 dateFormat:"yy-mm-dd",  //날짜 형식
	     yearRange: 'c-100:c+0',
		 changeMonth: true,  //월을 변경
		 changeYear: true  //년을 변경
	 }); */
	 
	 $(".phone").focus(function(){
		 $(this).val('');}).blur(function(){
		     if($(this).val()==""){$(this).val("${mdto.phone}")} 
	 });
	 
	 $(".birth").focus(function(){
		 $(this).val('');}).blur(function(){
		     if($(this).val()==""){$(this).val("${mdto.birth}")} 
	 });
  });
  
</script>
</head>
<body>
<div id="section">
  <div id="section_center">
    <h1 align="center">회원 정보 수정</h1>
    <form method="post" action="member_update_ok">
 
      <div class="div_input2">
        이메일(아이디) : 
          <b>${mdto.email }</b>
        </div>
        
      <div class="div_input2">
        이름 : 
          <b>${mdto.name }</b>
        </div>
        
      <div class="div_input2">
        <label for="phone">전화번호</label>
          <input type="text" id="phone" class="phone" name="phone" value="${mdto.phone }" autocomplete="off">
        </div>
        <div class="check_font" id="phone_chk"></div>
        
      <div class="div_input">
        <label for="birth">생년월일</label>
          <input type="text" id="birth" class="birth" name="birth" autocomplete="off" value="${mdto.birth }">
          <div class="check_font" id="birth_chk"></div>
        </div>
        
        <div>
          <button type="submit" name="member_submit">수정하기</button>
        </div>
    </form>
  </div>
</div>
</body>
</html>