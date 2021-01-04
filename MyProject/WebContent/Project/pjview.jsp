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

td{text-align: center;}

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

<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/pjController_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action="${path}/pjController_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/pjController_servlet/pass_check.do";
		document.form1.submit();
	});
	
	
});
function comment_add(){
	var param=
	"board_num=${dto.num}&writer2="+$("#writer2").val()
	+"&content2="+$("#content2").val();
	$.ajax({
		type: "post",
		url: "${path}/pjController_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer2").val("");
			$("#content2").val("");
			comment_list();
		}
	});
}


function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/pjController_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}

</script>

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
<div align="center">
<h2>Review</h2>
<form name="form1" method="post">
<table border="1" width="1200px">
	<tr>
		<td>Date</td>
		<td>${dto.reg_date}</td>
		<td>Number Of Hits</td>
		<td>${dto.readcount}</td>
	</tr>
	<tr>
		<td>Name</td>
		<td style="text-align: left;" colspan="3">&nbsp${dto.writer}</td>
	</tr>
	<tr>
		<td>Content Of Review</td>
		<td style="text-align: left;" colspan="3">&nbsp${dto.subject}</td>
	</tr>
	<tr>
		<td>Content</td>
		<td style="text-align: left;" colspan="3">&nbsp${dto.content}</td>
	</tr>
	<tr>
		<td>Password</td>
		<td style="text-align: left;" colspan="3">&nbsp
			<input type="password" name="pawd" id="pawd">
			<c:if test="${param.message == 'error' }">
				<span style="color:red;">
					비밀번호가 일치하지 않습니다.
				</span>
			</c:if>
		</td>
	</tr>

	<tr>
		<td>Photo</td>
		<td style="text-align: left;" colspan="3">&nbsp
			<c:if test="${dto.filesize > 0}">
				${dto.filename}( ${dto.filesize} bytes )
	<a style="color: red;" href="${path}/pjController_servlet/download.do?num=${dto.num}">
	[DOWNLOAD]</a>
			</c:if>
		</td>
	</tr>
 	<tr>
		<td colspan="4" align="center">
			<input type="hidden" name="num" value="${dto.num}">
			<input type="button" value="Modify/Delete" id="btnEdit">
			<input type="button" value="Answer" id="btnReply">
			<input type="button" value="List" id="btnList">
		</td>
	</tr>
</table>
</form>
<br>
<table width="1200px">
  <tr>
    <td><input id="writer2" placeholder="이름"> </td>
    <td rowspan="2">
    </td>
  </tr>
  <tr>
    <td> <textarea rows="5" cols="80" 
    placeholder="내용을 입력하세요" id="content2"></textarea>
    </td>
  </tr>
</table>
<button id="btnSave" type="button">Leave A Comment</button>
<br><br>

 <div id="commentList"></div>
</div>
<footer>
 	<h4 align="center">주소 : 서울특별시 강동구 천호동 12-345 Fashion Mall</h4>
 	<h4 align="center">Copyright &copy; Fashion Mall.CO.KR All rights reserved.</h4>
</footer>

</body>
</html>