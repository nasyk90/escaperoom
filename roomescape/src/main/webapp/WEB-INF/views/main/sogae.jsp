<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style>
	#section {
		width:1200px;
		margin:auto;
	}
	#section1 {
		width:1200px;
		text-align:center;
		padding-bottom:80px;
	}
	#section2 {
		width:1200px;
		text-align:center;
		padding-bottom:80px;
	}
	#section3 {
		width:1200px;
		text-align:center;
		padding-bottom:80px;
	}
	
	#section3 #table1 #line1 td {
		background:#ffcc00;
		border:1px solid black;
		height:70px;
	}
	#section3 #table1 #line td {
		border-bottom:1px solid #cccccc;
		height:70px;
	}
	#section4 {
		width:1200px;
		padding-bottom:80px;
	}
	#section4 #inner {
		width:1200px;
		text-align:center;
	}
</style>
</head>
<body>
<div id="section">
	<div id="section1">
		<h1>소 개</h1>
		<img src="main_img/sub1_1.jpg" width="1200" height="700">
	</div>
	<div id="section2">
		<h1>찾아오시는 길</h1>
		<img src="main_img/map.JPG"><br><br>
	</div>
	<div id="section3">
		<h1>가격표</h1>
		<table width="1200" id="table1" cellspacing="0">
			<tr id="line1">
				<td>테마</td>
				<td>2명</td>
				<td>3명</td>
				<td>4명</td>
				<td>5명</td>
			</tr>
			<tr id="line">
				<td>미대생의 죽음</td>
				<td>44,000원</td>
				<td>54,000원</td>
				<td>68,000원</td>
				<td>75,000원</td>
			</tr>
			<tr id="line">
				<td>악마를 보았다</td>
				<td>44,000원</td>
				<td>54,000원</td>
				<td>68,000원</td>
				<td>75,000원</td>
			</tr>
			<tr id="line">
				<td>버스안에서</td>
				<td>44,000원</td>
				<td>54,000원</td>
				<td>68,000원</td>
				<td>75,000원</td>
			</tr>
		</table>
	</div>
	<div id="section4">
		<div id="inner"><h1>주의 및 공지사항</h1></div>
		<table>
			<tr>
				<td width="100" align="center">
					<span class="material-icons">
						camera_alt
					</span>
				</td>
				<td>
					<h4 style="color:#ffcc00;">사진촬영금지</h4>
					방탈출 장소에 구비된 모든 인테리어, 소품, 추리과정 및 탈출 과정은 기밀로 유지되어야 합니다.<br>
					고객님들은 방탈출에 참여함과 동시에 기밀 유지에 동의하는 것으로 간주되며,<br>
					고객님들의 고의 또는 과실로 인하여 관련 사항이 노출될 경우, 민/형사상 책임을 부담할 수 있습니다.<br>
				</td>
			</tr>
			<tr>
				<td align="center">
					<span class="material-icons">
						priority_high
					</span>
				</td>
				<td>
					<h4 style="color:#ffcc00;">위험물품 반입금지</h4>
					위험한 물품은 룸에 반입이 금지됩니다. 게임 방이 밀폐가 되는 공간이기 때문에 고객님의 본인과 타인의<br>
					안전을 위해서 위험물품을 지닌 채 입장이 불가합니다.<br>
				</td>
			</tr>
			<tr>
				<td align="center">
					<span class="material-icons">
						tag_faces
					</span>
				</td>
				<td>
					<h4 style="color:#ffcc00;">안전유의</h4>
					저희는 고객님의 안전을 최우선으로 생각합니다.<br>
					그렇기 때문에 게임 중 위험한 상황을 유발하는 돌발행동을 자제해 주시기 바랍니다.<br>
					게임 중의 위험한 행동을 통해서 해결할 수 있는 문제는 없습니다.<br>
				</td>
			</tr>
			<tr>
				<td align="center">
					<span class="material-icons">
						error
					</span>
				</td>
				<td>
					<h4 style="color:#ffcc00;">물품 파손 주의</h4>
					방탈출에 있는 모든 아이템들은 정밀한 기계시스템으로 컨트롤하고 있습니다.<br>
					물품을 억지로 다룰 경우 부서질 위험이 있기 때문에 유의해주시기 바랍니다.<br>
					고객님들의 실수로 인해 물품이 파손된 경우 배상의 책임을 지실 수 있습니다.<br>
				</td>
			</tr>
			<tr>
				<td align="center">
					<span class="material-icons">
						escalator_warning
					</span>
				</td>
				<td>
					<h4 style="color:#ffcc00;">폐쇄공포증 환자, 임산부/노약자 출입 제한</h4>
					일부 테마에는 자극적이거나 선정적인 요소가 일부 포함될 수 있으므로 노약자, 임산부의 경우 참가가 제한될 수 있습니다.<br>
					또한 폐쇄공포증 등의 원인으로 좁고 폐쇄된 공간에 머무리기 어려운 참가자는 게임 시작전에 직원에게 미리 그와 같은 사정을<br>
					알려야 하며, 경우에 따라서는 게임 참가가 제한될 수 있습니다.<br>
					다만, 유아/어린이의 경우 법정대리인의 서면 동의가 있거나 어른과 함께 게임에 참가하는 경우에는 게임 참가가 가능하며<br>
					이 경우 법정대리인이나 함께 게임에 참여하는 성인이 게임의 내용 및 특징에 대한 사항을 유아/어린이에게 충분히 설명하여야 합니다.<br>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>