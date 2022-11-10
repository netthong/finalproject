<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>owner_write</title>
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function daumZipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address1").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
    
    function owner_write() {
    	//태그를 name으로 조회할 경우(계층구조로 접근)
    	//var product_name=document.form1.product_name.value;
    	//태그를 id로 조회할 경우
    	var building_name=$("#building_name").val();
    	var building_type=$("#building_type").val();
    	var owner_comment=$("#owner_comment").val();
    	var address1=$("#address1").val();
    	var address2=$("#address2").val();
    	var zipcode=$("#zipcode").val();
    	var userid=$("#userid").val();
    	if(building_name==""){//빈값이면
    		//문자열 비교 : java는 a.equals(b), javascript는 a==b
    		alert("건물이름을 입력하세요");
    		$("#building_name").focus();//입력포커스 이동
    		return;//리턴값없이 함수 종료
    	}
    	if(zipcode==""){
    		alert("우편번호 찾기를 클릭하세요");
    		$("#zipcode").focus();//입력포커스 이동
    		return;//리턴값없이 함수 종료
    	}
    	if(address2==""){
    		alert("상세주소를 입력하세요");
    		$("#address2").focus();//입력포커스 이동
    		return;//리턴값없이 함수 종료
    	}  
    	document.form1.action="${path}/owner/insert.do";
    	document.form1.submit();
    }
</script>


<style>

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
<%@ include file="../common/owner_nav.jsp" %>
<nav class="navbar navbar-expand-md bg-secondary">&nbsp;</nav>
<nav class="navbar navbar-expand-md bg-secondary">
<a class="navbar-a">&nbsp;건물 등록</a></nav>


	<!-- 사이드바 -->
	<aside class="aside">
			<jsp:include page="../common/ownersidebar.jsp" />
	</aside>
	
	<!-- <div class="sidebar-custom">
  <a href="#" class="btn btn-link"><i class="fas fa-cogs"></i></a>
  <a href="#" class="btn btn-secondary hide-on-collapse pos-right">Help</a>
  <a href="#" class="btn btn-secondary hide-on-collapse pos-right">Help</a><br>
  <a href="#" class="btn btn-secondary hide-on-collapse pos-right">Help</a>
</div> -->


  <div class="form-container">
  
		<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		 
		건물종류<select name="building_type" id="building_type">
						<option value="motel"
							selected>모텔</option>
						<option value="hotel"
							>호텔 리조트</option>
						<option value="pension"
							>펜션</option>
						<option value="guest"
							>게스트하우스</option>
					</select>
		
			<table class="tb1">
				<tr>
					<td>건물명</td>
					<td><input name="building_name" id="building_name"></td>
				</tr>
				<tr>
					<td>사장님 한마디</td>
					<td><textarea rows="5" cols="60" id="owner_comment" name="owner_comment"></textarea> </td>
				</tr>
				<tr>
					<td>편의시설</td>
					<td><input type="checkbox" value="사우나" name="accomodation">사우나
					<input type="checkbox" value="고사양PC" name="accomodation">고사양PC
					<input type="checkbox" value="파티룸" name="accomodation">파티룸
					<input type="checkbox" value="노래방" name="accomodation">노래방
					<input type="checkbox" value="욕실" name="accomodation">욕실
					<input type="checkbox" value="거실" name="accomodation">거실					
					</td>
					
				</tr>
				<tr>
					<td>건물주소</td>
					<td>우편번호 : <input name="zipcode" id="zipcode" size="10"
						readonly> <input type="button" onclick="daumZipCode()"
						value="우편번호 찾기"> <br> 주소 : <input name="address1"
						id="address1" size="60"> <br> 상세주소 : <input
						name="address2" id="address2">
					</td>
				</tr>
				<tr>
					<td>건물 이미지</td>
					<td><input type="file" name="file1" id="file1"></td>
				</tr>
				<tr> 
					<td colspan="2" align="center"><input type="button" value="등록" onclick="owner_write()"> 
						<input type="button"
						value="목록" onclick="location.href='${path}/owner/list.do'">
					</td>
				</tr>
				<tr>
				 <td><input type="hidden" id="userid" name="userid" value="${sessionScope.userid}" ></td>
				</tr>
			</table>
		</form>
 </div>


	<%@ include file="../common/footer.jsp" %>
</body>
</html>