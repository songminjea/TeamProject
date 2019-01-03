<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.searchTemplateStyle{
width: 30%; 
margin: 0px 10px 10px 10px;

}

</style>

</head>
<body>


<!-- Profile -->
	<div class=" w3-row-padding">
		<input type="text" id="search_keyword" id="search_keyword">
		<a href="" onclick="return false;" id="search_confirm"><i class="fa fa-search fa-fw w3-margin-right w3-text-theme"></i></a>
		<hr class="w3-clear" style="margin: 5px 0 20px;">
		<br>
		<c:forEach var="search_mem" items="${search_Mem}">
			<div class="w3-col w3-card w3-round w3-white searchTemplateStyle">
				<div class="w3-container">
					<br />
					<div class="w3-center image_wrapper">
						<%-- 만약 회원 프로필 이미지가 없을 경우에는 기본 이미지를 띄운다. --%>
						<c:choose>
							<c:when test="${empty profile.PIC}">
								<img
									src="${pageContext.request.contextPath}/resources/img/baby.jpg"
									alt="defaultImage">
							</c:when>
							<c:otherwise>
								<img src="${search_mem.PIC}">
							</c:otherwise>
						</c:choose>
					</div>
					<hr>
					<%-- 회원 정보 --%>
					<div class="member_icon" style="font-weight: 500; font-size: 15px;">
						<p>
							${search_mem.ID}
						</p>
						<p>
							<i class="fa fa-envelope fa-fw w3-margin-right w3-text-theme"></i>
							${search_mem.EMAIL}
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	


	<script type="text/javascript">
	$(document).ready(function(){
		$("#search_confirm").on("click", function(){
			var keyword = $("#search_keyword").val();
			
			location.href="?keyword="+keyword;
		});
	});
</script>

</body>
</html>