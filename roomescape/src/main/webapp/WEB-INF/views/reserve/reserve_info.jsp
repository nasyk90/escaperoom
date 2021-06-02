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
		margin:auto;
		padding-top:100px;
		padding-bottom:100px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>  
   function a_change(val)   //2,3,4,5명의 가격을 절대값으로 수정
   {
	   if(val==2)
		   document.getElementById("pp").value=44000;
	   else if(val==3)
		   document.getElementById("pp").value=54000;
	   else if(val==4)
		   document.getElementById("pp").value=68000;
	   else
		   document.getElementById("pp").value=75000; 	 
   }   
   
   function back()
   {
	   location="../reserve/reserve";	   
   }   
</script>
</head>
<body>
<form method="post" action="reserve_insert">	
    <input type="hidden" name="theme" value="${theme}">
	<div id="section">
		<div>
			<h1 align="center"> 예약정보입력 </h1><p>				
		</div>		   
		<table align="center" cellspacing="20" width="1200" id="table">
			<tr id="line1" align="center"> 
				<td width="200" style="background:#eaeaea">테마명</td>
				<td width="600">${title}</td>
			</tr>  		
		<div id="search">		   
			<tr id="line2" align="center">
				<td width="150" style="background:#eaeaea">날짜</td>			     
			    <td width="900"><input type="text" name="reserve_day" id="aa" value="${reserve_day}" readonly></td> 			    
			</tr>
		</div>
			<tr id="line3" align="center"> 
				<td width="150" style="background:#eaeaea">시간</td>
				<td width="900"><input type="text" name="intime" id="bb" value="${time}" readonly></td>
			</tr>
			<tr id="line4" align="center"> 
				<td width="150" style="background:#eaeaea">예약자</td>
				<td width="900">${name}</td>
			</tr>
			<tr id="line5" align="center"> 
				<td width="150" style="background:#eaeaea">연락처</td>
				<td width="900"><input type="text" name="phone" id="cc" placeholder="- 제외하고 입력" required></td>
			</tr>
			<tr id="line6" align="center"> 
				<td width="150" style="background:#eaeaea">인원</td>						
				<td width="900"> <select name="su" onchange="a_change(value)" required>
				    <option value="">선택</option>					    
				    <option value="2"> 2명 </option>
				    <option value="3"> 3명 </option>
				    <option value="4"> 4명 </option>
				    <option value="5"> 5명 </option>
			    </select></td>								
			</tr>
			<tr id="line7" align="center"> 
				<td width="150" style="background:#eaeaea">가격</td>
				<td width="900"><input type="text" name="pay" id="pp" value="${pay}">원</td>
			</tr>			
			<tr id="line8" align="center"> 
				<td width="150" style="background:#eaeaea">결제방식</td>
				<td width="900"><input type="radio" name="payment" id="ch" value="0" checked="checked">현금
				<input type="radio" name="payment" id="cd" value="1">카드
				<input type="radio" name="payment" id="ny" value="2">네이버페이	
				<input type="radio" name="payment" id="ky" value="3">카카오페이	
				<input type="radio" name="payment" id="ty" value="4">T-money										
				</td>				
			</tr>
			<tr id="line9" align="center"> 
				<td width="150" style="background:#eaeaea">관리자 전달</td>			
				<td width="900"><textarea rows="5" cols="35" name="content"></textarea></td>            
			</tr>
			<tr>			
				<td><br></td>
			</tr>
			
			<tr align="right">
				<td colspan="150">
					<input type="submit" value="예약" id="btn" <c:if test="${kk==1}">disabled</c:if>> <!-- 중복 예약시 값이 DB넘어가는 부분 해결 -->
					<input type="button" value="취소" onclick="back()" id="btn">
				</td>
			</tr>
	   				
		</table>
		<c:if test="${kk==1}">
			<div style="color:red" align="center"><h2>-----*예약이 되어 있는 내용입니다. 다시 예약해주십시요*-----</h2></div>
	   	</c:if>	
	   	<tr>			
		 <td><br></td>
		</tr>
	</div>
 </form>
</body>
</html>