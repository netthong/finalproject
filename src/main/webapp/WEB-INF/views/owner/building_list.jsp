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
<title>owner_write</title>
<%@ include file="../include/header.jsp" %>

<style type="text/css">
.tb-container {
 display: flex;
	flex-wrap: inherit;
	justify-content: space-between;
	width: 58%;
	margin-right: auto;
	margin-left: auto;
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0;
	padding: var(- -bs-navbar-padding-y) var(- -bs-navbar-padding-x);
	text-decoration: none;
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

.aside {
	display: flex;
	flex-wrap: inherit;
	align-items: center;
	justify-content: space-between;
	margin-top: 20px;
	margin-right: auto;
	margin-left: auto;
	
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
	$("#btnwrite").click(function(){
		//등록으로 이동
		location.href="${path}/owner/write.do";
	});
});


</script>

</head>
<body>
<%@ include file="../common/owner_nav.jsp" %>

<nav class="navbar navbar-expand-md bg-secondary">&nbsp;</nav>
<nav class="navbar navbar-expand-md bg-secondary">
<a class="navbar-a">&nbsp;내 숙소 목록</a></nav>

	<aside class="aside">
			<jsp:include page="../common/ownersidebar.jsp" />
	</aside>
	
<div class="info-1">
<c:choose>
	<c:when test="${map.count == 0}">
		<p class="content-1">숙소 목록이 비었습니다.</p>
	</c:when>

	<c:otherwise>
	${map.count}개의 건물이 있습니다.
	</c:otherwise>
</c:choose>
	</div>
	
<div class="tb-container" style="width: 61%;">
<table border="1" style="width: 100%;">
	<tr>
		<th>건물번호</th>
		<th>건물명</th>
		<th>건물종류</th>
		<th>건물사진<th>
		<th style="width: 20%;">건물주소</th>
		<th style="width: 15%;">사장님한마디</th>
		<th style="width: 15%;">편의기능</th>
		<th>등록 허가<th>
	</tr>
<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.building_code}</td>
		
	 	<td>
	 	 <a>${row.building_name}</a> <br>
		 <a href="${path}/room/write.do?building_code=${row.building_code}"><input type="submit" value="방 등록"></a>  
		 <a href="${path}/room/list.do?building_code=${row.building_code}"><input type="submit" value="방 목록"></a>
		</td>

		<td>${row.building_type }</td>
		
		<td><img src="${path}/resources/images/${row.picture_url}"
					width="100px" height="100px"></td>
					
		<td>&nbsp;</td>
					
		<td><a>${row.address1}&nbsp;${row.address2}&nbsp;${row.zipcode}</a>
		</td>
		
		<td>${row.owner_comment}</td>
		
		<td>${row.accomodation}</td>
		
		<td>
		 <a>${row.permission }</a><br>
		 <a href="${path}/owner/edit/${row.building_code}">[수정]</a>
		</td>
		
		
	</tr>
</c:forEach>	
</table>
</div>
	
<button class="move" type="button" id="btnwrite">건물 추가</button>
<%@ include file="../common/footer.jsp" %>
</body>
</html>