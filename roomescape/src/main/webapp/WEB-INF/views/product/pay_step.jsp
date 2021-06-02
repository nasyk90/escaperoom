<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
   #title{
     width:150px;
     height:50px;
     display:inline-block;
     padding-top:25px;
     font-size:20px;
   }
   #sec .sinyong{
     width:150px;
     height:50px;
     display:inline-block;
     color:white;
     background-color:#2524FF;
     padding-top:25px;
   }
   #sec .naver{
     width:150px;
     height:50px;
     display:inline-block;
     color:white;
     background-color:#0BC904;
     padding-top:25px;
   }
   #sec .smile{
     width:150px;
     height:50px;
     display:inline-block;
     color:white;
     background-color:#ED4C00;
     padding-top:25px;
   }
   #sec .askro{
     width:150px;
     height:50px;
     display:inline-block;
     color:white;
     background-color:red;
     padding-top:25px;
   }
   #btn{
     margin-top:25px;
     width:150px;
     height:50px;
     display:inline-block;
   }
</style>
<script>
	function jumun_ok()
	{
		location="jumun_ok_view";
	}
</script>
</head>
<body>
	<div align="center">
	<span id="title">결제방법</span>
	</div>
	<div id="sec" align="center">
	  <span class="sinyong"> 신용카드 </span>
	  <span class="naver"> 네이버페이 </span>
	  <span class="smile"> 스마일페이 </span>
	  <span class="askro"> (에스크로)계좌이체 </span>
	</div>
	<div align="center">
	   	<input type="button" id="btn" onclick="jumun_ok()" value="결제완료"> 
	</div>
</body>
</html>