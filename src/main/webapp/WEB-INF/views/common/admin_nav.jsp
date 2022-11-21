<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="tags.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>	
	@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
	    font-family: 'Cafe24Ssurround';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}

	.nav-container {
		display: flex;
		flex-wrap: inherit;
		align-items: center;
		justify-content: space-between;
		width: 100%;
		padding-right: calc(var(--bs-gutter-x) * .5);
		padding-left: calc(var(--bs-gutter-x) * .5);
		margin-right: auto;
		margin-left: auto;
		max-width: 1320px;
		--bs-gutter-x: 1.5rem;
		--bs-gutter-y: 0;
		padding: var(--bs-navbar-padding-y) var(--bs-navbar-padding-x);
	}
</style>

<nav class="navbar navbar-expand-md sticky-top bg-secondary navbar-dark">
	<div class="nav-container px-3">
		<!-- 홈버튼 -->
		<div style="text-align: center; width: 235px; font-family: yg-jalnan; font-size: 30px; ">
			<a class="navbar-brand" href="${path}/admin/userList.do">
				거기어때 관리자
			</a>
		</div>
		<ul class="navbar-nav">			
				<li class="nav-item" style="font-family: Cafe24Ssurround; font-size: 22px;"><a class="nav-link" href="${path}/admin/userList.do">회원 목록</a></li>
				<li class="nav-item" style="font-family: Cafe24Ssurround; font-size: 22px;"><a class="nav-link" href="${path}/admin/admission.do">건물승인</a></li>
				<li class="nav-item" style="font-family: Cafe24Ssurround; font-size: 22px;"><a class="nav-link" href="${path}/admin/bannerUp.do">베너 등록</a></li>
				<li class="nav-item" style="font-family: Cafe24Ssurround; font-size: 22px;"><a class="nav-link" href="${path}/user/logout.do">로그아웃</a></li>
		</ul>
	</div>
</nav>