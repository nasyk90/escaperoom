<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	#section {
		width:1200px;
		margin:auto;
		padding-top:100px;
		padding-bottom:100px;
	}
</style>
 <script>
   function gen_num()
   {
	   var now=new Date();
	   var yy=now.getFullYear()+"";
	   var mm=(now.getMonth())+1+"";
	   var dd=now.getDate();
	   code="p"+yy+mm+dd
	   document.product.pcode.value=code;
	  /*  for(i=0;i<val.length;i++)
	   {
		   
	   } */
   }
 </script>
</head>
<body>
<div id="section">
	<form name="product" method="post" action="pro_write_ok" enctype="multipart/form-data">
	 <table width="600" align="center">
	  <caption> <h3> 상품 등록 </h3></caption>
	   <tr>
	     <td> 상품코드 </td>
	     <td> <input type="text" name="pcode"> </td>
	     <td><input type="button" onclick="gen_num()" value="코드생성"></td>
	   </tr>	<!-- 상품코드 폼 -->
	   <tr>
	     <td> 상품메인이미지 </td>
	     <td colspan="2"> <input type="file" name="mimg"> </td>
	   </tr>
	   <tr>
	     <td> 상품명 </td>
	     <td colspan="2"> <input type="text" name="pname"> </td>
	   </tr>
	   <tr>
	     <td> 가격 </td>
	     <td colspan="2"> <input type="text" name="price"> </td>
	   <tr>
	     <td> 상품수량 </td>
	     <td colspan="2"> <input type="text" name="su"> </td>
	   </tr>
	   <tr>
	     <td> 제품상세이미지 </td>
	     <td colspan="2"> <input type="file" name="contimg"> </td>
	   </tr>
	   <tr>
	     <td colspan="3"> <input type="submit" value="상품등록"> </td>
	   </tr>
	  </table>
	</form>
</div>
</body>
</html>