<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#section #table {
		margin-top:100px;
		margin-bottom:100px;
	}
	#section #table #tr1 > td {
		border-top:1px solid #cccccc;
		border-bottom:1px solid #cccccc;
		height:50px;
	} 
</style>
</head>
<body>
<div id="section">
	<table width="1200" align="center" cellspacing="0" id="table">
		<caption><h1> QnA 글삭제 </h1></caption>
		<tr align="center" id="tr1">
			<td>no</td>
			<td>제목</td>
			<td>이름</td>
			<td>조회수</td>
			<td>작성일</td>
			<td>삭제</td>
		</tr>
		<c:forEach items="${list}" var="qdto">
		<tr class="tr2">
			<form method="post" action="qboard_delete">
				<input type="hidden" name="id" value="${qdto.id}">
				<td align="center">${qdto.id}</td>
				<td>${qdto.title}</td>
				<td align="center">${qdto.name}</td>
				<td align="center">${qdto.readnum}</td>
				<td align="center">${qdto.writeday}</td>
				<td align="center"><input type="submit" value="삭제"></td>
			</form>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>