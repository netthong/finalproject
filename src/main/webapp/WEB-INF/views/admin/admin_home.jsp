<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- swiper css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<style>
	#yeseok {
		width: 100%;
/* 		height: 900px; */
		padding: 0;
		margin: 0;
		max-width: inherit;
	}
	
/* 	#title {
		width: 100%;
	}
	
	#title h2 {
		display: block;
		font-size: 28px;
		font-weight: normal;
		letter-spacing: -4px;
    	color: #fff;
		width: 100%;
    	padding: 41px 0px 61px 355px;
    	margin: 0px;
	} */
	
/* 	#yeseok2 {
		padding: 41px 0px 61px 250px;
 		margin: 0px 105px;		 
	} */
	
	#all-content {
		width: 1000px;
	}
	
	#category-box {
		display: block;
    	float: left;
    	width: 180px;
	}	
	
	#content {
    	padding-top: 20px;
    	display: block;
    	position: relative;
    	float: right;
    	width: 800px;
    	margin: auto;
	}
	
	#content #nickname, #name, #tel {
		color: #000000;
		width: 150px;
	}
	
	#box-tel-btn {
		padding-bottom: 50px;
		border-bottom: 1px solid rgba(0,0,0,0.08);
	}
	
	#user {
		width: 824px;		
		margin: 50px -12px 48px -12px;
		border-top: 1px solid rgba(0,0,0,0.08);
	}
	
	.card-img-top {
		height: 150px;
		object-fit: cover;
	}
	
	th, td {
  text-align: center;
	}
</style>
<c:if test="${message == 'search'}">
<script type="text/javascript">
$(function() {
	document.form1.submit();
});
</script>
</c:if>
<title>내 정보</title>
</head>
<body>
	<%@ include file="../common/admin_nav.jsp"%>
	<div class="row bg-secondary m-0" style="height: 13vh;">
		<div class="px-3 pt-5 pb-3 mx-auto my-auto"
			style="min-width: 992px; max-width: 992px;">
			<h3 class="text-white ps-0 mb-3">관리자 페이지</h3>
		</div>
	</div>
	<div id="all-content" class="mt-5 mx-auto">
		<!-- 카테고리 리스트 -->
		<div id="category-box">
			<%@ include file="../common/adminsidebar.jsp"%>
		</div>
		<div id="content">
			<!-- CAT_001 내 정보 수정 -->
			<strong><h3>회원 목록</h3></strong>
			<div class="col-10">
			<!-- 검색창 -->
				<form action="${path}/admin/userList.do" name="form1" method="post">
					
					<select name="search_option">
						<c:choose>
							<c:when test="${search_option == 'userid'}">
								<option value="all">아이디+이름</option>
								<option value="userid" selected>아이디</option>
								<option value="name">이름</option>
							</c:when>
							<c:when test="${search_option == 'name'}">
								<option value="all">아이디+이름</option>
								<option value="userid">아이디</option>
								<option value="name" selected>이름</option>
							</c:when>
							<c:when test="${search_option == 'all'}">
								<option value="all" selected>아이디+이름</option>
								<option value="userid">아이디</option>
								<option value="name">이름</option>
							</c:when>
							<c:when test="${search_option == null}">
								<option value="all" selected>아이디+이름</option>
								<option value="userid">아이디</option>
								<option value="name">이름</option>
							</c:when>
						</c:choose>	
								
					</select> 
					<input name="keyword" value="${keyword}">
					<button id="btnSearch">검색</button>
				</form>
				<br>
				<table class="table table-striped table-hover">
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>전화번호</td>
						<td>이메일</td>
						<td>구분</td>
						<td>정지상태</td>
					</tr>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.userid}</td>
							<td>${dto.name}</td>
							<td>${dto.tel}</td>
							<td>${dto.email}</td>
							<td>${dto.category}</td>
							<td><a href="${path}/admin/userStop.do?userid=${dto.userid}&stop=${dto.stop}">${dto.stop}</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>

</body>
</html>