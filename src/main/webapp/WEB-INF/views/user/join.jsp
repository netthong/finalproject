<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.register #content {
    width: 360px;
    height: 850px;
    margin: 30px auto 0 auto;
}

#logo{
	text-align: center;
}

#logo img {
	width: 180px;
}

#join {
    width: 305px;
}

#join button {
	width: 327px;
}


</style>
	<title>회원가입</title>
</head>
<body>
<div class="register">
	<div id="content">
		<!-- 로고 -->
        <div id="logo">
            <a class="navbar-brand" href="/">
      			<img src="../resources/images/dragonball_logo1.png" alt="거기어때" width="80" height="auto">
    		</a>
        </div>
    	<form class="border p-3" method="post" action="write.do">
    		<div class="mb-3">
    			<label class="form-label">아이디</label>
    			<input class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요."/>
    		</div>
    		<div class="mb-3">
    			<label class="form-label">비밀번호</label>
    			<input type="password" class="form-control" id="password"  name="password" placeholder="비밀번호를 입력해주세요."/>   			
    		</div>
    		<div class="mb-3">
    			<label class="form-label">비밀번호 확인</label>
    			<input class="form-control" type="password" id="password-check" placeholder="비밀번호를 입력해주세요."/>			
    			<span id ="password-check-feedback"></span>
    		</div>
    		<div class="mb-3">
    			<label class="form-label">이름</label>
    			<input class="form-control" id="name" name="name" placeholder="이름을 입력해주세요."/>
    		</div>
    		<div class="mb-3">
    			<label class="form-label">전화번호</label>
    			<input class="form-control" id="tel" name="tel" placeholder="-을 포함하여 입력해주세요."/>
    		</div>
    		<div class="mb-3">
    			<label class="form-label">이메일</label>
    			<input class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요."/>
    		</div>
    		<div class="mb-1 text-end" id="join">
    			<button type="submit" class="btn btn-primary btn-lg">가입하기</button>
    		</div>
    	</form>
    </div>
</div>
<script type="text/javascript">
// 비밀번호 확인
   $('#password-check').focusout(function(){
      var password1 = $("#password").val();
      var password2 = $("#password-check").val();
      
      if (password1 !="" || password2 !=""){
         if (password1 == password2) {
            $("#password-check-feedback").html('사용할 수 있는 비밀번호 입니다.');
            $("#password-check-feedback").css('color', 'green');
         } else {
            $("#password-check-feedback").html('비밀번호가 불일치합니다.');
            $("#password-check-feedback").css('color', 'red');
         }
      }
   })
</script>
</body>
</html>