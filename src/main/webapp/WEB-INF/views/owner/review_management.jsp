<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>리뷰</title>
<style type="text/css">

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

</head>
<body>
<%@ include file="../common/nav.jsp" %>
<nav class="navbar navbar-expand-md bg-secondary">&nbsp;</nav>
<nav class="navbar navbar-expand-md bg-secondary">
<a class="navbar-a">&nbsp;리뷰 관리</a></nav>

<aside class="aside">
			<jsp:include page="../common/ownersidebar.jsp" />
	</aside>

<div class="container border mb-3">
	<div class="row">
		<div class="col-3">
		</div>
		<div class="text-center" style="width:100%;">
			<table class="table">
				<thead>
					<tr>
					  <th>리뷰번호</th>
						<th>방번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>평점</th>
						<th>등록일</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>				
						<c:forEach var="row" items="${ list }">
							<tr>
		            
								<td>${row.REPLYNO }
								</td>
								<td>${row.ROOM_NAME }</td>
								<td>${row.USERID }</td>
								<td>${row.CONTENT }</td>
								<td>${ ROOMAVERAGE }</td>
								<td><fmt:formatDate value="${reg_date_review }" pattern="YYYY년 MM월 dd일"/></td>
								<td><a href="${path}/owner/review/delete.do?building_code=${row.BUILDING_CODE}">삭제</a></td>
							</tr>
						</c:forEach>				
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
