<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/follow.css">

<!-- JS 파일 -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/chat.js"></script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<%-- 로그인된 아이디 --%>
<input type="hidden" id="mem_id" value="${member.ID}">
<%-- 팔로워 페이지인지 팔로잉 페이지인지 --%>
<input type="hidden" id="page_type" value="${type}">
<%-- 현재 봐야하는 페이지의 아이디 --%>
<input type="hidden" id="page_id" value="${page_id}">
	<div id="positionLayer">
		<div align="left" style="border: solid 1px #4497fd; background-color:#4497fd; height: 55px; width: 100%;">
			<span id="chatListArea" style="font-size: 25px; margin-left: 30px; padding: 0; line-height: 55px; padding-top: 10px;">
				<a href="${pageContext.request.contextPath}/${member.ID}/chatList">
					<i class="fa fa-comments" aria-hidden="true" style="color:white;"></i>
				</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/${member.ID}/chatFollower">
					<i class="fa fa-user" aria-hidden="true" style="color:white;"></i>
				</a>
				<%-- 아이디 검색바 추가 --%>
			</span>
		</div>
		<span id="s_listArea"> <%-- 팔로워 팔로잉 목록 버튼. css 변경--%>
			<button type="button" class="w3-button w3-theme-d1 w3-hover-white"
					id="chatfollower_Btn">
				<i class="fa fa-thumbs-up" style="color: #4497fd;"></i>
				<span style="font-weight: bold; color:#1d2c52;">&nbsp;팔로워</span>
			</button>
			<button type="button" class="w3-button w3-theme-d1 w3-hover-white"
					id="chatfollowing_Btn">
				<i class="fa fa-thumbs-up" style="color: #597eff;"></i>
				<span style="font-weight: bold; color:#1d2c52;">&nbsp;팔로잉</span>
			</button>
		</span>
		<hr class="w3-clear" style="margin: 5px 0 10px;">			
		<input type="hidden" id="CHATROOM_SENDER" name="CHATROOM_SENDER" value="${member.ID}">
		<span id="chatFollow_list"> <%-- 팔로우 정보 리스트 영역. 무한 스크롤링 필요 --%>				
		</span>
	</div>
<script id="chatFollow-template" type="text/x-handlebars-template">
{{#chat}}	
	<div id="list_{{target_id}}" style="padding: 10px 30px;">
		<img src=${pageContext.request.contextPath}/{{#GetImgSrc memVO/pic}}{{/GetImgSrc}} alt="프로필 사진" class="w3-left w3-circle w3-margin-right" style="width: 50px; padding-bottom: 20px;">
		<span id="span_fBtn" class="w3-right">
			<button onclick="location.href='${pageContext.request.contextPath}/{{my_id}}/multiChat?CHATROOM_SENDER={{my_id}}&CHATROOM_RECEIVER={{target_id}}'" 
					type="button" class="w3-button w3-theme-d1 w3-margin-bottom chatfollowingBtn fbBtn {{#SetBtnState isfollowed 'chatFollowing'}}{{/SetBtnState}} followbtn_{{target_id}}"
					value='{{target_id}}' style="color: #4569c2; border: solid 1px #4569c2;">
				<span>채팅</span>
			</button>
		</span>				
			<div align="left"><h5 style="font-weight: 600; color:#1d2c52;">{{target_id}}<input type="hidden" id="CHATROOM_RECEIVER" name="CHATROOM_RECEIVER" value='{{target_id}}'></h5></div>
		<br>	
		<hr class="w3-clear" style="margin: 5px 0 10px;">
	</div>	
{{/chat}}
</script>
</html>