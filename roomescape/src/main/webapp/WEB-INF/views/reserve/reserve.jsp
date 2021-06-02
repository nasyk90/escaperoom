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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>	
   $(function()
   {
	   $(".txt").datepicker(
	   {
		   dateFormat:"yy-mm-dd",  // 날짜 형식
		   changDay: true,
		   changeMonth: true,   
	       changeYear: true,
	       minDate: 0             // 지난 날짜 크릭 불가
	   }); 
   });   
   function search(mon)
   {
	  if(mon==0)  // 기간으로 조회
	  {
	      var start=document.getElementById("start").value;
	      var end=document.getElementById("end").value;
	      if(start <= end)
	         location="reserve?start="+start+"&end="+end;
	      else
	    	  alert("안돼요!!");
	  }
	  else  // 개월수로 조회  =>  1,  3
	  {
		  location="reserve?mon="+mon;
	  }	  
   }
   
   function theme_change(val)
   {
	   document.getElementById("line1").innerText="theme_chang()";	   
   }   
   
   function back()
   {
	   location="../main/index";	   
   }   
   var chk=new XMLHttpRequest();
   function check()
   {   
	   // open, send 메소드를 실행
	   var theme=document.form.theme.value;
	   var reserve_day=document.form.reserve_day.value;
	   var url="check?theme="+theme+"&reserve_day="+reserve_day;
	   //alert(url);
	   chk.open("get",url);  // (전송방식, 문서명?변수명=값)
	   chk.send();
   }
   chk.onreadystatechange=function()
   {
	   if(chk.readyState==4)
	   {
	        var ttt=chk.responseText.split("/");
	        for(i=0;i<ttt.length-1;i++)
	        {
	        	console.log(ttt[i]);
	            switch(ttt[i])
	            {
	               case "11:00": document.getElementsByClassName("chk")[0].disabled=true; break;
	               case "13:00": document.getElementsByClassName("chk")[1].disabled=true; break;
	               case "15:00": document.getElementsByClassName("chk")[2].disabled=true; break;
	               case "17:00": document.getElementsByClassName("chk")[3].disabled=true; break;
	               case "19:00": document.getElementsByClassName("chk")[4].disabled=true; break;
	               case "21:00": document.getElementsByClassName("chk")[5].disabled=true; break;
	            }
	        }
	   }
   }
</script>
</head>
<body>
<form method="get" action="reserve_info" name="form">
<%-- <input type="hidden" id="session_email" value="${email}">	
 --%>	<div id="section">
		<div>
			<h1 align="center"> 예약하기 </h1><p>				
		</div>
		<table align="center" cellspacing="20" width="500" id="table">
			<tr id="line1" align="center"> 
				<td width="1200" style="background:#eaeaea">테마명</td><p>
				<td width="1000"><select name="theme" required>
				<option value="">선택</option>
			   <c:forEach var="tdto" items="${list}">				
				<option value="${tdto.id}"> ${tdto.title} </option>	
			   </c:forEach>
				</select>							
				</td>
			</tr>   
		<div id="search">		   
			<tr id="line2" align="center" margin="auto">
				<td width="300" style="background:#eaeaea">날짜선택(Date)</td>			     
			    <span>  <!-- 오늘기준 날짜 보기 --> 
			       <td width="1000"> <input type="text" id="start" size="8" name="reserve_day" value="" class="txt" autocomplete="off" required></td>      
			    </span>
			</tr>
		</div>			
			<tr id="line3" align="center"> 
				<td width="150" style="background:#eaeaea">시간</td>						
				<td width="1000"> <select name="time" onchange="a_change(value)" required>
					<option value="">선택</option>				    
				    <option value="11:00" class="chk"> 11:00 </option>
				    <option value="13:00" class="chk"> 13:00 </option>
				    <option value="15:00" class="chk"> 15:00 </option>
				    <option value="17:00" class="chk"> 17:00 </option>
				    <option value="19:00" class="chk"> 19:00 </option>				    
				    <option value="21:00" class="chk"> 21:00 </option>				    
			    </select></td>								
			</tr>					
			<tr>
				<td><br></td>
			</tr>
			<tr align="right">
				<td colspan="50">
					<input type="submit" value="예약" id="btn">
					<input type="button" value="취소" onclick="back()" id="btn">
				</td>
			</tr>
		</table>		
	</div>
 </form>	
</body>
</html>