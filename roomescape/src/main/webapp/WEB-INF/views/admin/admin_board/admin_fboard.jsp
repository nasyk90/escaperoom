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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	/* 다중 선택 */
	$(document).ready(function(){
		$("#chkAll").click(function(){
			if($("#chkAll").prop("checked")){
				$(".chk").prop("checked", true);
			}else{
				$(".chk").prop("checked", false);
			}
		});
	});
	
	/* 선택 삭제 */
	$(document).ready(function(){
		$("#del").click(function(){
			var cnt = $(".chk:checked").length;
			var arr = new Array();
			var v = "1"
			$(".chk:checked").each(function(){
				arr.push($(this).val());
			});
			if(cnt == 0){
				confirm("선택된 글이 없습니다.");
			}else{
				$.ajax({
					url : 'ajax',
					type : 'POST',
					data : 'VAL=' + arr + '&CNT=' + cnt + '&v=' + v,
					dataType : 'JSON',
					success : function(data){
						if(data == "0"){
							confirm("오류입니다.");
						}else{
							location = "http://localhost/roomescape/admin/admin_board/admin_fboard";
						}
					}
					
				});
			}
			
		});
	});
</script>
</head>
<body>
<div id="section">
	<table width="1200" align="center" cellspacing="0" id="table">
		<caption><h1> 자유게시판 글삭제 </h1></caption>
		<tr align="center" id="tr1">
			<td><input type="checkbox" id="chkAll"></td>
			<td>no</td>
			<td>제목</td>
			<td>이름</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${list}" var="fdto">
		<tr class="tr2">
				<td align="center"><input type="checkbox" class="chk" name="chk" value="${fdto.id}"></td>
				<td align="center">${fdto.id}</td>
				<td>${fdto.title}</td>
				<td align="center">${fdto.name}</td>
				<td align="center">${fdto.readnum}</td>
				<td align="center">${fdto.writeday}</td>
		</tr>
		</c:forEach>
	</table>
	<div align="right" style="width:1200px; height:50px;">
		<input type="button" value="삭제" id="del">
	</div>
</div>
</body>
</html>