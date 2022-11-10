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
   
    
    function room_update(){
    	
    		var building_name=$("#room_name").val();
    		var building_type=$("#room_no").val();
    		var zipcode=$("#room_price").val();
    		if(room_name==""){
    			alert("방 이름을 입력하세요");
    			$("#room_name").focus();
    			return;
    		}
    		if(room_no==""){
    			alert("방 번호를 입력하세요");
    			$("#room_no").focus();
    			return;
    		}
    		if(room_price==""){
    			alert("가격을 입력하세요");
    			$("#room_price").focus();
    			return;
    		}
    		document.form1.action="${path}/room/update.do";
    		document.form1.submit();
    	}
    
    
    function room_delete(){
     	if(confirm("삭제 하시겠습니까?")){
    		document.form1.action="${path}/room/delete.do";
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
<a class="navbar-a">&nbsp;방 정보 수정</a></nav>


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
		 
		<table>
 <tr>
  <td>방 이름</td>
  <td><input name="room_name" id="room_name" value="${dto.room_name}"></td>
 </tr>
 <tr>
  <td>방 번호</td>
  <td><input name="room_no" id="room_no" value="${dto.room_no}"> </td>
 </tr>
 <tr>
  <td>가격</td>
  <td><input name="room_price" id="room_price" value="${dto.room_price}"> </td>
 </tr>
 <tr>
  <td>방 갯수</td>
  <td>
   <select name="room_amount">
			<c:forEach begin="1" end="10" var="i"><!--상품갯수 선택 (1~10개)-->
					<option value="${i}">${i}</option>
			</c:forEach>
	 </select>
  </td>
 </tr>
 <tr>
  <td>인원</td>
  <td>
   <select name="room_size">
			<c:forEach begin="1" end="10" var="i"><!--인실 선택 (1~10인)-->
					<option value="${i}">${i}인실</option>
			</c:forEach>
	 </select>
  </td>
 </tr>
 <tr>
  <td>방 사진</td>
  <td>
   <input type="file" name="file1" id="file1">
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="hidden" name="room_no" value="${dto.room_no}">
   <input type="button" value="수정" onclick="room_update()">
	 <input type="button" value="삭제" onclick="room_delete()">
   <input type="button" value="목록" onclick="location.href='${path}/room/list.do'">
  </td>
 </tr>
</table>
		</form>
 </div>


	<%@ include file="../common/footer.jsp" %>
</body>
</html>