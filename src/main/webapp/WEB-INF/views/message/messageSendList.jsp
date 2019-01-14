<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	//원하는 페이지로 이동시 검색조건, 키워드 값 유지
// 	function list() {
// 		location.href="${pageContext.request.contextPath}/${member.ID}/messageSendList?&searchOption=${map.searchOption}"+
// 					  "&keyword=${map.keyword}";
// 	}
</script>
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <div align="center" style="padding: 30px;">
				<h4 style="font-weight: 600; color: #1d2c52; margin-bottom: 30px;">보낸 쪽지</h4>
				<table width="95%" cellpadding="0" cellspacing="0" border="0">
					<colgroup bgcolor="#4497fd">
						<col width="5%">
						<col width="15%">
						<col width="30%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr align="center" style="font-weight: 600; color: white;" height="30px;">
						<td><input type="hidden" value="메세지넘버"></td>
						<td>받는 사람</td>
						<td>제목</td>
						<td>보낸 날짜</td>
						<td>확인 여부</td>
					</tr>
					<c:forEach items="${map.mslist}" var="message">
						<c:choose>
							<c:when test="${empty message}">
								보낸 쪽지가 없습니다.
							</c:when>
							<c:otherwise>
<%-- 					 	<c:if test="${member.ID eq message.MESSAGE_SENDER}">    --%>
							<tr bgcolor="white" align="center" height="40px" style="font-weight: 600; font-size: 16px; color: #1d2c52;">
								<td><input type="hidden" value="${message.MESSAGE_NO}"></td>
								<td>${message.MESSAGE_RECEIVER}</td>
								<td>
									<a href="#" id="messageSendView" 
										onclick="window.open('${pageContext.request.contextPath}/${member.ID}/messageSendView?MESSAGE_NO=${message.MESSAGE_NO}', 'messageSendView', 'width=500, height=600')">${message.MESSAGE_SUBJECT}</a>
								</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${message.MESSAGE_SENDTIME}"/></td>
								<td>
								<c:choose>
									<c:when test="${message.MESSAGE_READVAL == false}">
										읽지 않음
									</c:when>
									<c:otherwise>
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${message.MESSAGE_READTIME}"/>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
<%--  		 				</c:if>   --%>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
				<br/>
				<%-- 검색 --%>
				<%-- 검색 --%>
				<form name="searchForm" onsubmit="search();">
					<select name="searchOption" size="1" id="searchOption">
						<option value="all" <c:out value="${map.searchOption == 'all' ? 'selected' : ''}"/> selected="selected">선택</option>
						<option value="MESSAGE_RECEIVER" <c:out value="${map.searchOption eq 'MESSAGE_RECEIVER' ? 'selected' : ''}"/>>아이디</option>
						<option value="MESSAGE_SUBJECT"<c:out value="${map.searchOption eq 'MESSAGE_SUBJECT' ? 'selected' : ''}"/>>제목</option>
						<option value="MESSAGE_CONTENT"<c:out value="${map.searchOption eq 'MESSAGE_CONTENT' ? 'selected' : ''}"/>>내용</option>
					</select>
					<input type="text" id="messageSearchkeyword" name="keyword" value="${map.keyword}" style="margin-top: 10px; border: 2px solid #6297ff; border-radius: 4px;"> 
						<a href="" onclick="return false;" id="messageSearchBtn">
 				   			<i style="color: #6297ff;" class="fa fa-search fa-fw w3-margin-right w3-text-theme"></i>
 				  		</a>
					<%-- 페이징 처리 --%>
<!-- 					<div> -->
<!-- 						<ul> -->
<%-- 							<c:if test="${map.messagePageMaker.curBlock ne 1}"> --%>
<!-- 								<a href="#" onclick="list(1)">[처음]</a> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${map.messagePageMaker.curPage ne 1}">   --%>
<!-- 								<li>             -->
<%-- 			                        <a href="#" onclick="list('${map.messagePageMaker.prevPage}')">      --%>
<!-- 			                       		<i class="fa fa-chevron-left" aria-hidden="true"></i>&nbsp;&nbsp; -->
<!-- 			                        </a> -->
<!-- 		                        </li> -->
<%-- 	               		 	</c:if> --%>
<!-- 	               		 	하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
<%-- 							<c:forEach end="${map.messagePageMaker.endPage}" begin="${map.messagePageMaker.startPage}" var="idx"> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${idx eq map.messagePageMaker.curPage}"> --%>
<%-- 										<a href="#" onclick="list('${idx}')">  --%>
<%-- 											<font style="font-weight: bold; color: #1d2c52;">[${idx}]</font> --%>
<!-- 										</a> -->
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										 <a href="#" onclick="list('${idx}')">  --%>
<%-- 						                    <font style="color: #1d2c52;">[${idx}] </font>  --%>
<!-- 						                 </a> -->
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<%-- 							</c:forEach> --%>
<%-- 							<c:if test="${map.messagePageMaker.curPage ne map.messagePageMaker.totPage && map.messagePageMaker.totPage > 0}">               --%>
<%-- 		                        <a href="#" onclick="list('${map.messagePageMaker.nextPage}')">      --%>
<!-- 		                        	&nbsp;&nbsp;<i class="fa fa-chevron-right" aria-hidden="true"></i>  -->
<!-- 		                        </a> -->
<%-- 	               		 	</c:if> --%>
<%-- 	               		 	<c:if test="${map.messagePageMaker.curBlock ne map.messagePageMaker.totBlock && map.messagePageMaker.totBlock > 0}"> --%>
<%-- 								<a href="#" onclick="list('${map.messagePageMaker.totPage}')">[끝]</a> --%>
<%-- 							</c:if> --%>
<!--                			</ul> -->
<!-- 					</div> -->
				</form>
					<div class="btn_Message">
						<input id="uploadBtn1" type="button" value="받은 쪽지 확인" onclick="location.href='${pageContext.request.contextPath}/${member.ID}/messageList'">
					</div>
				</div>
            </div>
          </div>
        </div>
      </div>