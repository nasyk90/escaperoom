<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin:0px;
		background:#060606;
	}
	/*
	#first {
		width:1200px;
		height:30px;
		margin:auto;
		background:#cccccc;
	}
	#first #login {
		float:right;
		font-size:13px;
		display:inline-block;
		margin-top:5px;
		margin-right:80px;
	}
	
	#second {
		width:100%;
		height:80px;
		margin:auto;
		background:#060606;
		position:relative;
		clear:both;
	}
	#second #contain {
		width:1200px;
		margin:auto;
	}
	
	#second #contain #logo {
		width:250px;
		height:80px;
		float:left;
		color:white;
	}
	
	#second #contain #menu {
		width:950px;
		height:80px;
		float:right;
		text-align:center;
		font-size:18px;
		color:#cccccc;
		
	}
	
	#second #contain #menu #main {
		width:900px;
		height:70px;
		padding-top:4px;
		position:relative;
	}
	
	 #second #contain #menu li {
	 	width:160px;
	 	height:70px;
	 	text-align:center;
	 	display:inline-block;
	 	list-style-type:none;
	 }
	 #second #contain #menu li:hover {
	 	color:#f9c059;
	 }
	 
	 #second #contain #menu .sub {
	 	position:absolute;
	 	margin-top:33px;
	 	padding-top:10px;
	 	padding-left:0px;
	 	border:1px solid black;
	 	width:160px;
	 	height:110px;
	 	z-index:10;
	 	background:black;
	 	color:white;
	 	visibility:hidden;
	 }
	 #second #contain #menu .sub li {
	 	height:35px;
	 	padding-top:2px;
	 }
	 #second #contain #menu .sub a {
	 	text-decoration:none;;
	 	color:white;
	 }
	 #second #contain #menu .sub a:hover {
	 	color:#f9c059;
	 } */
	
	#third {
		width:100%;
		height:550px;
		margin:auto;
		background:#060606;
		z-index:9;
		text-align:center;
	}
	
	#fourth {
		width:1200px;
		/* height:500px; */
		margin:auto;
		background:#060606; 
	}
	
	#fourth #table #title {
		color:white;
	}
	
	#fourth #table #theme {
		display:inline-block;
		width:200px;
		height:35px;
		border:1px solid #ffc600;;
		color:#ffc600;
		text-align:center;
		padding-top:10px;
	}
	
	#fifth {
		width:1200px;
		height:375px;
		margin:auto;
		background:#eeeeee;
	}
	
	#fifth #notice_main {
		width:1200px;
		height:120px;
		text-align:center;
		padding-top:50px;
	}
	#fifth #notice_num {
		width:1200px;
		height:190px;
		text-align:center;
		padding-top:15px;
	}
</style>
<script>
	$(document).ready(function(){
		var chk=document.getElementById("chk").value;
		if(chk == 99)
			alert("????????? ??? ?????????????????? ????????????");
	});
	function view_sub(n)
	{
		document.getElementsByClassName("sub")[n].style.visibility="visible";
	}
	function hide_sub(n)
	{
		document.getElementsByClassName("sub")[n].style.visibility="hidden";
	}
</script> 
</head>
<body>
<!-- <div id="first">
	<span id="login">????????? | ????????????</span>
</div>
<div id="second">
	<div id="contain">
		<div id="logo">
			??????
		</div>
		<div id="menu">
			<ul id="main">
				<li>??????</li>
				<li>??????</li>
				<li onmouseover="view_sub(0)" onmouseout="hide_sub(0)">goods
					<ul class="sub">
						<li>??????</li>
						<li>??????</li>
					</ul>
				</li>
				<li onmouseover="view_sub(1)" onmouseout="hide_sub(1)">??????
					<ul class="sub">
						<li>????????????</li>
						<li>????????????</li>
					</ul>
				</li>
				<li onmouseover="view_sub(2)" onmouseout="hide_sub(2)">?????????
					<ul class="sub">
						<li><a href="../board/g_board/g_board">????????????</a></li>
						<li><a href="../board/f_board/f_board">???????????????</a></li>
						<li><a href="../board/q_board/q_board">QnA</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div> -->
<input type="hidden" id="chk" value="${chk}">
<div id="third">	<!-- ?????? ?????? -->
	<img src="./main_img/main_visual0.jpg" height="550">
</div>
<div id="fourth">	<!-- ???????????? -->
	<table id="table" width="1200" align="center" cellspacing="20">
		<caption><h1 style="color:white;">?????? ??????</h1></caption>
		<c:set var="chk" value="0"/>
		<tr>
			<c:forEach items="${list}" var="tdto">
				<td align="center">
					<img src="main_img/${tdto.mimg}"><br><br>
					<span id="title">${tdto.title}</span><br><br>
					<a href="theme"><span id="theme">?????? ????????????</span></a>
					<c:set var="chk" value="${chk+1}"/>
				</td>
					<c:if test="${chk%3 == 0}">
						</tr>
						<tr>
					</c:if>
			</c:forEach>
		</tr>
	</table>
</div>
<div id="fifth">	<!-- ???????????? -->
	<img src="main_img/notice.png">
	<!-- <div id="notice_main">
		<img src="./main_img/notice-tt.png">
	</div>
	<div id="notice_num">
		<img src="./main_img/notice1.png">
		<img src="./main_img/notice2.png">
		<img src="./main_img/notice3.png">
		<img src="./main_img/notice4.png">
	</div> -->
</div>
<!-- <div id="sixth">
	<div id="footer_contain">
		
	</div>
</div> -->
</body>
</html>