<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="../common/tags.jsp" %>
<style type="text/css">
.login #content {
    width: 336px;
    margin: 100px auto 0 auto;
}

#logo{
	text-align: center;
}

#logo img {
	width: 180px;
}

.normal .login button {
	width: 329px;
}


.kakao ul{
	padding: 0px;
	margin-bottom: 5px;
}

li {
	display: inline-block;
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
	<title>로그인</title>
</head>
<body>
<!-- 로그인 양식 -->
<div class="login">
	<div id="content">
		<!-- 로고 -->
        <div id="logo" style="margin-bottom: 10px;">
            <a class="navbar-brand" href="${path}" style="font-family: 'yg-jalnan'; font-size: 40px; color: #FF9898;">
      			거기어때
    		</a>
        </div>
            
        <!-- 일반 로그인 -->
        <div class="normal">
           <c:set var="menu" value="login"></c:set>
    		<div class="row">
    			<c:if test="${message == 'error'}">
    				<div class="alert alert-danger">
    					아이디 혹은 비밀번호가 틀렸습니다.
    				</div>
    			</c:if>
    			<c:if test="${message == 'stop'}">
    				<div class="alert alert-danger">
    					아이디가 정지되었습니다.
    				</div>
    			</c:if>
    			<c:if test="${message == 'logout'}">
    				<div class="alert alert-info">
    					로그아웃 되었습니다.
    				</div>
    			</c:if>
    			
    			<form class="login p-3" method="post" action="login_check.do">
    				<div class="mb-2">
    					<input type="text" class="form-control" name="userid" placeholder="아이디를 입력하세요."/>
    				</div>
    				<div class="mb-3">
    					<input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요."/>
    				</div>
    				<div class="mb-3 text-end">
    					<button class="btn btn-primary btn-lg">로그인</button>
    				</div>
    				<div class="finish">
						<a href="join.do" class="btn btn-light mb-2" style="padding-left: 33px; padding-right:33px;height: 42px;">회원가입</a>
						<button class="btn btn-light mb-2" type="button" data-bs-toggle="modal" data-bs-target="#findId" style="padding-left: 33px; padding-right:33px;width: 190px;height: 42px;">아이디 찾기</button>
            <button class="btn btn-light" type="button" data-bs-toggle="modal" data-bs-target="#findPw" style="padding-left: 33px; padding-right:33px;height: 45px;">비밀번호 찾기</button>
    				</div>
    			</form>
    		</div>
		</div>
		
		<!-- 아이디 찾기 -->
		<div class="modal fade" id="findId" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel"><strong>아이디 찾기</strong></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table findId">
							<tr>
                <td><label>이름</label></td>
								<td><input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이름을 입력해주세요.'"></td>
							</tr>
							<tr>
								<td><label>이메일</label></td>
								<td><input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력해주세요.'"></td>
							</tr>
						</table>
						<div class="showId"></div>
					</div>
					<div class="modal-footer">
                        <button type="button" class="btn btn-primary btnConfirm" onclick="findId()">확인</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 비밀번호 찾기 -->
		<div class="modal fade" id="findPw" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel"><strong>비밀번호 찾기</strong></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table findPw">
							<tr>
                            	<td><label>아이디</label></td>
								<td><input type="text" class="form-control" id="userid2" name="userid2" placeholder="아이디를 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이름을 입력해주세요.'"></td>
							</tr>
							<tr>
								<td><label>이메일</label></td>
								<td><input type="text" class="form-control" id="email2" name="email2" placeholder="이메일을 입력해주세요." onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력해주세요.'"></td>
							</tr>
						</table>
						<div class="showPw"></div>
					</div>
					<div class="modal-footer">
            <button type="button" class="btn btn-primary btnConfirm2" onclick="findPw()">확인</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
    </div>
</div>


<%-- 아이디 찾기 --%>
<script type="text/javascript">
function findId() {
   var name = $('#name').val();
   var email = $('#email').val();
   
   $.ajax({
      url: '${path}/user/findId.do',
      type: 'post',
      data: {"name":name, "email":email},
      success:function(data){
         if(data == 0) {
            alert("아이디가 존재하지 않습니다.");
         } else {
            $(".findId").css('display','none');
            $(".btnConfirm").css('display','none');
            var content = '<p class="text-center">아이디는 <strong>'+data+'</strong> 입니다.</p>';
            $(".showId").append(content);
         }
      }, 
      error:function(){
         alert("에러입니다.");
      }
   })
};

<%-- 비밀번호 찾기 --%>
function findPw() {
   var userid = $("#userid2").val();
   var email = $("#email2").val();
   
   $.ajax({
      url: '${path}/user/findPw.do',
      type: 'post',
      data: {"userid":userid, "email":email},
      success:function(pw){
    	   if(pw == ""){
              alert("아이디 혹은 이메일이 잘못되었습니다.");
           }else {
            $(".findPw").css('display','none');
            $(".btnConfirm2").css('display','none');
            var content = '<p class="text-center">임시 비밀번호는 <strong>'+pw+'</strong> 입니다.</p>';
            $(".showPw").append(content);
       	 } 
      }, 
      error:function(){
         alert("에러입니다.");
      }
   })
};
</script>
</body>
</html>