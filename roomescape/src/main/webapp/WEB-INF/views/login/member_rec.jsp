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
    height:700px;
    margin:auto;
  }
  #section_center {
    width:410px;
    margin:auto;
    padding-top:100px;
  }
  button[type=button] {
    width:400px;
    height:50px;
    background:#474747;
    color:white;
    border:1px solid #dddddd;
    border-radius:7px;
  }
  .div_button{
    margin-top:35px;
  }
</style>
<script>
  function button_click()
  {
	  if(document.getElementById("rec").checked)
		  document.getElementById("member_rec_ok").submit();
	  else
		  alert("동의하셔야 휴면계정 활성화가 가능합니다.");
  }
</script>
</head>
<body>
<div id="section">
  <div id="section_center">
  <c:if test="${chk eq 1}">
    <form method="post" action="member_rec_ok" id="member_rec_ok">
      <input type="hidden" name="email" value="${email}">
      해당 아이디는 휴면계정입니다.<br>
      계정을 복구 하시려면 아래 동의함을 체크해주세요.<p>
      <input type="checkbox" id="rec" name="check">휴면계정 활성화에 동의합니다.
      <div id="div_button">
        <button type="button" onclick="button_click()">활성화시키기</button>
      </div>
    </form>
  </c:if>
  </div>
</div>
</body>
</html>