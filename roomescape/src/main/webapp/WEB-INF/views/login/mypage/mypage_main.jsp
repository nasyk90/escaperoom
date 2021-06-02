<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>	
  #section {
    width:1200px;
    height:600px;
    margin:auto;
  }
  #section_center {
    width:350px;
    margin:auto;
    padding-top:70px;
  }
 /*  #icon {
    border:1px solid red;
  } */
  #my_menu {
    font-size:27px;
  }
  #section #my_menu li {
    text-align:center;
	display:inline-block;
	list-style-type:none;
  }
 
  #section #my_menu .my_sub {
    position:absolute;
	border:1px solid black;
	width:90px;
	padding-left:0px;
	visibility:hidden;
	font-size:17px;
  }
  #section #my_menu #my_sub1 {
    height:90px;
  }
  #section #my_menu #my_sub2 {
    height:65px;
    width:135px;
  }
  
  #section #my_menu .my_sub li {
	padding-top:5px;
  }
  a:link { color: black; text-decoration: none;}
  a:visited { color: black; text-decoration: none;}
  a:hover { color: black; text-decoration: underline;}
</style>
<script>
  function my_view_sub(n)
  {
	  document.getElementsByClassName("my_sub")[n].style.visibility="visible";
  }
  function my_hide_sub(n)
  {
	  document.getElementsByClassName("my_sub")[n].style.visibility="hidden";
  }
  
  function mem_out()
  {
	  if(confirm("정말 계정을 탈퇴 하실겁니까?"))
	  {
		  alert("그동안 이용해주셔서 감사합니다.");
		  location="../../member/member_out";
	  }
  }
  
  function mem_dor()
  {
	  if(confirm("정말 계정을 휴면신청 하실겁니까?"))
	  {
		  alert("그동안 이용해주셔서 감사합니다. 다음에 필요하시면 다시 휴면계정을 활성화 하십시오.");
		  location="../../member/member_dor";
	  }
  }
  
</script> 
</head>
<body>
<div id="section">
  <div id="section_center">
    <div id="icon" align="center">
      <div class="material-icons" style="font-size:200px;">face</div><p>
    </div>
    <div id="my_menu">
      <ul id="my_main">
		<li onmouseover="my_view_sub(0)" onmouseout="my_hide_sub(0)">내정보   |
		  <ul class="my_sub" id="my_sub1">
		    <li><a href="../../member/member_update">수정하기</a></li>
			<li><a href="javascript:mem_out()">탈퇴하기</a></li>
			<li><a href="javascript:mem_dor()">휴면신청</a></li>
		  </ul>
		</li>
		<li onmouseover="my_view_sub(1)" onmouseout="my_hide_sub(1)">주문·예약 내역
		  <ul class="my_sub" id="my_sub2">
		    <li><a href="../../reserve/reserve_ok">예약내역</a></li>
		    <li>주문내역</li>
		  </ul>
	    </li>
	  </ul>
	</div>
  </div>
</div>
</body>
</html>