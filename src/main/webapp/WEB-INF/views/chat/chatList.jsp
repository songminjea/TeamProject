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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
	<!-- 상단 메뉴 -->
	<div id="positionLayer">
		<div align="left" style="border: solid 1px #4497fd; background-color:#4497fd; height: 55px; width: 100%; margin-bottom: 10px;">
			<span id="chatListArea" style="font-size: 25px; margin-left: 30px; padding: 0; line-height: 55px; padding-top: 10px;">
				<a href="${pageContext.request.contextPath}/${member.ID}/chatList">
					<i class="fa fa-comments" aria-hidden="true" style="color:white;"></i>
				</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/${member.ID}/chatFollower">
					<i class="fa fa-user" aria-hidden="true" style="color:white;"></i>
				</a>
			</span>
		</div>
		<div>
			<c:forEach items="${clist}" var="chat">
				<c:choose>
					<c:when test="${empty chat}">
						<img src="${pageContext.request.contextPath}/resourses/img/logo_oops.png">
						채팅 내역이 없습니다!
					</c:when>
					<c:otherwise>
						<div id="chatLists" style="padding: 10px 30px;">
							<input type="hidden" value="${chat.CHATROOM_NO}" id="CHATROOM_NO" name="CHATROOM_NO">
							<img src="${pageContext.request.contextPath}/resources/img/logo_noFlower.png" class="w3-left w3-circle w3-margin-right" style="width: 50px; padding-bottom: 20px;">
							<span class="w3-right">
								<button onclick="location.href='${pageContext.request.contextPath}/${member.ID}/multiAreadyChat?CHATROOM_NO=${chat.CHATROOM_NO}'" type="button" class="w3-button w3-theme-d1 w3-margin-bottom fbBtn" style="color: #4569c2; border: solid 1px #4569c2;">
									<span>채팅</span>
								</button>
							</span>
							<c:choose>			
								<c:when test="${chat.CHATROOM_SENDER eq member.ID}">
									<div align="left"><h5 style="font-weight: 600; color:#1d2c52;">${chat.CHATROOM_RECEIVER}</h5></div>
								</c:when>
								<c:otherwise>
									<div align="left"><h5 style="font-weight: 600; color:#1d2c52;">${chat.CHATROOM_SENDER}</h5></div>
								</c:otherwise>
							</c:choose>	
							<br>	
							<hr class="w3-clear" style="margin: 5px 0 10px;">
						</div>	
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</body>
</html>