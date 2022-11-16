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
	
	#form-name fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
	}
	#form-name fieldset legend{
	    text-align: right;
	}
	#form-name input[type=radio]{
	    display: none;
	}
	#form-name label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#form-name label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#form-name label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#form-name input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#reviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 16px;
	    resize: none;
	}
</style>
<title>내 정보</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div id="yeseok">
	<div class="row bg-secondary m-0" style="height:13vh;">
		<div class="px-3 pt-5 pb-3 mx-auto my-auto" style="min-width:992px; max-width:992px;">
			<h3 class="text-white ps-0 mb-3">내 정보</h3>
		</div>
	</div>
	<div id="all-content" class="mt-5 mx-auto">
		<!-- 카테고리 리스트 -->	
		<div id="category-box">
			<%@ include file="../common/usersidebar.jsp" %>
		</div>
		<div id="content">
			<!-- CAT_001 내 정보 수정 -->
				<strong><h3>예약 정보</h3></strong>
				<div class="col-2 mt-5" id="name"><h3>예약자 이름</h3></div>
				<div class="col-10">${dto.name}</div>
				<div class="row mb-3" id="box-roomReview-btn">
					<div class="col-2"><button class="btn btn-outline-secondary" id="btn-show-roomReview-form">리뷰 쓰기</button></div>
				</div>
				<div class="row mb-3 d-none" id="box-roomReview-update">
					<div class="col-8">
						<form id="form-name" action="upRoomReview.do">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span>
								<input type="radio" name="reviewStar" value="5" id="rate1"><label
									for="rate1">★</label>
								<input type="radio" name="reviewStar" value="4" id="rate2"><label
									for="rate2">★</label>
								<input type="radio" name="reviewStar" value="3" id="rate3"><label
									for="rate3">★</label>
								<input type="radio" name="reviewStar" value="2" id="rate4"><label
									for="rate4">★</label>
								<input type="radio" name="reviewStar" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>
							<div>
								<textarea class="col-auto form-control" name="#" id="reviewContents"
										  placeholder="내용을 입력해주세요."></textarea>
							</div>
							<button type="submit" class="btn btn-primary" id="complete">수정완료 </button>
							<button type="button" class="btn btn-secondary" id="btn-hide-roomReview-form">수정취소 </button> 
						</form>
					</div>
				</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
$("#btn-show-roomReview-form").click(function() {
	$("#box-roomReview-update").removeClass('d-none');
	$("#box-roomReview-btn").addClass('d-none')
})

$("#btn-hide-roomReview-form").click(function() {
	$("#box-roomReview-update").addClass('d-none');
	$("#box-roomReview-btn").removeClass('d-none');
})

})
</script>
</body>
</html>