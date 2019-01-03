<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> 
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<script type="text/javascript">
	//회원수정 버튼 클릭시 첫화면으로 이동
	function goMypage() {
	    location.href="${pageContext.request.contextPath}/${member.ID}/mypage"; 
	}
</script>
<body id="header" data-spy="affix" data-offset-top="60" data-offset-bottom="200">
<div class="top-bar" style="height: 70px;">
	<div class="container-fluid">
			<div class="row">
				<%-- 각 페이지 연결할 아이콘 --%>
				<%-- 로그인 되어있을 경우 아이콘이 보이도록 한다. --%>
				<c:if test="${member.ID != null}">
					<div class="col-md-4" id="bar_left" align="left">
						<div id="bar_icon">
							<a
								class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2"
								href="javascript:void(0);"><i class="fa fa-bars"></i></a> <a
								href="deal/list"
								class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
								title="Board"><i class="fa fa-list" id="board_i"
								aria-hidden="true"></i></a> <a href="${pageContext.request.contextPath}/${member.ID}/messageList"
								class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
								title="Send Message"><i class="fa fa-envelope"
								id="message_i"></i></a> <a href="#"
								class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
								onclick="window.open('${pageContext.request.contextPath}/${member.ID}/multiChat', 'multiChat', 'width=370, height=450')"
								title="Chat"><i class="fa fa-weixin" id="chat_i"
								aria-hidden="true"></i></a>
							<%-- 새 글 알림 --%>
							<div class="w3-dropdown-hover w3-hide-small">
								<button class="w3-button w3-padding-large" title="Notifications">
									<i class="fa fa-bell" id="alarm_i"></i> <span
										class="w3-badge w3-right w3-small"
										style="background-color: #cbcbcd;">3</span>
								</button>
								<%-- 새 글 알림 드롭다운 --%>
								<div class="w3-dropdown-content w3-card-4 w3-bar-block"
									style="width: 150px;">
									<a href="#" class="w3-bar-item w3-button">게시물</a> 
									<a href="${pageContext.request.contextPath}/${member.ID}/messageList" class="w3-bar-item w3-button">쪽지</a> 
									<a href="chat" class="w3-bar-item w3-button">채팅</a>
								</div>
							</div>
							<%-- 새 글 알림 끝 --%>
						</div>
					</div>
				</c:if>
				<%-- 각 페이지 연결할 아이콘 끝--%>
				<c:choose>
					<%-- 로그인 되어있을 경우 로고를 누르면 메인 화면으로 이동 --%>
					<c:when test="${member.ID != null}">
						<div class="col-md-4 col-xs-6">
							<div class="babylogo">				
								<a href="${pageContext.request.contextPath}/main"> 
									<img src="${pageContext.request.contextPath}/resources/img/logo2.png" height="50px">
								</a>
							</div>
						</div>
					</c:when>
					<%-- 로그인 되어있지 않을 경우 로고를 누르면 로그인 화면으로 이동 --%>
					<c:otherwise>
						<div class="col-md-12 col-xs-6">
							<div class="babylogo">
								<a href="login"> 
									<img src="${pageContext.request.contextPath}/resources/img/logo2.png" height="50px">
								</a>
							</div>
						</div>	
					</c:otherwise>
				</c:choose>	
			<%-- 로그인 확인, 로그아웃 및 회원 정보 관리 --%>
			<%-- 로그인이 되어 있을 경우 회원 정보 아이콘이 뜬다. --%>
			<c:if test="${member.ID != null}">
			<div class="col-md-4" align="right">
				<div class="w3-dropdown-hover">
		<%-- 		<c:if test="${!empty member.ID}"> --%>
					<button class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" style="text-decoration: none; font-weight: 500; font-size: 18px;">${member.ID}(${member.NAME})
					&nbsp;
						<i class="fa fa-user-circle" aria-hidden="true" id="user_i"></i>
					</button>
					<div class="w3-dropdown-content w3-card-4 w3-bar-block" id="dropdown_menu">
					     <a href="#" class="w3-bar-item w3-button" onclick="goMypage()">회원정보 수정</a>
					     <a href="${pageContext.request.contextPath}/${member.ID}/gallery" class="w3-bar-item w3-button">내 게시물 확인</a>
					     <a href="${pageContext.request.contextPath}/${member.ID}/follower" class="w3-bar-item w3-button">팔로우</a>
					     <a href="${pageContext.request.contextPath}/logout" onclick="return confirm('로그아웃하시겠습니까?')" class="w3-bar-item w3-button">Logout</a>
					</div>		
	<%-- 				</c:if> --%>
	<%-- 				<c:if test="${empty member.ID}"> --%>
	<%-- 					<a href="${pageContext.request.contextPath}/login">로그인</a> --%>
	<%-- 				</c:if> --%>
				</div>
			</div>
			</c:if>
		</div>
	</div>
</div>
</body>   