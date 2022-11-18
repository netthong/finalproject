<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- javascript date range picker를 위해 필요한 라이브러리 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- swiper css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<style type="text/css">
	.profile-image-wrapper {
		width: 70px;
		height: 70px;
		overflow: hidden;
		position: relative;
		background: rgba(0, 0, 0, 0.5);
	}
	
	.profile-image-wrapper img {
		width: 100%;
		position: absolute;
		left: 0;
		top: 50%;
		transform: translateY(-50%);
	}
	
 	#acco-swiper-wrapper .mySwiper2 img {
 		width: 100%;
		height: 300px;
		object-fit: cover;
	}

 	#acco-swiper-wrapper .mySwiper img {
 		width: 100%;
		height: 70px;
		object-fit: cover;
	}

 	.room-swiper-wrapper .roomSwiper img {
 		width: 100%;
		height: 400px;
		object-fit: cover;
	}
	
	.room-thumbnail {
		height: 250px;
		object-fit: cover;
	}
	
	/* 크롤링데이터 h3 폰트크기, 스타일 강제변경 */
	#acco-info-detail h3 {
		font-size: 1rem !important;
		font-weight: bold !important;
	}
	@media (min-width: 1200px)
	#acco-info-detail h3 {
	    font-size: 1rem !important;
	    font-weight: bold !important;
	}
	
	/* 크롤링 데이터 잘못 저장된 내용 안보이게 처리 (추후 가능하면 DB 데이터 수정) */
	#acco-info-detail .comment_mobile,#google_maps {
		display: none;
	}

</style>


<title>거기어때</title>
</head>
<!-- 받아오는 것 -->
<!-- 업소리스트(OWNER_LIST : detail)  -->
<!-- 방 정보(ROOM_LIST : roomInfo) -->
<!-- 방 사진(ROOM_PHOTO : roomPhoto) -->
<!-- 편의기능(roomAcco1) -->
<!-- 룸 리뷰(ROOM_REVIEW : roomReview) -->
<!-- 평점(roomAvgPoint) -->
<!-- 평점 별표시(avgPointStar) -->
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container my-5" style="min-width:992px; max-width:992px;">
	<!-- 숙소 소개 -->
	<div class="row">
		<!-- 숙소 이미지 swiper -->
		<div class="col-6 mb-3 pe-3">
			<div id="map" style="width:100%;height:400px;"></div>
				<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=hlu7pcd7ui"></script>
				<script>
					var mapOptions = {
						center: new naver.maps.LatLng(37.3595704, 127.105399),
						zoom: 17,
						draggable: false,
			      pinchZoom: false,
			      scrollWheel: false,
			      keyboardShortcuts: false,
			      disableDoubleTapZoom: true,
			      disableDoubleClickZoom: true,
			      disableTwoFingerTapZoom: true
					};

					var map = new naver.maps.Map('map', mapOptions);
				</script>
			</div>
		<div class="col-6">
			<div class="d-flex justify-content-between">
				<h4 id="acco-name" class="fw-semibold text-dark p-1 me-3" style="word-break: keep-all;">${ detail.building_name }</h4>
			</div>
			
			<p>${ detail.address1 } ${ detail.address2 }</p>
			<div class="bg-light p-3">
				<div class="fw-bold text-dark mb-3">사장님 한마디</div>
				<p>
					${ detail.owner_comment }
				</p>
			</div>
		</div>
	</div>
	<!-- 상세 정보 탭 -->
	<div class="row">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active text-secondary fw-bold" id="room-tab" data-bs-toggle="tab"
					data-bs-target="#room-tab-pane" type="button" role="tab"
					aria-controls="room-tab-pane" aria-selected="true">객실안내/예약</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link text-muted" id="info-tab" data-bs-toggle="tab"
					data-bs-target="#info-tab-pane" type="button" role="tab"
					aria-controls="info-tab-pane" aria-selected="true">숙소정보</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link text-muted" id="review-tab" data-bs-toggle="tab"
					data-bs-target="#review-tab-pane" type="button" role="tab"
					aria-controls="review-tab-pane" aria-selected="true">리뷰</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<!-- 객실안내/예약 -->
			<div class="tab-pane fade show active" id="room-tab-pane" role="tabpanel" aria-labelledby="room-tab" tabindex="0">
				
				<div class="my-3">
					<!-- 숙박 일정 선택 : 기본적으로 검색페이지에서 선택한 날짜를 출력, 이 페이지에서 일정을 변경하면 로컬스토리지에 저장돼서 검색 페이지에도 반영된다. -->
					<div class="col">
						<input type="text" id="demo" name="demo">
						<script type="text/javascript">
						$(function() {
						               
						
							
							var date = new Date();
							var currentMonth = date.getMonth();
							var currentDate = date.getDate();
							var currentYear = date.getFullYear();
							$('#demo').daterangepicker({
							    "maxSpan": {
							        "days": 7
							    },
							    "locale": {
							        "format": "YYYY/MM/DD",
							        "separator": " - ",
							        "applyLabel": "확인",
							        "cancelLabel": "취소",
							        "fromLabel": "From",
							        "toLabel": "To",
							        "customRangeLabel": "Custom",
							        "weekLabel": "W",
							        "daysOfWeek": [
							            "일",
							            "월",
							            "화",
							            "수",
							            "목",
							            "금",
							            "토"
							        ],
							        "monthNames": [
							            "1월",
							            "2월",
							            "3월",
							            "4월",
							            "5월",
							            "6월",
							            "7월",
							            "8월",
							            "9월",
							            "10월",
							            "11월",
							            "12월"
							        ],
							        "firstDay": 7
							    },
							    "minDate": moment(date),
							    "startDate": moment(date),
							    "endDate": moment(date).add(1,'days')
							}, function(start, end, label) {
							  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
							  
							  var newstart = new Date(start);
							  var newend = new Date(end);
							  var section = newend.getDate() - newstart.getDate();
							  
							  $('input[name=startdate]').attr('value',start);
							  $('input[name=enddate]').attr('value',end);
							  $('input[name=section]').attr('value',section);
							  
							  
							  sessionStorage.setItem("section", section);
							  console.log(start + " + " + end);
							  console.log(section);
							});
						});
						</script>
					</div>
				</div>
				
				<c:forEach var="roomd" items="${ roomInfo }">
					<div id="room-list-wraper" class="mx-0"><!-- 객실 정보 출력 -->
						<div class="card-room-info card mb-3">
							<div class="card-body row">
								<div class="position-relative">				
									 <img src="${path}/resources/images/${roomd.PICTURE_URL}" width="100px" height="100px">
									<div class="card-img-overlay overlay-room-thumbnail">
										<i class="bi bi-images fs-3 text-white position-absolute bottom-0 end-0 p-3"></i>
									</div>
								</div>
							</div>
							<div class="col-7 p-3 d-flex flex-column justify-content-between">
								<h5 class="text-dark fw-lighter">${roomd.ROOM_NAME}</h5>
								<div class="pb-3 border-bottom text-dark fw-lighter">
									가격<span class="float-end">1박 <span class="fw-bold text-dark">${roomd.ROOM_PRICE} 원</span></span>
								</div>
							</div>
							<form name="form1" action="${path}/pay/pay.do" method="post" >
							 <input name="building_name" type="hidden" value="${detail.building_name}">
							 <input name="ROOM_NO" type="hidden" value="${roomd.ROOM_NO }">
							 <input name="startdate" class="startdate" type="hidden" >
							 <input name="enddate" class="enddate" type="hidden" >
							 <input name="section" class="section" type="hidden" >
							 <button class="btn-room-reserve btn btn-danger w-100" >예약</button>					
							 <%--  <a href="${path}/pay/pay.do?ROOM_NO=${roomd.ROOM_NO}" class="btn-room-reserve btn btn-danger w-100">예약</a> --%>						 
						  </form>
						</div>
					</div>
				</c:forEach>
				
				
				<script type="text/javascript">
					
				</script>
				<!-- 페이징 버튼 : 버튼을 누르면, 해당 값을 currentPage로 해서 숙소정보를 다시 출력한다. -->
				<div id="pagination-wrapper" class="d-flex justify-content-center">
					<ul id="ul-item-wrapper" class="pagination" class="mx-auto">
					</ul>
				</div>
			</div>
			
			<!-- 숙소정보 -->
			<div class="tab-pane fade" id="info-tab-pane" role="tabpanel" aria-labelledby="info-tab" tabindex="0">
				<div class="accordion accordion-flush" id="accordion-acco-info">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
								편의시설
							</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordion-acco-info">
							<div class="accordion-body bg-light text-muted p-5 m-3 small">
								<div id="acco-info-detail">
									${ detail.accomodation }
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingTwo">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
								사진
							</button>
						</h2>
						<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordion-acco-info">
							<div class="accordion-body bg-light text-muted p-5 m-3">
								<c:forEach var="restphoto" items="${ photolist }">
									<div class="mb-3 small fw-bold ps-3">${ restphoto.ROOM_NAME }</div>
									<div id="cofas-wrapper" class="d-flex flex-wrap justify-content-start mb-5">
										<div>
											${ restphoto.PHOTO1 } ${ restphoto.PHOTO2 } ${ restphoto.PHOTO3 } ${ restphoto.PHOTO4 } ${ restphoto.PHOTO5 }
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 리뷰 -->
			<div class="tab-pane fade" id="review-tab-pane" role="tabpanel" aria-labelledby="review-tab" tabindex="0">
				<div class="row p-5 text-center border-bottom">
					<h5>이곳의 평점은...</h5>
					<!-- 숙소 객체의 별점아이콘 객체를 활용해서 평점에 따른 별표 출력 -->
					<div id="review-rate-wrapper" class="text-warning fs-3 mb-3">
						<i class="bi ${ avgPointStar.star1 }"></i>
						<i class="bi ${ avgPointStar.star2 }"></i>
						<i class="bi ${ avgPointStar.star3 }"></i>
						<i class="bi ${ avgPointStar.star4 }"></i>
						<i class="bi ${ avgPointStar.star5 }"></i>
						<span class="text-muted mx-1">${ roomAvgPoint }</span>
					</div>
					<p style="text-align: right;"></p>
					<c:forEach var="rep" items="${ newReview }">
						<div class="row p-5 border-bottom" style="text-align: left;">
							<c:if test="${ rep.COMMENTNO == 1 }">
								<div class="col-2 profile-image-wrapper rounded-circle">
								</div>
								<div class="col">
									<strong class="text-dark"></strong>
									<div class="text-warning">
										<span class="text-muted mx-1">${ rep.USERID }</span>
									</div>
									<p class="my-1">
										<small>${ rep.POINT }점</small> / <small>${ rep.ROOM_NAME } 이용</small><br/>
									</p>
									<p class="text-dark my-3 small">${ rep.CONTENT }</p>
									<c:forEach var="ownerrep" items="${ newReview }">
										<c:if test="${ ownerrep.REPLYNO == rep.REPLYNO && ownerrep.COMMENTNO == 2 }">
											<p style="background-color: #FF9DA2">
												사장님<br/>
												${ ownerrep.CONTENT }
											</p>
										</c:if>
									</c:forEach>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
				<!--  윈도우 바닥으로 스크롤을 내리면 리뷰가 출력된다. -->
			</div>
		</div>
	</div>
	<div class="fixed-bottom d-flex justify-content-end">
		<i class="bi bi-arrow-up-circle fs-2 p-5" onclick="javscript:(function(){window.scrollTo(0,0);})();" style="cursor: pointer;"></i>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>

<!-- 객실 정보 모달 -->
<div class="modal fade" id="link-room-info" tabindex="-1" aria-labelledby="roomInfoModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<span class="modal-title fw-bold text-dark" id="roomInfoModalLabel">객실 이용 안내</span>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body small">
				<div class="my-3 border-bottom">
					<label class="fw-bold mb-3">기본정보</label>
					<ul>
						<!-- room_name, room_capacity -->
						<li>객실명 <span id="modal-content-name"></span></li>
						<li>정원 <span id="modal-content-capacity"></span>명</li>
					</ul>
				</div>
				<div class="my-3 border-bottom">
					<label class="fw-bold mb-3">객실소개</label>
					<ul>
						<li id="modal-content-description"></li>
					</ul>
				</div>
				<div class="my-3 border-bottom">
					<label class="fw-bold mb-3">편의시설</label>
					<ul>
						<!-- 현재 객실의 room facilities 모두 조회해서 출력 -->
						<li id="modal-content-rofas"></li>
					</ul>
				</div>
				<div class="my-3">
					<label class="fw-bold mb-3">선택날짜</label>
					<ul>
						<!-- 현재 사용자가 선택한 날짜를 출력 -->
						<li><span id="modal-content-startdate"></span> ~ <span id="modal-content-enddate"></span><span id="modal-cotent-duration"></span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function () {
/**
 * 선택 시 메뉴 스타일 변경하는 이벤트핸들러 등록
 * 해당 엘리먼트가 클릭될 때마다 각 버튼 태그의 active 여부에 따라 text-muted 클래스, text-secondary, fw-bold 클래스를 추가/삭제한다.
 * (active 클래스에 대한 토글은 부트스트랩 js에서 이미 구현하고 있다)
 */
	let $tabButtons = $('#myTab [data-bs-toggle="tab"]');
	$tabButtons.click(function(){
		$tabButtons.each(function (){
			if ($(this).hasClass('active')) {
				$(this).removeClass('text-muted').addClass('fw-bold').addClass('text-secondary');
			} else {
				$(this).addClass('text-muted').removeClass('fw-bold').removeClass('text-secondary');
			}
		  	// 사용자가 리뷰를 스크롤링으로 조회하다가 다른 탭을 눌렀을 때 footer를 다시 보여주기
			if ($(this).attr('id') != "review-tab") {
				$("#footer").removeClass('d-none');
			}
		});
	});
});

/**
 * 페이징 버튼을 누르면 객실정보를 갱신하면서 currentPage의 값을 바꾸고, active 클래스의 상태를 변경시키는 함수 
 */
function changeCurrentPage(num) {
	$("#pagination-wrapper .page-item").removeClass("active");
	$('li[data-page-num="' + num +'"]').addClass("active");
	// num을 currentPage로 하는 객실 정보 출력
	searchRooms(num);
	// 페이지 버튼 상태 갱신
	refreshPaginationButton(num);
}
</script>
</body>
</html>