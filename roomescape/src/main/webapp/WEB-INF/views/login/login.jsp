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
    height:800px;
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
  #msg {
    width:500px;
    height:15px;
    font-size:14px;
  }
  button[type=submit] {
    width:505px;
    height:50px;
    background:#474747;
    color:white;
    border:1px solid #dddddd;
    border-radius:7px;
  }
  #btm {
    padding-top:10px;
    text-align:center;
  }
  .div_input{
    margin-top:20px;
  }
  .div_button{
    margin-top:35px;
  }
  a:link { color: black; text-decoration: none;}
  a:visited { color: black; text-decoration: none;}
  a:hover { color: black; text-decoration: underline;}
</style>
</head>
<body>
<div id="section">
  <div id="section_center">
    <h1 align="center">로그인</h1>
    <form method="post" action="login_ok">
      
      <div class="div_input">
        <label for="email">이메일(아이디)</label>
          <input type="text" id="email" name="email" placeholder="이메일 주소를 입력해주세요" autocomplete="off">
      </div>
        
      <div class="div_input">
        <label for="pwd">비밀번호</label>
          <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요">
      </div>

        <c:if test="${chk == 11 }">  <!-- login_ok에서 회원DB에 없는 값에 대한 chk=11값을 받아와서 값이 틀리다는것을 안내하기 -->
          <div id="msg" style="color:red">아이디 혹은 비밀번호가 틀립니다.</div>
        </c:if>
        <c:if test="${chk == 2 }">  <!-- login_ok에서 탈퇴계정에 대한 chk=2값을 받아와서 탈퇴계정 안내하기 -->
          <div id="msg" style="color:red">이미 탈퇴한 회원입니다.</div>
          <a href="../main/index">메인화면으로 가기</a>
          <a href="../member/member">회원가입 하러 가기</a>
        </c:if>
        <c:if test="${chk!=2 }">
        <div class="div_button">
          <button type="submit">로그인</button>
        </div>
        <div id="btm">
          <a href="email_search">아이디 찾기</a> |
          <a href="pwd_search">비밀번호 찾기</a> |
          <a href="../member/member">회원가입 </a>
        </div>
        </c:if>
    </form>
  </div>
</div>
</body>
</html>