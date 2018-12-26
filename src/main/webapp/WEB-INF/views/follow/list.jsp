<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/follow.css">

<c:choose>
	<%-- 현재 보이는 리스트 페이지가 나의 페이지 일때. --%>
	<c:when test="${member.ID eq page_id}">
		<c:set var="is_mypage" value="true" />
	</c:when>

	<%-- 현재 보이는 리스트 페이지가 다른 사람의 페이지 일때. --%>
	<c:otherwise>
		<c:set var="is_mypage" value="false" />
	</c:otherwise>
</c:choose>

<c:choose>
	<%-- 팔로워나 팔로잉이 목록에 없을때. --%>
	<c:when test="${empty follow_list}">
		<div class="w3-row-padding">
			<div class="w3-col m12">
				<div class="w3-card w3-round w3-white">
					<div class="w3-container w3-padding">
						<span>
							<button type="button" class="w3-button w3-theme-d1"
								id="follower_Btn" value="${page_id}">
								<i class="fa fa-thumbs-up"></i> 팔로워
							</button>

							<button type="button" class="w3-button w3-theme-d1"
								id="following_Btn" value="${page_id}">
								<i class="fa fa-thumbs-up"></i> 팔로잉
							</button>
						</span>
						<hr class="w3-clear" style="margin: 5px 0 20px;">

						<img src="/TeamPro/resources/css/baby.jpg" alt="공백 사진"
							class="w3-left w3-circle w3-margin-right" style="width: 60px">

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
					<div class="w3-container w3-padding">
						<span>
							<button type="button" class="w3-button w3-theme-d1"
								id="follower_Btn" value="${page_id}">
								<i class="fa fa-thumbs-up"></i> 팔로워
							</button>

							<button type="button" class="w3-button w3-theme-d1"
								id="following_Btn" value="${page_id}">
								<i class="fa fa-thumbs-up"></i> 팔로잉
							</button>
						</span>
						<hr class="w3-clear" style="margin: 5px 0 20px;">
						<c:set var="index" value="0" />
						<c:forEach var="follow_list" items="${follow_list}">

							<c:choose>
								<%-- 팔로워 리스트 --%>
								<c:when test="${type eq 'follower'}">
									<c:choose>
										<%-- 내 팔로워 리스트일때. --%>
										<c:when test="${is_mypage eq 'true'}">
											<c:set var="type_Btntext" value="차단" />
										</c:when>
										<%-- 내 팔로워 리스트가 아닐때 --%>
										<c:otherwise>
											<c:set var="type_Btntext" value="팔로우" />
										</c:otherwise>
									</c:choose>
									<c:set var="target_id" value="${follow_list.follower_id}" />
								</c:when>
								<%-- 팔로잉 리스트 --%>
								<c:when test="${type eq 'following'}">
									<c:choose>
										<%-- 내 팔로잉 리스트일때. --%>
										<c:when test="${is_mypage eq 'true'}">
											<c:set var="type_Btntext" value="언팔로우" />
										</c:when>
										<%-- 내 팔로잉 리스트가 아닐때 --%>
										<c:otherwise>
											<c:set var="type_Btntext" value="팔로우" />
										</c:otherwise>
									</c:choose>
									<c:set var="target_id" value="${follow_list.following_id}" />
								</c:when>
							</c:choose>
							<div id="${target_id}">
								<img src="/TeamPro/resources/css/baby.jpg" alt="프로필 사진"
									class="w3-left w3-circle w3-margin-right" style="width: 60px">


								<%-- 팔로우,언팔로우, 차단 버튼 상황에 따라 바뀜 --%>
								<span class="w3-right">
									<button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn"
										id="followBtn" onclick="follow('${page_id}', '${target_id}')">팔로우</button>
									<button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn fbhide"
										id="followingBtn">팔로잉</button>
									<button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn"
										id="unfollowBtn"
										onclick="unfollow('${page_id}', '${target_id}')">언팔로우</button>
									<button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom blockBtn fbBtn fbhide"
										id="blockBtn">차단</button>
									<button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom blockingBtn fbBtn fbhide"
										id="blockingBtn">차단중</button>
									<button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom blockBtn fbBtn fbhide"
										id="unblockBtn">차단 해제</button>
								</span>
								<h4>${target_id}</h4>
								<br>
								<hr class="w3-clear">
							</div>
							<c:set var="index" value="${index+1}" />

						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</c:otherwise>


</c:choose>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/followblock.js"></script>

