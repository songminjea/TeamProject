<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#messageSend, .sendMessageList{
		  width: 150px;
		  max-width : 100%;
		  height: 40px;
		  border-radius: 5px;
		  background-color: #6494ff;
		  border: none;
		  padding: 2px;
		  color: white;
		  font-weight: 600;
		  	
}		
#messageSend:hover, .sendMessageList:hover{
	background-color: #3b74f7;
}
</style>
	<input type="hidden" name="searchType" value="${map.searchOption}"> 
	<input type="hidden" name="keyword" value="${map.keyword}">
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <div align="center" style="padding: 30px;">
				<h4 style="font-weight: 600; color: #1d2c52; margin-bottom: 30px;">받은 쪽지</h4>
				<table width="95%" cellpadding="0" cellspacing="0" border="0">
					<colgroup bgcolor="#4497fd">
						<col width="5%">
						<col width="15%">
						<col width="40%">
						<col width="30%">
						<col width="10%">
					</colgroup>
					<tr class="scrollLocation" align="center" style="font-weight: 600; color: white;" height="30px;">
						<td><input type="hidden" value="메세지넘버"></td>
						<td>보낸 사람</td>
						<td>제목</td>
						<td>받은 날짜</td>
						<td>삭제</td>
					</tr>
					<%-- 페이징 필요 --%>
					<c:forEach items="${map.mlist}" var="message">
						<c:choose>
							<c:when test="${empty message}">
								<img src="${pageContext.request.contextPath}/resources/img/logo_oops.png" style="width: 20%; margin-bottom: 30px;">
								<h4 style="color: #1d2c52; font-weight: 500;">받은 쪽지가 없습니다!</h4>
							</c:when>
							<c:otherwise>	
								<tr id="message_list" bgcolor="white" align="center" height="40px" style="font-weight: 600; font-size: 16px; color: #1d2c52;">
									<td><input type="hidden" value="${message.MESSAGE_NO}" id="MESSAGE_NO" name="MESSAGE_NO"></td>
									<td>${message.MESSAGE_SENDER}</td>
									<td>
										<c:if test="${message.MESSAGE_READVAL == false}">
											<span style="color: #2f29fc; font-size: 12px; font-weight: 600;">New</span>
										</c:if>
											<a href="#" id="messageView" onclick="window.open('${pageContext.request.contextPath}/${member.ID}/messageView?MESSAGE_NO=${message.MESSAGE_NO}', 'messageView', 'width=500, height=650, top=100px, left=100px')">${message.MESSAGE_SUBJECT}</a>
									</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${message.MESSAGE_SENDTIME}"/></td>
									<td style="color: #78787c;">
										<a href="${pageContext.request.contextPath}/${member.ID}/messageDelete?MESSAGE_NO=${message.MESSAGE_NO}" onclick="return confirm('정말로 쪽지를 삭제하시겠습니까?')"><i class="fa fa-times" aria-hidden="true"></i></a>
									</td>
								</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</table>
			<br/>
				<%-- 검색 --%>
				<form name="searchForm" onsubmit="search();">
					<select name="searchOption" size="1" id="searchOption">
						<option value="all" <c:out value="${map.searchOption == 'all' ? 'selected' : ''}"/>>선택</option>
						<option value="MESSAGE_SENDER" <c:out value="${map.searchOption eq 'MESSAGE_SENDER' ? 'selected' : ''}"/>>아이디</option>
						<option value="MESSAGE_SUBJECT"<c:out value="${map.searchOption eq 'MESSAGE_SUBJECT' ? 'selected' : ''}"/>>제목</option>
						<option value="MESSAGE_CONTENT"<c:out value="${map.searchOption eq 'MESSAGE_CONTENT' ? 'selected' : ''}"/>>내용</option>
					</select>
					<input type="text" id="messageSearchkeyword" name="keyword" value="${map.keyword}" style="margin-top: 10px; border: 2px solid #6297ff; border-radius: 4px;"> 
						<a href="" onclick="return false;" id="messageSearchBtn">
 				   			<i style="color: #6297ff;" class="fa fa-search fa-fw w3-margin-right w3-text-theme"></i>
 				  		</a>
				</form>
				<div class="btn_Message" align="center" style="margin-right: 20px;">
					<input id="messageSend" type="button" value="쪽지보내기" id="messageSend" onclick="window.open('${pageContext.request.contextPath}/${member.ID}/messageSend', 'messageSend', 'width=500, height=650')">
					<input class="sendMessageList" type="button" value="보낸 쪽지 확인" onclick="location.href='${pageContext.request.contextPath}/${member.ID}/messageSendList'">
				</div>
				</div>
            </div>
          </div>
        </div>
      </div>