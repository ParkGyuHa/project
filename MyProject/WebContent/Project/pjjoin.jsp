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

#joinform{
	width: 300px;
	margin: auto;
	border: 1px solid black;
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

</style>

</head>
<body>

<div>
	<div align="right">
	<ol>
 		<li><a href="${path}/Project/pjlogin.jsp">Login</a></li>
 		<li><a href="${path}/Project/pjjoin.jsp">Join</a></li>
 		<li><a href="#" onclick="alert('로그인 후 이용해주세요.')">Review&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
	</ol>
	</div>
	<div>
		<h1 align="center"><a href="${path}/Project/pjmain.jsp">Fashion Mall</a></h1>
	</div>
	<hr>
</div>

<div align="center">
	<ol>
		<li><a href="${path}/Project/pjbest.jsp">BEST&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
		<li><a href="${path}/Project/pjtop.jsp">TOP&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
		<li><a href="${path}/Project/pjpants.jsp">PANTS&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
		<li><a href="${path}/Project/pjshoes.jsp">SHOES&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
		<li><a href="${path}/Project/pjacc.jsp">ACC&nbsp&nbsp&nbsp&nbsp&nbsp</a></li>
	</ol>
	<hr>
</div>

<div align="center">
	<h1>Join</h1>
	<section id="joinform">
		<form name="formpjjoin" action="${path}/pjController_servlet/insert.do" method="post"><br><br>
				<label>Id : </label>
				<input type="text" name="userid" id="userid" required="required"/><br><br> 
				<label>Password : </label>
				<input type="Password" name="passwd" id="passwd" required="required"/><br><br> 
				<label>Name : </label>
				<input type="text" name="name" id="name" required="required"/><br><br> 
				<label>Email : </label>
				<input type="text" name="email" id="email" required="required"/><br><br> 
				<label>Phone : </label>
				<input type="text" name="phone" id="phone" required="required"/><br><br> 
				<input type="submit" onClick="alert('회원가입이 완료되었습니다.')" value="회원가입")></input><br><br>
		</form>
	</section>
</div>

<footer>
 	<h4 align="center">주소 : 서울특별시 강동구 천호동 12-345 Fashion Mall</h4>
 	<h4 align="center">Copyright &copy; Fashion Mall.CO.KR All rights reserved.</h4>
</footer>

</body>
</html>