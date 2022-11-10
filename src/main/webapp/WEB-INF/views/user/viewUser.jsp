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
				<strong><h3>내 정보 수정</h3></strong>
				<div class="col-10">"${dto.userid}" 회원으로 로그인</div>
				<c:if test="${message == 'success'}">
				<br>
    				<div class="alert alert-info">
    					비밀번호 변경에 성공하셨습니다.
    				</div>
    			</c:if>
				<div class="col-2 mt-5" id="name"><h3>예약자 이름</h3></div>
				<div class="col-10">${dto.name}</div>
				<div class="row mb-3" id="box-name-btn">
					<div class="col-2"><button class="btn btn-outline-secondary" id="btn-show-name-form">수정</button></div>
				</div>
				<div class="row mb-3 d-none" id="box-name-update">
					<div class="col-6">
						<form id="form-name" action="updateName.do">
							<input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요."/>
							<button type="submit" class="btn btn-primary" id="complete">수정완료 </button>
							<button type="button" class="btn btn-secondary" id="btn-hide-name-form">수정취소 </button> 
						</form>
					</div>
				</div>
				<div class="col-2 mt-5" id="tel"><h3>휴대폰 번호</h3></div>
				<div class="col-10">${dto.tel}</div>
				<div class="row mb-3" id="box-tel-btn">
					<div class="col-2"><button class="btn btn-outline-secondary" id="btn-show-tel-form">수정</button></div>
				</div>
				<div class="row mb-3 d-none" id="box-tel-update">
					<div class="col-6">
						<form id="form-tel" action="updateTel.do">
							<input type="text" name="tel" class="form-control" placeholder="-을 포함하여 입력해주세요."/>
							<button type="submit" class="btn btn-primary" id="complete">수정완료 </button>
							<button type="button" class="btn btn-secondary" id="btn-hide-tel-form">수정취소 </button> 
						</form>
					</div>
				</div>
				<div class="col-2 mt-5" id="tel"><h3>이메일</h3></div>
				<div class="col-10">${dto.email}</div>
				<div class="row mb-3" id="box-email-btn">
					<div class="col-2"><button class="btn btn-outline-secondary" id="btn-show-email-form">수정</button></div>
				</div>
				<div class="row mb-3 d-none" id="box-email-update">
					<div class="col-6">
						<form id="form-email" action="updateEmail.do">
							<input type="text" name="email" class="form-control" placeholder="이메일을 입력해주세요."/>
							<button type="submit" class="btn btn-primary" id="complete">수정완료 </button>
							<button type="button" class="btn btn-secondary" id="btn-hide-email-form">수정취소 </button> 
						</form>
					</div>
				</div>
				<div class="col mb-5" id="user">
					<div class="col mt-5"><p>비밀번호를 변경하고 싶으세요?</p></div>
					<button type="button" class="btn btn-link"><a href="changePassword.do">비밀번호 변경</a></button>
				</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#submit").on("click", function(){
		if($("#userPass").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
		}	
	});	
})

$("#form-name").submit(function() {
	let inputValue = $("#form-name input[name='name']").val();
	if (inputValue.length < 2) {
		alert("2자 이상 입력하세요.");
		return false;
	}
	var nameRe = /^[가-힣]{2,6}$/;
    if( !nameRe.test( $("#form-name input[name='name']").val())) {
        alert("이름은 한글로 2글자 이상 7글자 미만까지 허용됩니다.");
        return false;
    }
	return true;
});

$("#form-tel").submit(function() {
	let inputValue = $("#form-tel input[name='tel']").val();
	if (inputValue.length < 2) {
		alert("2자 이상 입력하세요.");
		return false;
	}
	var telRe = /^\d{3}-\d{3,4}-\d{4}$/;
    if( !telRe.test( $("#form-tel input[name='tel']").val())) {
        alert("유효한 전화번호 형식이 아닙니다.");
        return false;
    }
	return true;
});

$("#form-email").submit(function() {
	let inputValue = $("#form-email input[name='email']").val();
	if (inputValue.length < 2) {
		alert("2자 이상 입력하세요.");
		return false;
	}
	
	return true;
});


$("#btn-show-name-form").click(function() {
	$("#box-name-update").removeClass('d-none');
	$("#box-name-btn").addClass('d-none')
})

$("#btn-hide-name-form").click(function() {
	$("#box-name-update").addClass('d-none');
	$("#box-name-btn").removeClass('d-none');
})

$("#btn-show-tel-form").click(function() {
	$("#box-tel-update").removeClass('d-none');
	$("#box-tel-btn").addClass('d-none');
})

$("#btn-hide-tel-form").click(function() {
	$("#box-tel-update").addClass('d-none');
	$("#box-tel-btn").removeClass('d-none');
})

$("#btn-show-email-form").click(function() {
	$("#box-email-update").removeClass('d-none');
	$("#box-email-btn").addClass('d-none');
})

$("#btn-hide-email-form").click(function() {
	$("#box-email-update").addClass('d-none');
	$("#box-email-btn").removeClass('d-none');
})
</script>
</body>
</html>