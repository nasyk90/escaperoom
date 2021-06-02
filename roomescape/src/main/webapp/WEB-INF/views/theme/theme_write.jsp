<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<div id="section">
	
	<form method="post" action="theme_write_ok" enctype="multipart/form-data">
		<table width="600" align="center">
		<caption><h1>테마 등록</h1></caption>
			<tr>
				<td>테마명</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>난이도</td>
				<td><input type="text" name="difficult"></td>
			</tr>
			<tr>
				<td>테마소개</td> 
				<td><textarea rows="5" cols="40" name="content"></textarea></td>
			</tr>
			<tr>
				<td>테마 이미지</td>
				<td><input type="file" name="mimg"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>