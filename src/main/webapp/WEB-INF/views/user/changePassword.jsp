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
		padding: 0;
		margin: 0;
		max-width: inherit;
	}
	
	#category-box {
		display: block;
    	float: left;
    	width: 180px;
	}	
	
	#all-content {
		width: 1000px;
	}
	
	#text-end {
    	text-align: left!important;
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
		<strong><h3>비밀번호 변경</h3></strong>
		<div class="changePw">
    		<div class="row">
    			<form class="form p-3" method="post" id="pwUpdateForm" name="pwUpdateForm" action="changePw.do">
    				<div class="form-group2" id="ChangePassword">
      					<label for="newPassword" class="form-label2 mt-4">새 비밀번호</label>
      					<input type="password" class="form-control" id="pw1" name="pw1" placeholder="비밀번호(최소 8자 이상)" style="width: 380px; height: 50px;">
    				</div>
    				<div class="form-group3" id="ChangePasswordConfirm">
      					<label for="newPasswordConfirm" class="form-label3 mt-4">새 비밀번호 확인</label>
      					<input type="password" class="form-control" id="pw2" name="pw2" placeholder="변경할 비밀번호를 재입력해 주세요." style="width: 380px; height: 50px;">
      					<span id ="password-check-feedback"></span>
    				</div>
    				<div class="form-group" id="standardPassword">
      					<label for="password" class="form-label mt-4">기존 비밀번호</label>
      					<input type="password" class="form-control" name="pw" id="pw" placeholder="기존 비밀번호를 입력해 주세요." style="width: 380px; height: 50px;">
    				</div>
    				<div class="mt-3 text-end" id="text-end">
    					<button type="submit" id="pwUpdate" name="pwUpdate" class="btn btn-primary btn-lg">변경</button>
    				</div>
    			</form>
    		</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	$("#pwUpdateForm").submit(function(){
		if($("#pw").val==""){
			alert("현재 비밀번호를 입력해주세요");
			$("#Pw").focus();
			return false
		}
		if($("#pw1").val==""){
			alert("변경비밀번호를 입력해주세요");
			$("#pw1").focus();
			return false
		}
		if($("#pw2").val==""){
			alert("변경비밀번호를 입력해주세요");
			$("#pw2").focus();
			return false
		}
		var exp2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*\d){8,12}/;
		//()괄호로 쓸때는 시작^ 끝$기호를 쓰면 안됨. 
	  // 적어도 소문자 하나, 대문자 하나, 특수문자 하나, 숫자 하나 (*[0-9]해도됨) 가 포함되어있는 8~12개 사이의 문자열

		if(!exp2.test($("#pw1").val())){
			alert("비밀번호는 영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 사용해서 8~12자리로 입력하세요.");
			$("#pw1").focus();
			console.log("#pw1");
			return false;
		}
});
</script>
<script type="text/javascript">
$('#pw2').focusout(function(){
    var pw1 = $("#pw1").val();
    var pw2 = $("#pw2").val();
    
    if (pw1 !="" || pw2 !=""){
       if (pw1 == pw2) {
          $("#password-check-feedback").html('비밀번호가 일치합니다.');
          $("#password-check-feedback").css('color', 'green');
       } else {
          $("#password-check-feedback").html('비밀번호가 불일치합니다.');
          $("#password-check-feedback").css('color', 'red');
       }
    }
 });  
</script>
</body>
</html>