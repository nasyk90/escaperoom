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
		padding-top:100px;
		padding-bottom:100px;
	}
</style>
</head>
<body>
<div id="section" align="center">	
<form method="post" action="reserve_pass">
 <table width="600" style="border-spacing:0px; border-collapse:collapse;">
  <caption> <h1> 예약 확인</h1></caption>
	<tr>
	 <td> 이 름 </td>
	 <td> <input type="text" name="name" required> </td>
	</tr>
	<tr>
	   <td><br></td>
	</tr>	
	<tr>
	 <td> 전화번호 </td>
	 <td> <input type="text" name="phone" placeholder="- 제외하고 입력" required> </td>	 
    </tr>
    <tr>
	   <td><br></td>
	</tr>
	<tr>
	 <td colspan="2" align="center">
	 <input type="submit" value="확인하기"> </td>
	</tr>
	<tr>
	   <td><br></td>
	</tr>
  </table>     
  </form>
</div>
</body>
</html>