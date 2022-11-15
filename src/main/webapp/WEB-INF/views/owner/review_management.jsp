<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>리뷰</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container border mb-3">
	<div class="row">
		<div class="col-3">
			<div class="card p-3">
				<ul class="list-group list-group-flush">
				</ul>
			</div>
		</div>
		<div class="text-center" style="width:950px;">
			<table class="table">
				<thead>
					<tr>
					  <th>리뷰번호</th>
						<th>방번호</th>
						<th>작성자</th>
						<th>내용</th>
						<th>이미지</th>
						<th>평점</th>
						<th>등록일</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty review }">
						<div class="alert text-center">
							<p>등록된 리뷰가 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="review" items="${review }">
							<tr>
								<td>${review.replyno }</td>
								<td>${review.room_no }</td>
								<td>${review.userid }</td>
								<td>${review.content }</td>
								<td>${review.point }</td>
								<td><img src="/resources/images/review/${review.picture_url}"></td>
								<td><fmt:formatDate value="${review.reg_date_review }" pattern="YYYY년 MM월 dd일"/></td>
								<td><a href="#">삭제</a></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
