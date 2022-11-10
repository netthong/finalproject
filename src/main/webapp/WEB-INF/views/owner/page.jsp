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
<title>owner</title>
<%@ include file="../include/header.jsp" %>
<style>	
 .col-3 {
  display: flex;
  flex-wrap: inherit;
	align-items: center;
	justify-content: space-between;
	width: 100%;
	padding-right: calc(var(--bs-gutter-x) * .5);
	padding-left: calc(var(--bs-gutter-x) * .5);
	margin-right: auto;
	margin-left: auto;
	margin-top: 45px;
	max-width: 1320px;
	--bs-gutter-x: 1.5rem;
	--bs-gutter-y: 0;
	padding: var(--bs-navbar-padding-y) var(--bs-navbar-padding-x);
 }
</style>
</head>
<body>
<%@ include file="../common/owner_nav.jsp" %>



<div class="col-3">
			<!-- 사이드바 -->
	<aside>
			<jsp:include page="../common/ownersidebar.jsp" />
	</aside>
</div> 

<%@ include file="../common/footer.jsp" %>
</body>
</html>