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
<title>building_detail</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../common/owner_nav.jsp" %>
<h2>건물 상세(값 넘기기 용)</h2>
<table>
	<tr>
		<td><img src="${path}/images/${dto.picture_url}"
					width="300px" height="300px"></td>
		<td align="center">	
			<table>
				<tr>
					<td>건물이름</td>
					<td>${dto.building_name}</td>
				</tr>
				<tr>
					<td>건물종류</td>
					<td>${dto.building_type}</td>
				</tr>
				<tr>
					<td>사장님한마디</td>
					<td>${dto.owner_comment}</td> 
				</tr>
				<tr>
					<td>편의시설</td>
					<td>${dto.accomodation}</td> 
				</tr>
				<tr>
					<td>주소</td>
					<td>${dto.address1}</td>
					<td>${dto.address2}</td>
					<td>${dto.zipcode}</td> 
				</tr>
				<tr>
				 <td><input type="text" name="building_code" value="${dto.building_code}"> </td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<%@ include file="../common/footer.jsp" %>
</body>
</html>