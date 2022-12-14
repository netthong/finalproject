<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
span.main { color:#808080; font-size:17px; font-weight:bold;}
span.sub { color:#C0C0C0; font-size:14px; }
</style>
<div class="container">
	<div class="list-unstyled" id="collapse-content">
		<ul class="list-unstyled">
			<li class="mb-4">
				<a href="${path}/admin/userList.do" class="text-decoration-none"><span class="main">회원 목록</span></a>
			</li>
			
			<li class="mb-4">
				<a href="${path}/admin/admission.do" class="text-decoration-none"><span class="main">건물 승인</span></a>
			</li>
			
			<li class="mb-4">
				<button class="btn nav-link border-0"><span class="main" data-bs-toggle="collapse" data-bs-target="#cat02" onclick="hideOthers(event)">베너 등록</span></button>
				<div class="collapse" id="cat02">
					<ul class="list-unstyled">
						<li><a href="${path}/admin/bannerUp.do" class="text-decoration-none"><span class="sub">등록</span></a></li>
						<li><a href="${path}/admin/bannerList.do" class="text-decoration-none"><span class="sub">관리</span></a></li>
					</ul>
				</div>
			</li>
			
		</ul>
	</div>
</div>
<script type="text/javascript">
	let collapseLinks = document.querySelectorAll("#collapse-content span.main");
	
	// 사이드바 메뉴 클릭시 다른 메뉴 닫는 스크립트
	function hideOthers(event) {
		let clickedLink = event.target;
		
		let clickedLinkId = event.target.getAttribute("data-bs-target");
		let clickedLinkDiv = document.querySelector(clickedLinkId);
		if (clickedLinkDiv.classList.contains("collapsed")) {
			return;
		}
		
		for (let index = 0; index < collapseLinks.length; index++) {
			let link = collapseLinks[index];
			let linkId = link.getAttribute("data-bs-target");
			if (link.getAttribute("data-bs-target") === clickedLinkId) {
				continue;
			}
			
			let div = document.querySelector(linkId);
			if (div.classList.contains('show')) {
				link.click();
			}			
		}
	}
	
</script>
