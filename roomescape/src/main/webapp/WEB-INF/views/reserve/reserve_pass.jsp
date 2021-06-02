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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="section" align="center">
 <table width="1200" style="border-spacing:0px;border-collapse:collapse;">
<caption><h1> 예약확인 </h1></caption>	<p>	
		<tr>
	      <td><br></td>
		</tr>
 		<tr id="line1" align="left"> 
			<td width="80" style="background:#eaeaea">테마</td>
			<td width="80" style="background:#eaeaea">예약일</td>
			<td width="80" style="background:#eaeaea">시간</td>
			<td width="80" style="background:#eaeaea">예약자</td>
			<td width="80" style="background:#eaeaea">인원</td>
			<td width="80" style="background:#eaeaea">연락처</td>
			<td width="80" style="background:#eaeaea">가격</td>
			<td width="80" style="background:#eaeaea">결제방식</td>			
			<td width="80" style="background:#eaeaea">취소신청</td>			
		</tr>	
		<tr>
	 	  <td><br></td>
		</tr>			   
		<c:forEach items="${list}" var="rdto">
		<c:if test="${rdto.state == 0}">
		<form method="post" align="center" action="reserve_pass_ok">
		<input type="hidden" name="id" value="${rdto.id}">
		<tr>
			<!-- <td>${rdto.id }</td>-->
			<td width="80">${rdto.theme}</td>
			<td width="80">${rdto.reserve_day}</td>
			<td width="80">${rdto.intime}</td>
			<td width="80">${rdto.name}</td>
			<td width="80">${rdto.su}명</td>
			<td width="80">${rdto.phone}</td>
			<td width="80">${rdto.pay}원</td>
			<td width="80">
			  <c:if test="${rdto.payment == 0}">현금</c:if>
			  <c:if test="${rdto.payment == 1}">카드</c:if>
			  <c:if test="${rdto.payment == 2}">네이버페이</c:if>
			  <c:if test="${rdto.payment == 3}">카카오페이</c:if>
			  <c:if test="${rdto.payment == 4}">T-money</c:if>			  
			</td>						
			<td width="80"><input type="submit" value="취소"></td>
		</tr>
		</form>
		</c:if>
		</c:forEach>
		<tr align="right">
		   <td colspan="150">		   
		   </td>
		</tr>
 	</table>
 	<p><i class="fa fa-refresh w3-spin" style="font-size:35px"></i></p> 
</div>
</body>
</html>