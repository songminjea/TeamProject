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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resourses/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resourses/js/chatSearch.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resourses/js/sockjs.js"></script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<input type="hidden" name="keyword" value="${chatSearchVO.keyword}">
	<div id="positionLayer">
		<div align="center" style="border: solid 1px #4497fd; background-color:#4497fd; height: 50px; width: 100%;">
			<font style="font-size: 18px; font-weight:bold; line-height: 50px;" color="#FFFFFF">채팅 목록</font>
		</div>
		<span id="chatListArea">
			<a href="${pageContext.request.contextPath}/${member.ID}/multiChatList">채팅 중인 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/${member.ID}/chatSearch">아이디 검색</a>
		</span>
		<hr>
		<div>
			<form name="search" method="post">
				<div align="center" id="searchList" style=" display: table; margin-left: auto; margin-right: auto; 
					 margin-bottom: 20px; width: 90%;">
					<input type="text" id="chatSearchKeyword" name="keyword" value="${chatSearchVO.keyword}"
				   placeholder="검색할 아이디를 입력" style="margin-top: 10px; width: 80%; border: 2px solid #6297ff; border-radius: 4px;"> 
				   <a href="" onclick="check();" id="chatSearchBtn">
				   		<i class="fa fa-search fa-fw w3-margin-right w3-text-theme"></i>
				   </a>
				</div>
			</form>
			<table border="0" width="80%" cellpadding="0" cellspacing="0">
				<tr>
					<th></th>
					<th colspan="3">아이디</th>
					<th>1:1 채팅하기</th>
				</tr>
			<c:forEach var="chatList" items="${clist}">
				<tr id="chatSearch_List">
				
				</tr>
			</c:forEach>
				</table>
		</div>
	</div>
</body>
<script id="chatSearch-template" type="text/x-handlebars-template">
{{#chatSearch}}
					<td class="w3-circle">${chatList.PIC}</td>
					<td>${chatList.ID}(${chatList.NAME})</td>
					<td><button type="button" value="채팅"></button></td>

						<%-- 만약 회원 프로필 이미지가 없을 경우에는 기본 이미지를 띄운다. --%>
						<img src="${pageContext.request.contextPath}/{{sMem_pic}}" class="w3-circle">
					</div>
					<hr>
					<%-- 회원 정보 --%>
					<div class="member_icon" style="font-weight: 500; font-size: 15px;">
						<span class="w3-right smallSizeFont">
							<button type="button"
								class="w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn {{#SetBtnState isfollowed 'follow'}}{{/SetBtnState}} fbtn_{{sMem_id}}"
								value='{{sMem_id}}'>팔로우</button>
							<button type="button"
								class="w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn {{#SetBtnState isfollowed 'following'}}{{/SetBtnState}} fbtn_{{sMem_id}}"
								value='{{sMem_id}}'>
								<span>팔로잉</span> <span>언팔로우</span>
							</button>
						</span>
						<p style="padding-top: 5px; margin-bottom: 7px;">
							<a href="${pageContext.request.contextPath}/{{sMem_id}}/gallery"> {{sMem_id}} </a>
						</p>
						<br>
						
						<p>
							<i class="fa fa-envelope fa-fw w3-margin-right w3-text-theme"></i>
							{{sMem_email}}
						</p>
					</div>
				</div>
			</div>
{{/search}}
</script>
<script type="text/javascript">
function check() {
    if (document.search.keyword.value == "") {
        alert("검색어를 입력하세요.");
        document.search.keyword.focus();
        return;
    }
    document.search.submit();
}
$(document).ready(function(){
	$("#chatSearchBtn").on("click", function(event) {
		var keyword=$("#chatSearchKeyword").val();
		location.href="${pageContext.request.contextPath}/${member.ID}/chatSearch?keyword="+keyword;
	});
});
</script>
</html>