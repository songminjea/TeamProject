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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/followblock.js"></script>
<script src="/${pageContext.request.contextPath}/resourses/js/sockjs.js"></script>
<script src="/${pageContext.request.contextPath}/resourses/js/chat.js"></script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<%-- 팔로워 페이지인지 팔로잉 페이지인지 --%>
<input type="hidden" id="page_type" value="${type}">
<%-- 현재 봐야하는 페이지의 아이디 --%>
<input type="hidden" id="page_id" value="${page_id}">
<input type="hidden" name="keyword" value="${chatSearchVO.keyword}">
	<div id="positionLayer">
		<div align="center" style="border: solid 1px #4497fd; background-color:#4497fd; height: 50px; width: 100%;">
			<font style="font-size: 18px; font-weight:bold; line-height: 50px;" color="#FFFFFF">채팅 목록</font>
		</div>
		<span id="chatListArea">
			<a href="${pageContext.request.contextPath}/${member.ID}/multiChatList">채팅 중인 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath}/${member.ID}/chatSearch">아이디 검색</a>
		</span>
		<hr>
		<span id="s_listArea"> <%-- 팔로워 팔로잉 목록 버튼 --%>
			<button type="button" class="w3-button w3-theme-d1 w3-hover-white"
					id="getfollower_Btn">
				<i class="fa fa-thumbs-up" style="color: #4497fd;"></i>
				<span style="font-weight: bold; color:#1d2c52;">&nbsp;팔로워</span>
			</button>
			<button type="button" class="w3-button w3-theme-d1 w3-hover-white"
					id="getfollowing_Btn">
				<i class="fa fa-thumbs-up" style="color: #597eff;"></i>
				<span style="font-weight: bold; color:#1d2c52;">&nbsp;팔로잉</span>
			</button>
		</span>
		<hr class="w3-clear" style="margin: 5px 0 20px;">			
		<span id="follow_list"> <%-- 팔로우 정보 리스트 영역 --%>				
		</span>
	</div>
<script id="follow-template" type="text/x-handlebars-template">
{{#follow}}	
	<div id="list_{{target_id}}">
		<img src=${pageContext.request.contextPath}/{{#GetImgSrc memVO/pic}}{{/GetImgSrc}} alt="프로필 사진" class="w3-left w3-circle w3-margin-right" style="width: 60px">
		<span id="span_fBtn" class="w3-right">
			<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn {{#SetBtnState isfollowed 'follow'}}{{/SetBtnState}} fbtn_{{target_id}}"
				value='{{target_id}}'>팔로우
			</button>
			<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn {{#SetBtnState isfollowed 'following'}}{{/SetBtnState}} fbtn_{{target_id}}"
				value='{{target_id}}'>
				<span>팔로잉</span> <span>언팔로우</span>
			</button>
		</span>
						
		<h4>
			<a href="${pageContext.request.contextPath}/{{target_id}}/gallery">
				{{target_id}}
			</a>
		</h4>
		<br>	
		<hr class="w3-clear">
	</div>
{{/follow}}
</script>
<!-- 		<div> -->
<!-- 			<form name="search" method="post"> -->
<!-- 				<div align="center" id="searchList" style=" display: table; margin-left: auto; margin-right: auto;  -->
<!-- 					 margin-bottom: 20px; width: 90%;"> -->
<%-- 					<input type="text" id="chatSearchKeyword" name="keyword" value="${keyword}" --%>
<!-- 				   placeholder="검색할 아이디를 입력" style="margin-top: 10px; width: 80%; border: 2px solid #6297ff; border-radius: 4px;">  -->
<!-- 				   <a href="" onclick="check();" id="chatSearchBtn"> -->
<!-- 				   		<i class="fa fa-search fa-fw w3-margin-right w3-text-theme"></i> -->
<!-- 				   </a> -->
<!-- 				</div> -->
<!-- 			</form> -->
<!-- 			<table border="0" width="80%" cellpadding="0" cellspacing="0"> -->
<!-- 				<tr> -->
<!-- 					<th></th> -->
<!-- 					<th colspan="3">아이디</th> -->
<!-- 					<th>1:1 채팅하기</th> -->
<!-- 				</tr> -->
<%-- 			<c:forEach var="chatList" items="${clist}"> --%>
<!-- 				<tr id="chatSearch_List"> -->
				
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 				</table> -->
<!-- 		</div> -->
</body>
<script id="chatSearch-template" type="text/x-handlebars-template">
{{#chatSearch}}
	<td><img src="${pageContext.request.contextPath}/{{sMem_pic}}" class="w3-circle"></td>
	<td>{{sMem_id}} ({{sMem_name}})</td>
	<td><button type="button" value="채팅" onclick="location.href='${pageContext.request.contextPath}/{{sMem_id}}/multiChat'"></button></td>
{{/chatSearch}}
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
	$("#chatSearchBtn").on("click", function() {
		var keyword = $("#chatSearchKeyword").val();
		location.href="${pageContext.request.contextPath}/${member.ID}/chatSearch?keyword="+keyword;
	});
});
</script>
</html>