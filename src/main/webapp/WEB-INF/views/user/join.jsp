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
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}

a{
	text-decoration: none;
}   
   
@font-face {
    font-family: 'Happiness-Sans-Title';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/Happiness-Sans-Title.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
} 
</style>

	<title>회원가입</title>
</head>
<body>
<div class="register">
	<div id="content">
		<!-- 로고 -->
        <div id="logo" style="margin-bottom: 20px;">
            <a class="navbar-brand" href="${path}" style="font-family: 'yg-jalnan'; font-size: 40px; color: #FF9898;">
      			거기어때
    		</a>
    	</div>
    	<form name="form1" class="border p-3" method="post" action="write.do">
    		<div class="mb-3">
    			<label class="form-label">회원 구분</label><br>
    			<input type="radio" class="form-radio" id="category" name="category" value="c" checked/>일반회원
    			<input type="radio" class="form-radio" id="category" name="category" value="b"/>업주회원
    		</div>
    		<div class="mb-3">
    			<label class="form-label">아이디</label>
    			<input class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요."/>
    			<span class="id_ok">사용 가능한 아이디입니다.</span>
					<span class="id_already">중복된 아이디입니다.</span>
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
    		<div class="mb-1 text-end" id="join" style="width: 325px;">
    			<input type="submit" class="btn btn-primary" name="signUp" onclick="check()" value="가입하기" />
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
            $("#password-check-feedback").html('비밀번호가 일치합니다.');
            $("#password-check-feedback").css('color', 'green');
         } else {
            $("#password-check-feedback").html('비밀번호가 불일치합니다.');
            $("#password-check-feedback").css('color', 'red');
         }
      }
   });  
</script>

<script type="text/javascript">
$("form").submit(function() {
		var userid=$("#userid").val();
		if (userid == ""){
			alert("아이디는 필수 입력입니다.");
			$("#userid").focus();
			return false;
		}
		// ^시작, $끝, [문자,숫자형식지정]{숫자,숫자} 
		var exp1 = /^[A-Za-z0-9]{4,10}$/;//(영문,숫자를 사용한 4~10자리로 입력)
		if(!exp1.test(userid)){
			alert("아이디는 영문자, 숫자를 사용해서 4~10자리로 입력하세요.");
			$("#userid").focus();
			return false;
		}
		
		//비밀번호 체크
		var password = $("#password").val();
		if (password == ""){
			alert("비밀번호는 필수 입력입니다.");
			$("#password").focus();
			return false;
		}
		var exp2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*\d){8,12}/;
		//()괄호로 쓸때는 시작^ 끝$기호를 쓰면 안됨. 
	  // 적어도 소문자 하나, 대문자 하나, 특수문자 하나, 숫자 하나 (*[0-9]해도됨) 가 포함되어있는 8~12개 사이의 문자열

		if(!exp2.test(password)){
			alert("비밀번호는 영문대소문자,숫자,특수기호(!@#$%^*+=-)를 모두 사용해서 8~12자리로 입력하세요.");
			$("#password").focus();
			return false;
		}
		
	 //이름 체크
	 var name = $("#name").val();
		if (name == ""){
			alert("이름은 필수 입력입니다.");
			$("#name").focus();
			return false;
		}
		
		var exp3 = /^[가-힣]+$/
		if (!exp3.test(name)){
			alert("이름은 한글만 가능합니다.");
			$("#name").focus();
			return false;
		}
		
		//전화번호 체크
		var tel = $("#tel").val();
		var exp4= /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		if(!tel.match(exp4)){
			alert("전화번호의 형식이 틀립니다.");
			$("#tel").focus();
			return false;
		}
})
</script>
<!-- 아이디 중복확인 -->
<script type="text/javascript">
$('#userid').focusout(function(){
    var userid = $('#userid').val();
    $.ajax({
        url:'${path}/user/idCheck.do', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{userid:userid},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
                alert("아이디를 다시 입력해주세요");
                $('#userid').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
  });
</script>
</body>
</html>