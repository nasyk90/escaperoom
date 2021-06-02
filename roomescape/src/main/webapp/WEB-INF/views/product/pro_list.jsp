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
<script>
	function pro_content(pcode)
	{
	  	// 쿠키를 생성
	  	document.cookie="pcode="+pcode+";max-age=60";
	  	location="pro_content?pcode="+pcode;
	}
</script>
</head>
<body>
 <div id="section">
  <table width="1200" cellspacing="20" align="center">
   <caption><h1>상 품</h1></caption>
   <tr>
    <c:set var="chk" value="1"/>
    <c:forEach items="${list}" var="pdto">
      <td>
         <img onclick="pro_content('${pdto.pcode}')" src="img/${pdto.mimg}" width="280" height="280"> <br>
      	 ${pdto.pname} <br>
      	 <span> ${pdto.price}원 </span><br>
      </td>
     <c:if test="${chk%3 == 0 && chk != 30}">
   </tr>
   <tr>
     </c:if>
      <c:set var="chk" value="${chk+1}"/>
    </c:forEach>
    </tr>
    <!-- 페이지 출력 -->
      <tr>
       <td colspan="4" align="center"> 
       <!-- 이전페이지 이동( 1페이지, 이전그룹페이지 ) -->
       <!-- 이전 그룹페이지 이동 시작 -->
       <c:if test="${pstart != 1}">
        <a href="pro_list?pcode=${pcode}&page=${pstart-1}"> ◀◀ </a>
       </c:if>
       <c:if test="${pstart == 1}">
                   ◀◀
       </c:if>
       <!-- 이전 그룹페이지 이동 끝 -->
       <!-- 이전 1페이지 이동 시작 -->
       <c:if test="${page != 1}">
        <a href="pro_list?pcode=${pcode}&page=${page-1}"> ◀ </a>
       </c:if>
       <c:if test="${page == 1}"> 
                    ◀
       </c:if>
       <!-- 이전 1페이지 이동 끝 -->
       <!-- pstart부터 pend까지 출력 -->
       <c:forEach var="i" begin="${pstart}" end="${pend}">
         <c:if test="${page != i}"> 
           <a href="pro_list?pcode=${pcode}&page=${i}"> ${i} </a>
         </c:if>
         <c:if test="${page == i}">
           <a href="pro_list?pcode=${pcode}&page=${i}" style="color:red"> ${i} </a>
         </c:if>
       </c:forEach>    
       <!-- 다음페이지 이동( 1페이지, 다음그룹페이지)  -->   
       <!-- 1페이지 다음 이동 시작 -->
       <c:if test="${page != page_cnt}">
        <a href="pro_list?pcode=${pcode}&page=${page+1}"> ▶ </a>
       </c:if>
       <c:if test="${page == page_cnt}">
                   ▶
       </c:if>                   
       <!-- 1페이지 다음 이동 끝 -->
       <!-- 다음 그룹 페이지 이동 시작 -->
       <c:if test="${pend != page_cnt}">
        <a href="pro_list?pcode=${pcode}&page=${pend+1}"> ▶▶  </a>
       </c:if>
       <c:if test="${pend == page_cnt}">
                    ▶▶
       </c:if>
       <!-- 다음 그룹 페이지 이동 끝 -->
      </td>
      </tr>
  </table>
 </div>
</body>
</html>