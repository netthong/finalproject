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
			<strong><h3>배너 상세보기</h3></strong>
				<div class="row mb-3" id="box-name-btn">
					<table class="table table-striped table-hover">
					<tr>
						<td>번호</td>
						<td>상세 이미지</td>
						<td></td>
					</tr>
						<tr>
							<td>${dto.banner_num}</td>
							<td><img src="${path}/resources/images/${dto.event_mainphoto}" width="500px" height="500px"></td>
							<td><a class="btn btn-primary" onclick="deleteBanner()">삭제</a></td>
						</tr>
				</table>
				</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
<script type="text/javascript">
function deleteBanner() {
	var result = confirm("삭제하시겠습니까?");
	if(result){
		location.href = "${path}/admin/deleteBanner.do?banner_num=${dto.banner_num}";		
	}else{
		return false;
	}
}
</script>
</body>
</html>