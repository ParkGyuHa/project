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
	$("#btnWrite").click(function(){ location.href="${path}/Project/pjwrite.jsp";
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
<h2>Search Results</h2>

<form name="form1" method="post" action="${path}/pjController_servlet/search.do">
	<select name="search_option">
		<c:choose>
		<c:when test="${search_option == 'writer' }">
	  		<option value="writer" selected>Name</option>
	  		<option value="subject">Content Of Review</option>
	  		<option value="content">Content</option>
	  		<option value="all">Name+Content Of Review+Content</option>
	  	</c:when>
		<c:when test="${search_option == 'subject' }">
	  		<option value="writer">Name</option>
			<option value="subject" selected>Content Of Review</option>
			<option value="content">Content</option>
			<option value="all">Name+Content Of Review+Content</option>
	  	</c:when>
		<c:when test="${search_option == 'content' }">
			<option value="writer">Name</option>
			<option value="subject">Content Of Review</option>
			<option value="content" selected>Content</option>
			<option value="all">Name+Content Of Review+Content</option>
	  	</c:when>
		<c:when test="${search_option == 'all' }">
	  		<option value="writer">Name</option>
	  		<option value="subject">Content Of Review</option>
	  		<option value="content">Content</option>
	  		<option value="all" selected>Name+Content Of Review+Content</option>
	  	</c:when>
		</c:choose>
	</select>
	<input name="keyword" value="${keyword}">
	<button id="btnSearch">Search</button>
</form>
<br>

<table border="1" width="1200px">
	<tr>
    	<th>No. </th>
    	<th>Name </th>
    	<th>Content Of Review </th>
	    <th>Date </th>
	    <th>Number Of Hits </th>
	    <th>Photo </th>
	    <th>Download Count </th>
	</tr>
	<c:forEach var="dto" items="${list}">
 	<c:choose>
  	<c:when test="${dto.show == 'y'}">
  	<tr>
    	<td>${dto.num} </td>
    	<td>${dto.writer} </td>
    	<td>
    <c:forEach var="i" begin="1" end="${dto.re_level}">&nbsp;&nbsp;
    </c:forEach>
    <a href="${path}/pjController_servlet/view.do?num=${dto.num}">${dto.subject}</a>
    <c:if test="${dto.comment_count > 0 }">
      <span style="color: red;">(${dto.comment_count})</span>
    </c:if>  
    	</td>
    <td>${dto.reg_date} </td>
    <td>${dto.readcount} </td>
    <td align="center">
      <c:if test="${dto.filesize > 0}">
        <a href="${path}/pjController_servlet/download.do?num=${dto.num}">
          <img src="../images/file.gif">
        </a>
      </c:if>
    </td>
    
    <td>${dto.down}</td>
  </tr>
  </c:when>
  <c:otherwise>
   <tr>
     <td>${dto.num} </td>
     <td colspan="6" align="center">삭제된 후기입니다. </td>
   </tr>
  </c:otherwise>
 </c:choose> 
</c:forEach>  
</table>
<br><br>
<button id="btnWrite">Leave A Review</button>
</div>
<footer>
 	<h4 align="center">주소 : 서울특별시 강동구 천호동 12-345 Fashion Mall</h4>
 	<h4 align="center">Copyright &copy; Fashion Mall.CO.KR All rights reserved.</h4>
</footer>

</body>
</html>