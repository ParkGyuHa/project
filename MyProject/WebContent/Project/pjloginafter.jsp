<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>

<style type="text/css">

ol {list-style: none;}
ol li{display: inline; padding: 0 15px; letter-spacing: 5px;}
ol li a {text-decoration: none; color: gray;}

a {
	text-decoration: none; color: black;
}

footer{ 
	position:fixed; 
	left:0px; 
	bottom:0px; 
	height:100px; 
	width:100%; 
	background:grey; 
	color: white; 
}

table {
	border-spacing: 15px;
}

</style>

</head>
<body>

<div>
	<div align="right">
	<ol>
 		<li><a href="${path}/Project/pjlogin.jsp">Logout</a></li>
 		<li><a href="${path}/pjController_servlet/list.do">Review&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
	</ol>
	</div>
	<div>
		<h1 align="center"><a href="${path}/Project/pjloginafter.jsp">Fashion Mall</a></h1>
	</div>
	<hr>
</div>

<div align="center">
	<ol>
		<li><a href="${path}/Project/pjbest2.jsp">BEST&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
		<li><a href="${path}/Project/pjtop2.jsp">TOP&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
		<li><a href="${path}/Project/pjpants2.jsp">PANTS&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
		<li><a href="${path}/Project/pjshoes2.jsp">SHOES&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
		<li><a href="${path}/Project/pjacc2.jsp">ACC&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
	</ol>
	<hr>
</div>

<table align="center">
 	<tr>
  		<th><a href="#"><img src="../images/1.png"></a></th>
  		<th><a href="#"><img src="../images/2.png"></a></th>
  		<th><a href="#"><img src="../images/3.png"></a></th>
  		<th><a href="#"><img src="../images/4.png"></a></th>
 	</tr>
 	<tr>
  		<td style="color: black;">타임 블렌 코트 3종 기획전</td>
  		<td style="color: black;">픽션 덤블배색 후드집업</td>
  		<td style="color: black;">핫팩 푸퍼 숏패딩+타임 블렌 코트 3종</td>
  		<td style="color: black;">연말준비 코디세트</td>
 	</tr>	
  	<tr>
  		<td style="color: gray;">[1+1+1] [당일발송]</td>
  		<td style="color: gray;">[당일발송]</td>
  		<td style="color: gray;">[1+1]</td>
  		<td style="color: gray;">[1+1+1]</td>
 	</tr>
 	<tr>
  		<td style="color: red;">1~3(95~130)</td>
  		<td style="color: red;">1~2(95~120)</td>
  		<td style="color: red;">1~3(95~130)</td>
  		<td style="color: red;">상의 (95~130), 하의 (28~38)</td>
 	</tr>
 	<tr>
  		<td style="color: black;">89,700원</td>
  		<td style="color: black;">59,800원</td>
  		<td style="color: black;">79,700원</td>
  		<td style="color: black;">39,800원</td>
 	</tr>
</table>

<footer>
 	<h4 align="center">주소 : 서울특별시 강동구 천호동 12-345 Fashion Mall</h4>
 	<h4 align="center">Copyright &copy; Fashion Mall.CO.KR All rights reserved.</h4>
</footer>

</body>
</html>