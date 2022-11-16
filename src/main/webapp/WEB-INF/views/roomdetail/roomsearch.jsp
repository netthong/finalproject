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
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<title>Insert title here</title>
</head>
<body>
<body>
<%@ include file="../common/nav.jsp" %>
<form id="form-search-accos">
	<div class="row bg-secondary m-0" style="height:13vh;">
		<input type="hidden" name="currentLat" value="" />
		<input type="hidden" name="currentLong" value="" />
		<div class="px-3 pt-5 pb-3 mx-auto" style="min-width:992px; max-width:992px;">
			<c:choose>
				<c:when test="${ param.buildingtype == 'm' }">
					<input type="hidden" name="type" value="${ param.buildingtype }" />
					<h3 class="text-white ps-0 mb-3">모텔</h3>
				</c:when>
				<c:when test="${ param.buildingtype == 'h' }">
					<input type="hidden" name="type" value="${ param.buildingtype }" />
					<h3 class="text-white ps-0 mb-3">호텔/리조트</h3>
				</c:when>
				<c:when test="${ param.buildingtype == 'p' }">
					<input type="hidden" name="type" value="${ param.buildingtype }" />
					<h3 class="text-white ps-0 mb-3">펜션</h3>
				</c:when>
				<c:when test="${ param.buildingtype == 'g' }">
					<input type="hidden" name="type" value="${ param.buildingtype }" />
					<h3 class="text-white ps-0 mb-3">게스트하우스</h3>
				</c:when>
			</c:choose>
		</div>
	</div>
	<div class="container my-3" style="min-width:992px; max-width:992px;">
		<div class="row p-3">
			<div class="col d-flex justify-content-start align-items-center my-auto px-0">
			</div>
			<div class="col d-flex justify-content-end align-items-center my-auto">
			</div>
		</div>
			<div class="row">
				<div class="col-4">
					<div class="card p-1">
						<ul class="list-group list-group-flush">
							<li class="list-group-item py-3">
								<div class="fw-bold mt-3 mb-1 fs-5">주소</div>
								<input type="text" id="keyword" name="keyword" class="form-control"/>
							</li>
							<li class="list-group-item py-3">
								<div class="fw-bold mt-3 mb-1 fs-5">날짜</div>
								<div class="text-small mt-1 mb-3 text-muted">최대 7박까지 조회 가능</div>
								<input type="text" id="demo" name="demo" class="form-control" value="" />
								<script type="text/javascript">
								$(function() {
									var date = new Date();
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
							        "endDate": moment(date).add(1,'days'),
							        "drops": "down"
							    }, function (start, end, label) {
										console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
										sessionStorage.setItem("startdate", start);
									  sessionStorage.setItem("enddate", end);
									  var newstart = new Date(start);
									  var newend = new Date(end);
									  var section = newend.getDate() - newstart.getDate();
									  sessionStorage.setItem("section", section);
									  console.log(start + " + " + end);
									  console.log(section);
							    });
								});
								</script>
								<input type="hidden" name="startDate" value="" />
								<input type="hidden" name="endDate" value="" />
							</li>
							<li class="list-group-item py-3">
								<div class="fw-bold mb-3 fs-5">상세조건</div>
								<div class="btn-toolbar row g-2" role="toolbar" aria-label="Toolbar with button groups">
									<div class="col">
										<button type="button" id="btn-reset" class="btn btn-outline-primary w-100">초기화</button>
									</div>
									<div class="col">
										<button type="button" id="btn-apply" class="btn btn-secondary w-100">적용</button>
									</div>
								</div>
							</li>
							<li class=" list-group-item py-3 border-bottom-0 text-muted">
								<div class="row d-flex justify-content-center">
									<div class="col-3 fw-bold text-muted my-auto">인원</div>
									<!-- 인원 수 표시 input 대신 span 태그 사용, 이벤트 script에서 설정하는 것으로 변경 예정 -->
									<div class="col-9 hstack gap-3">
										<button type="button" class="form-control btn btn-sm btn-light fs-4"
											onclick="this.parentNode.querySelector('input[type=number]').stepDown();">-</button>
										<input type="number" class="form-control form-control-lg fs-6 mx-auto" min="1" name="capacity" value="1" max="20" />
										<button type="button" class="form-control btn btn-sm btn-light fs-4"
											onclick="this.parentNode.querySelector('input[type=number]').stepUp();">+</button>
									</div>
								</div>
							</li>
							<li class="list-group-item py-3 border-bottom-0 text-muted">
								<div class="fw-bold mb-3">가격<small id="amount" class="text-secondary ms-3">1만원 이상</small></div>
								<div id="slider-range"></div>
							</li>
							<!-- 검색창으로 조회하는 경우 아래 옵션들이 카드에 표시된다. -->
							<li class="list-group-item py-3 border-bottom-0 text-muted">
								<div class="fw-bold mb-3">숙소 유형</div>
								<div class="row">
									<!-- 모든 숙소유형을 전달받아 반복문으로 출력 -->
									<div class="col-12 mb-3">
									</div>
									<c:forEach var="type" items="${ types }">
										<div class="col-12 mb-3">
											<input class="form-check-input" type="checkbox" name="types" value="${ type.building_type }">
											<label class="form-check-label">${ type.building_type }</label>
										</div>
									</c:forEach>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- 정렬기준, 지도버튼, 숙소 리스트 -->
				<div class="col-8">
					<!-- 정렬기준 radio button, 지도 modal button (버튼 스타일 식당 조회와 통일시킬 예정) -->
					<div class="d-flex flex-wrap mx-3 mb-3">
						<div id="btn-group-sort" class="btn-group flex-fill pe-2 my-auto" role="group" aria-label="Basic radio toggle button group">
							<input type="radio" class="btn-check" id="btnradio1" name="sort" value="rate">
							<label class="btn btn-secondary" for="btnradio1">평점 순</label>
							<input type="radio" class="btn-check" id="btnradio3" name="sort" value="lowprice">
							<label class="btn btn-secondary" for="btnradio3">낮은 가격 순</label>
							<input type="radio" class="btn-check" id="btnradio4" name="sort" value="highprice">
						  	<label class="btn btn-secondary" for="btnradio4">높은 가격 순</label>
						</div>
						<button type="button" class="btn btn-light my-auto" id="btn-open-modal-map"><i class="bi bi-map"></i></button>
					</div>
					<!-- 검색결과 조회 리스트 -->
					<div id="accos-wrapper" class="row px-3 mx-auto">
						<c:if test="${ empty searchlist }">
							<p class="my-5 text-center">조회된 결과가 없습니다.</p>
						</c:if>
						<c:forEach var="list" items="${ searchlist }">
							<div id="card-acco-' + acco.id +'" class="card text-bg-light p-0 rounded-0">
								<img src="" class="list-thumbnail card-img img-fluid rounded-0" alt="accommodation thumbnail">
								<a href="${ pageContext.request.contextPath }/roomdetail/view/${ list.building_code }">
									<div class="list-overlay card-img-overlay p-3 rounded-0 text-light d-flex justify-content-between">
										<div class="my-auto">
											<h5 class="fw-semibold">${ list.building_name }</h5>
											<p class="text-warning">
												<span class="badge bg-warning">평점</span><strong class="ms-2">리뷰갯수</strong>
											</p>
											<small>${ list.accomodation }</small>
										</div>
										<p class="text-end fs-4 fw-semibold mt-auto">최소가격<span class="fs-5"> 원 ~</span></p>
									</div>
								</a>
							</div>	
						</c:forEach>
						<!-- 숙소 검색결과가 script를 통해 출력됨-->
					</div>
				</div>
			</div>
	</div>
	<div class="fixed-bottom d-flex justify-content-end">
		<i class="bi bi-arrow-up-circle fs-2 p-5" onclick="javscript:(function(){window.scrollTo(0,0);})();" style="cursor: pointer;"></i>
	</div>
 </form>
<%@ include file="../common/footer.jsp" %>
</body>
</html>