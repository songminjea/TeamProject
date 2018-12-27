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

							<button type="button" class="w3-button w3-theme-d1"
								id="getfollowing_Btn" value="${page_id}">
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
								id="getfollower_Btn" value="${page_id}">
								<i class="fa fa-thumbs-up"></i> 팔로워
							</button>

							<button type="button" class="w3-button w3-theme-d1"
								id="getfollowing_Btn" value="${page_id}">
								<i class="fa fa-thumbs-up"></i> 팔로잉
							</button>
						</span>
						<hr class="w3-clear" style="margin: 5px 0 20px;">
						<c:set var="index" value="0" />
						<c:forEach var="follow_list" items="${follow_list}">

							<c:choose>
								<%-- 팔로워 리스트 --%>
								<c:when test="${type eq 'follower'}">
									<c:set var="target_id" value="${follow_list.follower_id}" />
								</c:when>
								<%-- 팔로잉 리스트 --%>
								<c:when test="${type eq 'following'}">
									<c:set var="target_id" value="${follow_list.following_id}" />
								</c:when>
							</c:choose>
							<%-- 리스트 생성 --%>
							<div id="list_${target_id}">
								<img src="/TeamPro/resources/css/baby.jpg" alt="프로필 사진"
									class="w3-left w3-circle w3-margin-right" style="width: 60px">

								<%-- 팔로우,언팔로우, 차단 버튼 상황에 따라 바뀜 --%>
								<span class="w3-right"> <c:set var="isfollowed"
										value="${isfollowing}" /> <c:choose>
										<%-- 내가 팔로우 하지 않은 사람일때. --%>
										<c:when test="${!isfollowed[index]}">
											<button type="button"
												class="w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn"
												onclick="follow('${member.ID}', '${target_id}')">팔로우</button>
										</c:when>
										<c:otherwise>
											<button type="button"
												class="w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn"
												onclick="unfollow('${member.ID}', '${target_id}')">
												<span>팔로잉</span> <span>언팔로우</span>
											</button>
										</c:otherwise>
									</c:choose> <%-- <button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom unfollowBtn fbBtn fbhide"
										onclick="unfollow('${page_id}', '${target_id}')">언팔로우</button> --%>
									<button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom blockBtn fbBtn fbhide">차단</button>
									<button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom blockingBtn fbBtn fbhide">차단중</button>
									<%-- <button type="button"
										class="w3-button w3-theme-d1 w3-margin-bottom unblockBtn fbBtn fbhide"
										>차단 해제</button> --%>
								</span>
								<h4><a href="">${target_id}</a></h4>
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
<button onclick="getFollowerList('aaaa', ${member.ID})">테스트</button>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/followblock.js"></script>

