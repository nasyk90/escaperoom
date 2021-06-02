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
		margin-bottom:50px;
	}
	#section #table #aa > td {
		height:70px;
		border-top:1px solid #acacac;
		border-bottom:1px solid #d4d4d4;
	}
	#section #table #bb td {
		height:70px;
		border-bottom:1px solid #d4d4d4;
	}
	#section #table #cc td {
		border-bottom:1px solid #d4d4d4;
	}
	#section #table #cc #cc_inner {
		width:1100px;
		height:500px;
		margin:20px;
	}
	#link {
		display:inline-block;
		width:120px;
		height:30px;
		padding-top:7px;
		border:1px solid #acacac;
		text-align:center;
		text-decoration:none;
		color:black;
	}
</style>
</head>
<div id="section">
	<div>
		<h1 align="center"> 게 시 판 </h1>
		<h4 align="center"> 공지사항 </h4>
		<br><br>
	</div>
	<table  id="table" width="1200" align="center" cellspacing="0">
		<tr id="aa">
			<td width="100" height="30" colspan="5">제목 : ${gdto.title}</td>
		</tr>
		<tr id="bb">
			<td height="30" width="250"> 글쓴이 : 관리자</td>
			<td height="30" width="250">작성일  : ${gdto.writeday}</td>
			<td height="30" width="250">조회수  : ${gdto.readnum}</td>
			<td width="250"></td>
			<td width="200"></td>
		</tr>
		<tr id="cc">
			<td colspan="5">
				<div id="cc_inner">
					${gdto.content}
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="5"><br></td>
		</tr>
		<tr id="dd">
			<td colspan="5" align="right" height="50"> 
				<c:if test="${email == 'admin@roomescape.com'}">
					<a href="g_update?id=${gdto.id}&page=${page}" id="link">수정</a>
					<a href="g_delete?id=${gdto.id}&page=${page}" id="link">삭제</a>
				</c:if>
				<a href="g_board?page=${page}" id="link">목록</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>