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
	<div class=" w3-row-padding" style="text-align: left;">
		<c:if test="${empty search_Mem}">
			<div class="w3-col m12 w3-card w3-round w3-white">
				<div class="w3-container">
					<h1>${keyword}로 검색한 결과가 없습니다.</h1>
				</div>
			</div>
		</c:if>
	
		<c:forEach var="search_mem" items="${search_Mem}">
			<c:set var="s_id" value="${search_mem.ID}"></c:set>
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
					<c:choose>
						<c:when test="${isfollowed[s_id] eq false}">
							<c:set var="followhide" value=""/>
							<c:set var="followinghide" value="fbhide"/>
						</c:when>
						<c:when test="${isfollowed[s_id] eq true}">
							<c:set var="followhide" value="fbhide"/>
							<c:set var="followinghide" value=""/>						
						</c:when>
						<c:otherwise>
							<c:set var="followhide" value="fbhide"/>
							<c:set var="followinghide" value="fbhide"/>
						</c:otherwise>
						
						
					</c:choose>
						<span class="w3-right smallSizeFont">
							<button type="button"
								class="w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn ${followhide} fbtn_${search_mem.ID}"
								value='${search_mem.ID}'>팔로우</button>
							<button type="button"
								class="w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn ${followinghide} fbtn_${search_mem.ID}"
								value='${search_mem.ID}'>
								<span>팔로잉</span> <span>언팔로우</span>
							</button>
						</span>
						<p style="padding-top: 5px; margin-bottom: 7px;">
							<a href="${pageContext.request.contextPath}/${search_mem.ID}/gallery"> ${search_mem.ID} </a>
						</p>
						<br>
						
						<p>
							<i class="fa fa-envelope fa-fw w3-margin-right w3-text-theme"></i>
							${search_mem.EMAIL}
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	



</body>
</html>