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
    margin-top:35px;
  }
</style>
</head>
<body>
<div id="section">
  <div id="section_center">
    <h1 align="center">이메일(아이디) 찾기</h1>
    <form method="post" action="email_search_ok">
    
      <div class="div_input">
        <label for="name">이름</label>
          <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" autocomplete="off">
        </div>
        
      <div class="div_input">
        <label for="phone">전화번호</label>
          <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요" autocomplete="off">
        </div>
        
        <div class="div_button">
          <button type="submit">이메일(아이디) 찾기</button>
        </div>
    </form>
  </div>
</div>
</body>
</html>