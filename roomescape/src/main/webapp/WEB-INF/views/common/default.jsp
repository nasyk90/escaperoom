<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{margin:0px; padding:0px;}
	/* header */
	#first {
		width:100%;
		height:30px;
		margin:auto;
		background:#060606;
	}
	#first #contain {
		width:1200px;
		height:30px;
		margin:auto;
	}
	#first #contain #login{
		float:right;
		font-size:13px;
		display:inline-block;
		margin-top:5px;
		margin-right:80px;
		color:#cccccc;
	}
	#first #contain #login > a {
		color:#cccccc;
		text-decoration:none;
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
	 #second #contain #menu a {
	 	text-decoration:none;
	 	color:#cccccc;
	 }
	 #second #contain #menu a:hover {
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
	 }
	 
	 /* footer */
	#sixth {
		width:100%;
		height:250px;
		margin:auto;
		background:#060606;
	}
	#sixth #inner {
		width:1200px;
		height:250px;
		margin:auto;
	}
	#sixth #inner #img {
		width:300px;
		height:150px;
		padding-top:50px;
		display:inline-block;
	}
	#sixth #inner #footer_text {
		display:inline-block;
		width:880px;
		height:150px;
		/* text-align:center; */
		color:white;
		padding-top:80px;
	}
</style>
<script>
	function view_sub(n)
	{
		document.getElementsByClassName("sub")[n].style.visibility="visible";
	}
	function hide_sub(n)
	{
		document.getElementsByClassName("sub")[n].style.visibility="hidden";
	}
</script> 
	<decorator:head/>
</head>
<body>
<div id="first">
	<div id="contain">
		<c:if test="${email == null}">
			<span id="login"><a href="http://localhost/roomescape/login/login">?????????</a> | <a href="http://localhost/roomescape/member/agree">????????????</a></span>
		</c:if>
		<c:if test="${email != null}">
			<c:if test="${email == 'admin@roomescape.com'}">
				<span id="login">???????????? ???????????????! | <a href="http://localhost/roomescape/login/logout">????????????</a>
				 | <a href="http://localhost/roomescape/admin/admin">Adminpage</a></span>
			</c:if>
			<c:if test="${email != 'admin@roomescape.com'}">
				<span id="login">${name}??? ???????????????! | <a href="http://localhost/roomescape/login/logout">????????????</a> 
				| <a href="http://localhost/roomescape/login/mypage/mypage_main">Mypage</a></span>
			</c:if>
		</c:if>
	</div>
</div>
<div id="second">
	<div id="contain">
		<div id="logo">
			<a href="http://localhost/roomescape/main/index" style="color:white;">
				<img src="http://localhost/roomescape/main/main_img/logo7-1.png">
			</a>
		</div>
		<div id="menu">
			<ul id="main">
				<li><a href="http://localhost/roomescape/main/sogae">RoomEscape</a></li>
				<li><a href="http://localhost/roomescape/main/theme">??????</a></li>
				<li><a href="http://localhost/roomescape/product/pro_list?pcode=&page=1">goods</a></li>
				<li onmouseover="view_sub(0)" onmouseout="hide_sub(0)">??????
					<ul class="sub">
						<li><a href="http://localhost/roomescape/reserve/reserve">????????????</a></li>
						<li><a href="http://localhost/roomescape/reserve/reserve_ok">????????????</a></li>
					</ul>
				</li>
				<li onmouseover="view_sub(1)" onmouseout="hide_sub(1)">?????????
					<ul class="sub">
						<li><a href="http://localhost/roomescape/board/g_board/g_board">????????????</a></li>
						<li><a href="http://localhost/roomescape/board/f_board/f_board">???????????????</a></li>
						<li><a href="http://localhost/roomescape/board/q_board/q_board">QnA</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
	<decorator:body/>
<div id="sixth">
	<div id="inner">
		<div id="img">
			<img src="http://localhost/roomescape/main/main_img/logo7-1.png" width="280" height="100"> 
		</div>
		<div id="footer_text">
			??? ??????????????? ??????????????? ???????????? ???????????? ??????????????? ????????? ????????? ?????? ?????????????????????<p>
			?????? : ?????????, ?????????, ?????????, ?????????, ?????????<p>
			?????? : ??????????????? ????????? ???????????????34??? 33-4
		</div>
	</div>
</div>
</body>
</html>