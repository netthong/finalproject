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
<style>

a{
	text-decoration: none;
}

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
</style>

<title>building_detail</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../common/owner_nav.jsp" %>
<h2>방 상세(값 넘기기 용)</h2>
<table>
	<tr>
		<td><img src="${path}/images/${dto.picture_url}"
					width="300px" height="300px"></td>
		<td align="center">	
			<table>
				<tr>
					<td>방 이름</td>
					<td>${dto.room_name}</td>
				</tr>
				<tr>
					<td>방 번호</td>
					<td>${dto.room_no}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${dto.room_price}</td> 
				</tr>
				<tr>
					<td>방 갯수</td>
					<td>${dto.room_amount}</td> 
				</tr>
				<tr>
					<td>인원</td>
					<td>${dto.room_size}</td>
				</tr>				
			</table>
		</td>
	</tr>
</table>


<%@ include file="../common/footer.jsp" %>
</body>
</html>