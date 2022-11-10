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
    
    function building_update(){
    	
    		var building_name=$("#building_name").val();
    		var building_type=$("#building_type").val();
    		var zipcode=$("#zipcode").val();
    		if(building_name==""){
    			alert("건물이름을 입력하세요");
    			$("#building_name").focus();
    			return;
    		}
    		if(building_type==""){
    			alert("건물 종류를 입력하세요");
    			$("#building_type").focus();
    			return;
    		}
    		if(zipcode==""){
    			alert("주소를 입력하세요");
    			$("#zipcode").focus();
    			return;
    		}
    		document.form1.action="${path}/owner/update.do";
    		document.form1.submit();
    	}
    
    
    function building_delete(){
     	if(confirm("삭제 하시겠습니까?")){
    		document.form1.action="${path}/owner/delete.do";
    		document.form1.submit();
    	}
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
<a class="navbar-a">&nbsp;건물 정보 수정</a></nav>


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
					<td><input name="building_name" id="building_name" value="${dto.building_name}"></td>
				</tr>
				<tr>
					<td>사장님 한마디</td>
					<td><textarea rows="5" cols="60" id="owner_comment" name="owner_comment">${dto.owner_comment}</textarea> </td>
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
					<td>우편번호 : <input name="zipcode" id="zipcode" size="10" value="${dto.zipcode}"
						readonly> <input type="button" onclick="daumZipCode()"
						value="우편번호 찾기"> <br> 주소 : <input name="address1"
						id="address1" size="60" value="${dto.address1}"> <br> 상세주소 : <input
						name="address2" id="address2" value="${dto.address2}">
					</td>
				</tr>
				<tr>
					<td>건물 이미지</td>
					<td><input type="file" name="file1" id="file1"></td>
				</tr>
				<tr> 
					<td colspan="2" align="center">
				 <input type="hidden" name="building_code" value="${dto.building_code}">
				 <input type="button" value="수정" onclick="building_update()">
				 <input type="button" value="삭제" onclick="building_delete()">
				 <input type="button" value="목록" onclick="location.href='${path}/owner/list.do'">
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