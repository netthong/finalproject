<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>room_list</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">

.tb-container {
 display: flex;
	flex-wrap: inherit;
	align-items: center;
	justify-content: space-between;
	width: 58%;
	margin-right: auto;
	margin-left: auto;
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0;
	padding: var(- -bs-navbar-padding-y) var(- -bs-navbar-padding-x);
	text-decoration: none;
}

.aside {
	display: flex;
	flex-wrap: inherit;
	align-items: center;
	justify-content: space-between;
	margin-top: 20px;
	margin-right: auto;
	margin-left: auto;
	
}

.navbar-a {
	display: flex;
	flex-wrap: inherit;
	align-items: center;
	justify-content: space-between;
	width: 100%;
	padding-right: calc(var(- -bs-gutter-x)* .5);
	padding-left: calc(var(- -bs-gutter-x)* .5);
	margin-right: auto;
	margin-left: auto;
	max-width: 1320px; -
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0;
	padding: var(- -bs-navbar-padding-y) var(- -bs-navbar-padding-x);
	text-decoration: none;
	color: white;
	font-size: 30px;
	font: bold;
}

.navbar-a:link {
	color: white;
}

.navbar-a:visited {
	color: white;
}

.navbar-a:hover {
	color: white;
}

.info-1 {
   display: flex;
	flex-wrap: inherit;
	align-items: center;
	justify-content: space-between;
	width: 58%;
	margin-right: auto;
	margin-left: auto;
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0;
	padding: var(- -bs-navbar-padding-y) var(- -bs-navbar-padding-x);
	text-decoration: none;

}

.move {
   display: flex;
	flex-wrap: inherit;
	align-items: center;
	justify-content: space-between;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0;
	padding: var(- -bs-navbar-padding-y) var(- -bs-navbar-padding-x);
	text-decoration: none;

}

</style>

<script type="text/javascript">



$(function(){
	$("#btnwrite2").click(function(){
		//???????????? ??????
		location.href="${path}/owner/list.do";
	});
});

</script>

</head>

<body>
<%@ include file="../common/owner_nav.jsp" %>

<nav class="navbar navbar-expand-md bg-secondary">&nbsp;</nav>
<nav class="navbar navbar-expand-md bg-secondary">
<a class="navbar-a">&nbsp;??? ??????</a></nav>

<aside class="aside">
			<jsp:include page="../common/ownersidebar.jsp" />
	</aside>
	
<div class="info-1">
<c:choose>
	<c:when test="${count == 0}">
		<p class="content-1">??? ????????? ???????????????.</p>
	</c:when>
	<c:otherwise>
	${count}?????? ?????? ????????????.
	</c:otherwise>
</c:choose>
</div>


<div class="tb-container">
<table border="1" style="width: 100%;">
	<tr>
	  <th>?????????</th>
		<th>?????????</th>
		<th>?????????</th>
		<th>?????????</th>
		<th>??????</th>
		<th>?????????</th>
	</tr>
<c:forEach var="row" items="${list}">
	<tr>
	  <td>${row.room_no} <br>
	   <input type="hidden" value="${row.building_code}">
	   <input type="hidden" value="${row.building_name }">
	  </td>
		<td>${row.room_name}</td>
		<td><img src="${path}/resources/images/${row.picture_url}"
					width="100px" height="100px"></td>	
		<td>${row.room_amount}</td>
		<td>&nbsp; ${row.room_size}</td>
		<td><fmt:formatNumber value="${row.room_price}"
					pattern="#,###" />
		  <br>
		  <a href="${path}/room/edit/${row.room_no}">[??????]</a>
		</td>
				
	</tr>
</c:forEach>	
</table>
</div>
<button class="move" type="button" id="btnwrite2">?????? ??????</button>
<%@ include file="../common/footer.jsp" %>
</body>
</html>