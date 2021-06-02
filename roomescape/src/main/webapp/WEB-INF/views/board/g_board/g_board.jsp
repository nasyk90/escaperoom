<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$(".board").mouseover(function(){
			$(this).css("background","black").css("color","white");
		});
		$(".board").mouseout(function(){
			$(this).css("background","white").css("color","black");
		});
	});
	
	function move(n){
		if(n==1){
			location="g_board";
		}else if(n==2){
			location="../f_board/f_board";
		}else{
			location="../q_board/q_board";
		}
	}
</script>
<style>
	#section {
		width:1200px;
		margin:auto;
		margin-bottom:50px;
		/* padding-right:17px; */
	}
	#section a {
		text-decoration:none;
		color:black;
	}
	#section #board_name {
		width:1200px;
		height:170px;
		margin:auto;
		padding:0px;
	}
	#board_name #main {
		padding:0px;
		margin:0px;
		padding-top:20px;
		border-bottom:2px solid black;
	}
	#board_name #main .board{
		text-align:center;
	 	display:inline-block;
	 	list-style-type:none;
	 	width:120px;
	 	height:50px;
	 	padding-top:20px;
	}
	#main .board > a:hover {
	 	background:black;
	 	color:white;
	}
	#table a:hover {
		text-decoration:underline;
	}
	
	#table td {
		height:40px;
	}
	#table #first_tr > td {
		border-top:1px solid #acacac;
		border-bottom:1px solid #acacac;
		height:80px;
	}
	#table #second_tr > td{
		border-bottom:1px solid #d4d4d4;
		height:50px;
	} 
	#write {
		display:inline-block;
		width:100px;
		height:30px;
		border:1px solid #acacac; 
		text-align:center;
		padding-top:10px;
	}
	#write:hover{
		text-decoration:none;
	}
	#page  span {
		display:inline-block;
		width:40px;
		height:30px;
		border:1px solid #acacac;
		text-align:center;
		padding-top:10px;
	}
</style>
</head>
<body>
<div id="section">
	<h1 align="center"> 게시판 </h1>
	<h4 align="center"> 공지사항 </h4>
	<br><br>
	<div id="board_name">
		<ul id="main">
			<li class="board" onclick="move(1)">공지사항</li>
			<li class="board" onclick="move(2)">자유게시판</li>
			<li class="board" onclick="move(3)">QnA</li>
		</ul>
	</div>
	<div id="table">
		<table width="1200" align="center" cellspacing="0">
			<tr align="center" id="first_tr">
				<td>no</td>
				<td>제목</td>
				<td>이름</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<c:forEach items="${list}" var="gdto">
				<tr id="second_tr">
					<td width="50" align="center">${gdto.id}</td>
					<td width="400"><a href="g_readnum?id=${gdto.id}&page=${page}">${gdto.title}</a></td>
					<td width="100" align="center">관리자</td>
					<td width="50" align="center">${gdto.readnum}</td>
					<td width="100" align="center">${gdto.writeday}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5"><br></td>
			</tr>
			<tr align="right">
				<c:if test="${email == 'admin@roomescape.com'}">
					<td colspan="5"><a href="g_write" id="write">글쓰기</a></td>
				</c:if>
			</tr>
			<tr id="page">
				<td  colspan="5" align="center">
					<c:if test="${pstart != 1}">
						<a href="g_board?page=${pstart-1}"><span>◁</span></a>
					</c:if>
					<c:if test="${pstart == 1}">
						<span>◁</span>
					</c:if>
					<c:if test="${page != 1}">
						<a href="g_board?page=${page-1}"><span>◀</span></a>
					</c:if>
					<c:if test="${page == 1}">
						<span>◀</span>
					</c:if>
					<c:set var="i" value="1"/>
					<c:forEach var="i" begin="${pstart}" end="${pend}"> 
			    		<c:if test="${page != i}"> 
			    			<a href="g_board?page=${i}"><span>${i}</span></a>
			    		</c:if>
			    		<c:if test="${page == i}">
			    			<a href="g_board?page=${i}" style="color:red"><span style="background:#acacac;">${i}</span></a>
			    		</c:if>
			    	</c:forEach>
			    	<c:if test="${page != page_cnt}">
			    		<a href="g_board?page=${page+1}"><span>▶</span></a>
					</c:if>
					<c:if test="${page == page_cnt}">
						<span>▶</span>
					</c:if>
					<c:if test="${pend != page_cnt}">
						<a href="g_board?page=${pend+1}"><span>▷</span></a>
					</c:if>
					<c:if test="${pend == page_cnt}">
						<span>▷</span>
					</c:if>
		    	</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>