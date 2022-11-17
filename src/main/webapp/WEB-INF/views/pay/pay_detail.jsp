<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/tags.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>owner_write</title>
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">


<script type="text/javascript">
$("form1").submit(function() {
		var reserName=$("#reserName").val();
		if (userid == ""){
			alert("예약자 이름은 필수 입력입니다.");
			$("#reserName").focus();
			return false;
		}

</script>

</head>
<body>
<%@ include file="../common/nav.jsp" %>

<div class="container my-3" style="min-width:992px; max-width:992px;">
	<div class="row mb-3 bg-light">
		<div class="col-8">
				<div class="my-3">
					<p><strong>예약자 정보</strong></p>
					<label class="form-label" name="reserName">예약자 이름</label>
					<input class="form-control" type="text" placeholder="체크인시 필요한 정보입니다." name="reserName" id="reserName" value="${user.name }">
				</div>
				<div class="my-3">
					<p class="form-label">휴대폰 번호</p>
					<p class="form-text">개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</p>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="010-0000-0000" name="reserTel" id="reserTel" value="${user.tel }">
						<span class="input-group-btn">
						</span>
					</div>
				<p id="phoneCheck" class="text-danger"></p>			
				</div>
				<hr>
				<div class="my-5">
					<p><strong>결제수단 선택</strong></p>
					<select class="form-select" id="payType">
						<option value="kakaopay" selected >카카오페이</option>
						<option value="tosspay" >현장결제</option>
					</select>	
				</div>

				<div class="form-check mb-2">
					<input class="form-check-input" type="checkbox" value="" id="checkboxRefundprovision" name=checkbox>
					<label class="form-text" for="checkboxRefund" ><a onclick="openRefundModal()" style="text-decoration: underline; color: gray">
					  숙소이용규칙 및 취소/환불규정 동의</a><strong class="text-secondary">(필수)</strong>
					</label>
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" type="checkbox" value="" id="checkboxInfo1provision" name=checkbox>
					<label class="form-text" for="checkboxInfo1"><a onclick="openinfo1Modal()" style="text-decoration: underline; color: gray">
					  개인정보 수집 및 이용 동의</a><strong class="text-secondary">(필수)</strong>
					</label>
				</div>
				<div class="form-check mb-2">
					<input class="form-check-input" type="checkbox" value="" id="checkboxInfo2provision" name=checkbox >
					<label class="form-text" for="checkboxInfo2"><a onclick="openinfo2Modal()"  style="text-decoration: underline; color: gray">
					  개인정보 제 3자 제공 동의</a> <strong class="text-secondary">(필수)</strong>
					</label>
				</div>
			</div>
			
	 <form method="post" action="${path}/pay/complete.do" id="form-reserv">
			
				<div class="row bg-light">
					<div class="col mx-2">
						<div class="my-5 mx-3">
							<dl>
								<dt id="bilding_name">${rooml.room_name}</dt>
								<dd id="room_name">${rooml.room_price} / <span id="days">1박</span>
								<dt class="col-3 form-text">체크인</dt>
								<dd id="checkIn" > <fmt:formatDate value="${startdate}"/> 15:00</dd>
								<dd class="form-text">체크아웃</dd>
								<dd id="checkOut"> <fmt:formatDate value="${enddate}"/>  12:00</dd>
							</dl>
							<hr>
							<a><input type="hidden" value=" ${rooml.building_name }"></a>
							<a><input type="hidden" value=" ${rooml.building_code }"></a>
							<a><input type="hidden" value=" ${rooml.room_name }"></a>
							<a><input type="hidden" value=" ${rooml.room_no }"></a>
							<a><input type="hidden" value=" ${rooml.room_price }"></a>
							<a><input type="hidden" value=" ${rooml.room_size }"></a>
							<a><input type="hidden" value=" ${rooml.picture_url }"></a>
							
							<a><input type="hidden" value="${startdate}"></a>
							<a><input type="hidden" value="${enddate}"></a>
							<a><input type="hidden" value="${section}"></a>
							<a><input type="hidden" value="${userid}"></a>
					</div>
					<div class="my-3 mx-3">
						<p><strong>총 결제 금액</strong><small>(VAT포함)</small></p>
						<h4><strong class="text-danger" id="price"><fmt:formatNumber>${rooml.room_price * section}</fmt:formatNumber> 원</strong><small style="font-size: 14px;">(${section}박 ${section + 1}일)</small></h4>
						<label><small>
							<li class="mx-2">해당 객실가는세금, 봉사료가 포함된 금액입니다.</li>
							<li class="mx-2">결제완료 후 <span class="text-secondary">예약자</span> 이름으로 바로 <span class="text-secondary">체크인</span> 하시면 됩니다.</li>
						</small></label>
					</div>						
				</div>
				<div class="row">
					  <a href="${path}/pay/complete.do?room_no=${rooml.room_no}" class="btn-room-reserve btn btn-secondary w-100">결제하기</a>
				</div>
			</div>

</form>
	</div>
</div>



</body>

<%@ include file="../common/footer.jsp" %>
</html>