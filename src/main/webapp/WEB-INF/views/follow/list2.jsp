<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/follow.css">

<c:choose>
	<%-- 팔로워나 팔로잉이 목록에 없을때. --%>
	<c:when test="${empty follow_list}">
		<div class="w3-row-padding">
			<div class="w3-col m12">
				<div class="w3-card w3-round w3-white">
					<div class="w3-container w3-padding">
						<span>
							<button type="button" class="w3-button w3-theme-d1"
								id="getfollower_Btn" value="${page_id}">
								<i class="fa fa-thumbs-up"></i> 팔로워
							</button>
						</span>
						<hr class="w3-clear" style="margin: 5px 0 20px;">

						<span> <img src="/TeamPro/resources/css/baby.jpg"
							alt="공백 사진" class="w3-left w3-circle w3-margin-right"
							style="width: 60px">
						</span>


						<h1>저런! 친구를 만드세요!</h1>
						<br>
						<hr class="w3-clear">
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<%-- 팔로워나 팔로잉이 목록에 있을때. --%>
	<c:otherwise>

		<div class="w3-row-padding">
			<div class="w3-col m12">
				<div class="w3-card w3-round w3-white">
					<div id="div_flist" class="w3-container w3-padding">
						<span id="s_listArea"> <%-- 팔로워 팔로잉 목록 버튼 --%>
							
						</span>
						<hr class="w3-clear" style="margin: 5px 0 20px;">
						
						<%-- <div id="list_${target_id}">

							<span id="s_picArea"> 프로필 사진 
								
							</span>

							팔로우,언팔로우, 차단 버튼 상황에 따라 바뀜
							<span id="s_btnArea" class="w3-right"> 
							</span>
							<h4><a href="">${target_id}</a></h4>
							<br>
							<hr class="w3-clear">
						</div> --%>

					</div>
				</div>
			</div>
		</div>

	</c:otherwise>


</c:choose>
<button onclick="getFollowerList('aaaa', 'aaaa')">테스트</button>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/followblock.js"></script>

