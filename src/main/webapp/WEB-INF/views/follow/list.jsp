<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
${member.NAME}
<c:choose>
	<c:when test="${empty type}">

	</c:when>

	<c:otherwise>

		<div class="w3-row-padding">
			<div class="w3-col m12">
				<div class="w3-card w3-round w3-white">
					<div class="w3-container w3-padding">
						<span>
							<button type="button" class="w3-button w3-theme-d1" id="follower_Btn">
								<i class="fa fa-thumbs-up"></i> 팔로워
							</button>

							<button type="button" class="w3-button w3-theme-d1" id="following_Btn">
								<i class="fa fa-thumbs-up"></i> 팔로잉
							</button>
						</span>
						<hr class="w3-clear" style="margin: 5px 0 20px;">
						<c:forEach var="follow_list" items="${follow_list}">
							<c:choose>
								<c:when test="${type eq 'follower'}">
									<c:set var="f_id" value="${follow_list.follower_id}" />
								</c:when>
								<c:when test="${type eq 'following'}">
									<c:set var="f_id" value="${follow_list.following_id}" />
								</c:when>
							</c:choose>

							<img src="/TeamPro/resources/css/baby.jpg" alt="프로필 사진"
								class="w3-left w3-circle w3-margin-right" style="width: 60px">

							<span class="w3-right">
								<button type="button"
									class="w3-button w3-theme-d1 w3-margin-bottom">
									<i class="fa fa-thumbs-up"></i> 팔로우
								</button>
							</span>
							<h4>${f_id}</h4>
							<br>
							<hr class="w3-clear">
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</c:otherwise>


</c:choose>


