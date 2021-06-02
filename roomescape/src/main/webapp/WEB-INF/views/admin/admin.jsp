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
		height:500px;
		margin:auto;
	}
	#section #title {
		text-align:center;
	}
	#section #main {
		list-style-type:none;
		position:relative;
	}
	#section #main .sub {
		list-style-type:none;
	}
</style>
</head>
<body>
	<div id="section">
	<div id="title"><h1>관리자 페이지</h1></div>
		<ul id="main">
			<li>상품
				<ul class="sub">
					<li><a href="pro_write">상품등록</a></li>
					<!-- <li>상품관리</li> -->
				</ul>
			</li>
			<li>테마
				<ul class="sub">
					<li><a href="../theme/theme_write">테마 등록</a></li>
					<li><a href="../theme/theme_delete">테마 삭제</a></li>
				</ul>
			</li>
			<li>예약
				<ul class="sub">
					<li><a href="reserve_select">예약확인</a></li>
					<li></li>
				</ul>
			</li>
			<li>게시판
				<ul class="sub">
					<li><a href="admin_board/admin_fboard">자유게시판</a></li>
					<li><a href="admin_board/admin_qboard">QnA</a></li>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>