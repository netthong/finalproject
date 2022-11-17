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
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container border mb-3">
	<div class="row">
		<div class="col-3">
		</div>
		<div class="text-center" style="width:950px;">
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
								<td>${row.replyno }</td>
								<td>${row.room_no }</td>
								<td>${row.userid }</td>
								<td>${row.content }</td>
								<td>${ roomAvgPoint }</td>
								<td><fmt:formatDate value="${row.reg_date_review }" pattern="YYYY년 MM월 dd일"/></td>
								<td><a href="#">삭제</a></td>
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
