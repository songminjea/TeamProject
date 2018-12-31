<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/follow.css">

<input type="hidden" id="page_type" value="${type}">
<input type="hidden" id="mem_id" value="${member.ID}">
<input type="hidden" id="page_id" value="${page_id}">



<div class="w3-row-padding">
	<div class="w3-col m12">
		<div class="w3-card w3-round w3-white">
			<div id="div_flist" class="w3-container w3-padding">
				<span id="s_listArea"> <%-- 팔로워 팔로잉 목록 버튼 --%>
					<button type="button" class="w3-button w3-theme-d1"
						<%-- onclick="getFollowerList('${member.ID}' , '${page_id}')" --%>
						id="getfollower_Btn">
						<i class="fa fa-thumbs-up"></i> 팔로워
					</button>

					<button type="button" class="w3-button w3-theme-d1"
						<%-- onclick="getFollowingList('${member.ID}' , '${page_id}')" --%>
						id="getfollowing_Btn">
						<i class="fa fa-thumbs-up"></i> 팔로잉
					</button>
				</span>
				<hr class="w3-clear" style="margin: 5px 0 20px;">

				<span id="follow_list"> <%-- 팔로우 정보 리스트 영역 --%>
					
				</span>

			</div>
		</div>
	</div>
</div>
<script id="follow-template" type="text/x-handlebars-template">
{{#follow}}	


	<div id="list_{{#getType ../type follower_id following_id}}{{/getType}}">
		<img src='/TeamPro/resources/img/baby.jpg' alt="프로필 사진" class="w3-left w3-circle w3-margin-right" style="width: 60px">
		<span id="span_fBtn" class="w3-right">
			<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn fbhide"
				onclick="follow('{{../my_id}}','{{#getType ../type follower_id following_id}}{{/getType}}')">팔로우</button>
			<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn fbhide"
				onclick="unfollow('{{../my_id}}','{{#getType ../type follower_id following_id}}{{/getType}}')">
				<span>팔로잉</span> <span>언팔로우</span>
			</button>
		</span>
						
		<h4>
			<a href="${pageContext.request.contextPath}/{{#getType ../type follower_id following_id}}{{/getType}}/gallery">
				{{#getType ../type follower_id following_id}}{{/getType}}
			</a>
		</h4>
		<br>	
		<hr class="w3-clear">
	</div>
{{/follow}}

</script>




<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sideleft.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/followblock.js"></script>


