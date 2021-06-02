<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#pwd {
		display:inline-block;
		width:500px;
		height:30px;
	}
	#sub {
		display:inline-block;
		width:120px;
		height:37px;
		padding-top:px;
		background:#ffffff;
		border:1px solid #cccccc;
	}
</style>
</head>
<body>
<form name="password" method="post" action="f_delete">
	<div style="width:1200px;margin:auto;height:500px;text-align:center;padding-top:170px;">
		<h1>삭제하기</h1>
		<h3>비밀번호 입력</h3>
		<br>
		<br><br> 
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" name="page" value="${page}">
		<input id="pwd" type="password" name="pwd" placeholder="비밀번호 입력"><br><br>
		<input id="sub" type="submit" value="삭제하기"> 
	</div>
</form>
</body>
</html>