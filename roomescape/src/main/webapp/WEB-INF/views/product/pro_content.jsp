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
	#section #left {
		float:left;
		width:600px;
	}
	#section #right {
		float:right;
		width:600px;
	}
	#section #con_second {
		clear:both;
	}
</style>
 <script>
 	function bae_write()
 	{
 		location="../product/bae_write";
 	}
 	function su_add()
 	{
 		var n=parseInt(document.getElementById("chk_su").innerText);
 		if(n<=10)
 		   n++;
 		document.getElementById("chk_su").innerText=n;
 		// 합계금액을 바꾸기
 		var hap=n*${pdto.price}+"";
 		hap=hap.replace(/\B(?=(\d{3})+(?!\d))/g,",");
 		document.getElementById("hap").innerText=hap;
	 }
 	function su_sub()
 	{
 		var n=parseInt(document.getElementById("chk_su").innerText);
 		if(n>1)
        	n--;
 		document.getElementById("chk_su").innerText=n
 		// 합계금액을 바꾸기
 		var hap=n*${pdto.price}+"";
 		hap=hap.replace(/\B(?=(\d{3})+(?!\d))/g,",");
 		document.getElementById("hap").innerText=hap;
 	}
 </script>
</head>
<body>
   <div id="section" align="center">
     <div id="con_first"> <!-- 상품메인이미지, 각종 정보 -->
       <div id="left">
 		 <img src="img/${pdto.mimg}" width="400" height="400"/>       
       </div>
       <div id="right">
         <div id="in_first">
           ${pdto.pname}<br>
           ${pdto.price}원
         </div>
         <div id="su">
           <button type="button" id="btn" onclick="su_sub()"> ▼ </button>
             <span id="chk_su">1</span>
           <button type="button" id="btn" onclick="su_add()"> ▲ </button>
         </div> <br><br>
                   가격 : <span id="hap"> ${pdto.price} </span>원<p>
         <div id="menu">
           <input type="button" value="주문하기" onclick="bae_write()">
         </div>
       </div> <!-- id=right 끝 -->
        <form method="post" name="cart" action="bae_write">
          <input type="hidden" name="pcode" value="${pdto.pcode}">
          <input type="hidden" name="su">
        </form>
     </div>
     <div id="con_second" align="center">
       <img src="img/${pdto.contimg}" width="800">
     </div>
   </div>
</body>
</html>