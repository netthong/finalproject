<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>홈</title>
<style>
	.home{
		display: block;
	}
	
	.carousel-img {
		height: 420px;
		object-fit: cover;
	}
	
	.card-img-overlay {
		background-color: rgba(0, 0, 0, 0.3);
	}
	
	.card-img-overlay:hover {
		background-color: rgba(255, 255, 255, 0.75);
	}
	
	.acco-info {
		display: none!important;
	}
	
	.card-img-overlay:hover .acco-info {
		display: block!important;
	}
	
	.card-img-overlay:hover #link-best {
		color: black!important;
	}
	
	.slider {
        width: 500px;
        height: 500px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 0px;
        text-align: center;
        overflow: hidden;
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
<script type="text/javascript"></script>
</head>
<body>
<%@ include file="common/nav.jsp" %>
<div class="home" >
<div class="container">
    <div class="slider">
	    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-inner" style="margin-top: 40px;">
			  <c:forEach var="dto" items="${list}" varStatus="status">
			  	<c:if test="${status.count != 1}"></c:if>
				  	<div class="carousel-item">
				      <img src="${path}/resources/images/${dto.event_mainphoto}" width="500" height="500">
				    </div>
			    <c:if test="${status.count == 1}">
			    	<div class="carousel-item active">
			      <img src="${path}/resources/images/${dto.event_mainphoto}" width="500" height="500">
			    </div>
			    </c:if>
			  </c:forEach>
			  </div>
			   <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
		<div class="d-flex flex-wrap justify-content-evenly" style="min-height: 350px;">
			<!-- 숙소유형별 조회 -->
				<div class="text-center my-auto">
					<a href="${path}/building/search.do?buildingtype=m"><img class="img-fluid" src="${path}/resources/images/homeicons/TYPE_001.png" style="width:100px;height:auto;"></a><br/>
			    <a href="${path}/building/search.do?buildingtype=m" class="text-decoration-none text-dark fw-light" style="font-family: 'Happiness-Sans-Title'; font-weight: bold; ">모텔</a>
				</div>
				<div class="text-center my-auto">
					<a href="${path}/building/search.do?buildingtype=h"><img class="img-fluid" src="${path}/resources/images/homeicons/TYPE_002.png" style="width:100px;height:auto;"></a><br/>
			    <a href="${path}/building/search.do?buildingtype=h" class="text-decoration-none text-dark fw-light" style="font-family: 'Happiness-Sans-Title'; font-weight: bold; ">호텔 리조트</a>
				</div>
				<div class="text-center my-auto">
					<a href="${path}/building/search.do?buildingtype=p"><img class="img-fluid" src="${path}/resources/images/homeicons/TYPE_003.png" style="width:100px;height:auto;"></a><br/>
				    <a href="${path}/building/search.do?buildingtype=p" class="text-decoration-none text-dark fw-light" style="font-family: 'Happiness-Sans-Title'; font-weight: bold; ">펜션</a>
				</div>
	
				<div class="text-center my-auto">
					<a href="${path}/building/search.do?buildingtype=g"><img class="img-fluid" src="${path}/resources/images/homeicons/TYPE_004.png" style="width:100px;height:auto;"></a><br/>
			    <a href="${path}/building/search.do?buildingtype=g" class="text-decoration-none text-dark fw-light" style="font-family: 'Happiness-Sans-Title'; font-weight: bold; ">게스트하우스</a>
				</div>
		</div>
		<div class="row my-5 mx-auto" style="max-width: 950px;">
			<div class="fw-bold text-dark mb-3"> 거기어때 소식</div>
			<div class="d-flex flex-wrap justify-content-between ">
				<div class="card flex-fill p-1 mb-3 me-3">
					<div class="row g-0">
			  			<div class="col-md-4">
			    			<a href="#"><img src="resources/images/commerce.png" style="width:170px; height: 130px;" class="img-fluid rounded-start" alt="..."></a>
			  			</div>
			  			<div class="col-md-8">
			    			<div class="card-body">
			      				<h5 class="card-title" style="font-weight: bold;">거기어때<br> 광고 신청하기</h5>
			      				<p class="card-text">고정고객 확보<br>신규 회원 유치 가능합니다!</p>
			    			</div>
			  			</div>
					</div>
				</div>
				<div class="card flex-fill p-1 mb-3">
					<div class="row g-0">
						<div class="col-md-4">
				    		<a href="#"><img src="resources/images/guesthouse.png" style="width:170px; height: 130px;" class="img-fluid rounded-start" alt="..."></a>
				  		</div>
				  		<div class="col-md-8">
				    		<div class="card-body">
				      			<h5 class="card-title" style="font-weight: bold;">게스트하우스<br>숙소 등록하기</h5>
				      			<p class="card-text">숙소 등록하고<br>더 많은 고객 확보하세요!</p>
				    		</div>
				  		</div>
					</div>
				</div>
			</div>
		</div>
</div>
</div>
<script type="text/javascript">
</script>
<%@ include file="common/footer.jsp" %>
</body>
</html>
