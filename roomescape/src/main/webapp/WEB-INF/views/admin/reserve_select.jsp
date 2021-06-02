<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function update(id){
			location="reserve_select_ok?id="+id;
	}
</script>
<style>
	#section #table {
		margin-top:100px;
		margin-bottom:100px;
	}
	#section #table #tr1 > td{
		border-top:1px solid #cccccc;
		border-bottom:1px solid #cccccc;
		height:90px; 
	}
	#section #table .tr2 > td {
		border-bottom:1px solid #cccccc;
		height:40px;
	}
	#section #table #update {
		cursor:pointer;
		display:inline-block;
		width:80px;
		height:20px;
		padding-bottom:2px;
		border:1px solid black;
	}
</style>
</head>
<body>
	<div id="section">
		<table width="1200" align="center" cellspacing="0" id="table">
			<caption><h1>관리자 예약확인</h1></caption> 
			<tr>
				<td height="50px;"></td>
			</tr>
			<tr align="center" id="tr1">
				<td>예약일</td>
				<td>테마</td>
				<td>예약자</td>
				<td>예약날짜</td>
				<td>예약시간</td>
				<td>인원수</td>
				<td>전달사항</td>
				<td>예약상태</td>
			</tr>
			
			<c:set var="state0" value="정상예약"/>
			<c:set var="state1" value="취소신청"/>
			<c:set var="state2" value="취소승인"/>
			<c:forEach items="${list}" var="rdto">
			<tr align="center" class="tr2">
				<td>${rdto.writeday}</td>
				<td>${rdto.theme}</td>
				<td>${rdto.name}</td>
				<td>${rdto.reserve_day}</td>
				<td>${rdto.intime}</td>
				<td>${rdto.su}</td>
				<td>${rdto.content}</td>
				<td>
					<c:if test="${rdto.state == 0}">
						${state0}
					</c:if>
					<c:if test="${rdto.state == 1}">
						<span id="update" onclick="update(${rdto.id})">${state1}</span>
					</c:if>
					<c:if test="${rdto.state == 2}">
						${state2}
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>