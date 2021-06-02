<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  #section {
    width:1200px;
    height:700px;
    margin:auto;
  }
  #section_center {
    width:400px;
    margin:auto;
    padding-top:100px;
  }
  #a_tag{
    margin-top:20px;
  }
  #email_box{
    font-size:20px;
  }
  a:link { color: black; text-decoration: none;}
  a:visited { color: black; text-decoration: none;}
  a:hover { color: black; text-decoration: underline;}
</style>
</head>
<body>
<div id="section">
  <div id="section_center">
    <h2>이메일(아이디) 찾기</h2>
    <c:forEach items="${list }" var="mdto">  
     <%-- <c:if test="${mdto.email eq null && mdto.name eq null}">
        가입 정보를 찾을 수 없습니다.<p>
        <a href=""> 되돌아가기 </a>
      </c:if> --%>
  
        <c:if test="${mdto.email ne null}">
        <div id="email_box">
        <!-- ****이메일(아이디)의 @ 앞부분까지 자르기-->
          <c:set var="email_after" value="${fn:substring(mdto.email,0,fn:indexOf(mdto.email,'@')) }"/>
              <b>${mdto.name }</b>님의 이메일(아이디)는 <p>
            <!-- *****자른 부분 중 앞에서 두개만 보이고 -->
              <b>${fn:substring(mdto.email,0,2) }</b>
            <!--*****나머지는 '*'로 표시  -->
            <c:forEach begin="3" end="${fn:length(email_after) }">
                <b>*</b>           
            </c:forEach>
          <!-- *****@부터는 보이게(이메일주소 부분) -->
          <c:set var="email_sub" value="${fn:substring(mdto.email,fn:indexOf(mdto.email,'@'),fn:length(mdto.email))}"/>
             <b>${email_sub }</b> 입니다.
        </div>
          <div id="a_tag">
            <a href="login">로그인</a> | 
            <a href="pwd_search">비밀번호 찾기</a>
          </div>
        </c:if>
    </c:forEach> 
  </div>
</div>
</body>
</html>