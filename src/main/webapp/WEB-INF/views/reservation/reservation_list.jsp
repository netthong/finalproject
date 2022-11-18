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

.form-container {
  display: flex;
	flex-wrap: inherit;
	align-items: center;
	justify-content: space-between;
	width: 50%;
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


.navbar-a:link {
	color: white;
}

.navbar-a:visited {
	color: white;
}

.navbar-a:hover {
	color: white;
}
</style>

</head>
<body>
<%@ include file="../common/nav.jsp" %>
<nav class="navbar navbar-expand-md bg-secondary">&nbsp;</nav>
<nav class="navbar navbar-expand-md bg-secondary">
<a class="navbar-a">&nbsp;예약 현황</a></nav>


<aside class="aside">
			<jsp:include page="../common/ownersidebar.jsp" />
	</aside>
	
		<div id="content">
			<!-- CAT_001 내 정보 수정 -->
				<c:forEach var="dto" items="${list}">
				<div class="col-10">
				<table class="table table-striped table-hover">
					<tr>
					<td><img src="${path}/resources/images/${dto.picture_url}"></td>
					</tr>
					<tr>
						<td>예약번호</td>
						<td>${dto.receipt_no}</td>
					</tr>
					<tr>
						<td>업소명</td>
						<td>${dto.building_name}</td>
					</tr>
					<tr>
						<td>방이름</td>
						<td>${dto.room_name}</td>
					</tr>
					<tr>
						<td>예약일</td>
						<td>${dto.date_start}~${dto.date_end}</td> 
					</tr>
					<tr>
						<td>결재금액</td>
						<td>${dto.price}</td> 
					</tr>
				</table>
				</div>
			</c:forEach>
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