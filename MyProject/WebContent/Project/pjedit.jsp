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
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/pjController_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/pjController_servlet/delete.do";
			document.form1.submit();
		}
	});
});

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
<h2>Modify/Delete</h2>
<form name="form1" method="post" enctype="multipart/form-data">
	<table border="1" width="1200px">
	 	<tr>
	    	<td>Name </td>
	    	<td style="text-align: left;"><input name="writer" id="wirter" value="${dto.writer}"> </td>
	  	</tr>
	  	<tr>
	    	<td>Content Of Review </td>
	    	<td style="text-align: left;"><input name="subject" id="subject" size="60" value="${dto.subject}"> </td>
	  	</tr>
	  	<tr>
	    	<td>Content </td>
	    	<td style="text-align: left;"><textarea rows="5" cols="60" name="content" id="content">${dto.content}</textarea></td>
	  	</tr>
	  	<tr>
	    	<td>Photo </td>
	    	<td style="text-align: left;">
	      	<c:if test="${dto.filesize > 0}">${dto.filename} (${dto.filesize / 1024} KB)
	        	<input type="checkbox" name="fileDel">첨부파일 삭제 <br>
	      	</c:if>
	    	<input type="file" name="file1" id="file1"> </td>
	  	</tr>
	  	<tr>
	    	<td>Password </td>
	    	<td style="text-align: left;"><input type="password" name="passwd" id="passwd"> </td>
	  	</tr>
	  	<tr>
	    	<td colspan="2" align="center">
		    <input type="hidden" name="num" value="${dto.num}">
		    <input type="button" value="Modify" id="btnUpdate">
		    <input type="button" value="Delete" id="btnDelete">
	  	</tr>
	</table>
</form>
</div>
<footer>
 	<h4 align="center">주소 : 서울특별시 강동구 천호동 12-345 Fashion Mall</h4>
 	<h4 align="center">Copyright &copy; Fashion Mall.CO.KR All rights reserved.</h4>
</footer>

</body>
</html>