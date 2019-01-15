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
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/follow.css">
<!-- JS 파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resourses/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resourses/js/sockjs.js"></script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
	<div id="positionLayer">
		<div align="left" style="border: solid 1px #4497fd; background-color:#4497fd; height: 55px; width: 100%;">
			<span id="chatListArea" style="font-size: 25px; margin-left: 30px; padding: 0; line-height: 55px; padding-top: 10px;">
				<a href="${pageContext.request.contextPath}/${member.ID}/multiChatList">
					<i class="fa fa-comments" aria-hidden="true" style="color:white;"></i>
				</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/${member.ID}/chatFollower">
					<i class="fa fa-user" aria-hidden="true" style="color:white;"></i>
				</a>
			</span>
		</div>
	</div>
</body>
</html>