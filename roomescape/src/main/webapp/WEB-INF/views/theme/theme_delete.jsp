<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="section">
		<div id="list">
			<table align="center" width="1200" id="table">
				<caption><h1>테마 삭제</h1></caption>
				<c:forEach items="${list}" var="tdto">
				<form method="post" action="theme_delete_ok">
					<input type="hidden" name="id" value="${tdto.id}">
					<tr>
						<td rowspan="2" width="350" align="center">
							<img src="../main/main_img/${tdto.mimg}" width="300" height="200">
						</td>
						<td width="650" align="center" style="border-bottom:1px solid #cccccc;">
							${tdto.title}
						</td>
						<td align="center" rowspan="2" width="200">
							<input type="submit" value="삭제">
						</td>
					</tr>
					<tr>
						<td>
							${tdto.content}
						</td>
						<%-- <td width="200" align="center">
							<c:forEach begin="1" end="${tdto.difficult}">
								<img src="main_img/star1.png" width="25">
							</c:forEach> 
							<c:forEach begin="${tdto.difficult}" end="4">
								<img src="main_img/star2.png" width="25">  
							</c:forEach>
						</td> --%>
					</tr>
					<tr>
						<td height="50"></td>
					</tr>
				</form>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>