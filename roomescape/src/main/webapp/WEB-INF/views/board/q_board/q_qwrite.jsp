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
		margin-bottom:50px;
	}
	#section #aa {
		display:inline-block;
		width:400px;
		height:40px;
		border:1px solid #cccccc;
	}
	#section #bb {
		display:inline-block;
		width:1000px;
		height:40px;
		border:1px solid #cccccc;
	}
	#section #cc {
		display:inline-block;
		width:1000px;
		height:450px;
		border:1px solid #cccccc;
	}
	
	#section #table {
		border-top:1px solid #acacac;
	}
	#section #table #line1 > td {
		height:90px;
		border-bottom:1px solid #d4d4d4;
	} 
	#section #table #line2 > td {
		height:500px;
		border-bottom:1px solid #d4d4d4;
	}
	#section #table #btn {
		display:inlin-block;
		width:120px;
		height:40px;
		border:1px solid #cccccc;
		
	}
</style>
<script>
	function back(){
		history.back();
	}
</script>
</head>
<body>
<form method="post" action="q_qwrite_ok">
	<input type="hidden" name="grp" value="${qdto.grp}">
	<input type="hidden" name="seq" value="${qdto.seq}">
	<input type="hidden" name="depth" value="${qdto.depth}">
	<div id="section">
		<div>
			<h1 align="center"> 게 시 판 </h1>
			<h4 align="center"> Q n A </h4>
			<br><br>
		</div>
		<table align="center" cellspacing="0" width="1200" id="table">
			<tr id="line1" align="center">
				<td width="150" style="background:#eaeaea">이름</td>
				<td><input type="text" name="name" id="bb" value="관리자" readonly></td>
			</tr>
			<tr id="line1" align="center">
				<td width="150" style="background:#eaeaea">제목</td>
				<td colspan="3" width="900"><input type="text" name="title" id="bb"></td>
			</tr>
			<tr id="line2" align="center">
				<td style="background:#eaeaea">내용</td>
				<td colspan="3"><textarea cols="40" rows="5" name="content" id="cc"></textarea></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr align="right">
				<td colspan="4">
					<input type="submit" value="글쓰기" id="btn">
					<input type="button" value="취소" onclick="back()" id="btn">
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>