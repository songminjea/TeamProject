<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BabyParent | Message</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="./resources/css/main2.css"/>
	<style>
	html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
	</style>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<!-- body -->
<body class="w3-theme-l5">
<div class="main">
<!-- Header -->
	<jsp:include page="../layout/header.jsp"/>
<!-- END Header -->
<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;padding-top:150px">    
  <!-- The Grid -->
  <div class="w3-row">
  	<!-- Left Column -->
    <jsp:include page="../layout/side-left.jsp"/>
    <!-- End Left Column -->
    <!-- Middle Column -->
    <div class="w3-col m7">
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <div align="center">
				<h3>내가 보낸 쪽지</h3>
				<table width="650" cellpadding="0" cellspacing="0" border="0">
					<colgroup bgcolor="#ddffaa">
						<col width="5%">
						<col width="15%">
						<col width="30%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<tr align="center">
						<td><input type="hidden" value="메세지넘버"></td>
						<td>받는 사람</td>
						<td>제목</td>
						<td>보낸 날짜</td>
						<td>확인 여부</td>
					</tr>
					<c:forEach items="${mslist}" var="message">
					 	<c:if test="${member.ID eq message.MESSAGE_SENDER}">  
							<tr bgcolor="white">
								<td><input type="hidden" value="${message.MESSAGE_NO}"></td>
								<td>${message.MESSAGE_RECEIVER}</td>
								<td>
									<a href="#" id="messageSendView" 
										onclick="window.open('messageSendView?MESSAGE_NO=${message.MESSAGE_NO}', 'messageSendView', 'width=500, height=600')">${message.MESSAGE_SUBJECT}</a>
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
		 				</c:if>  
					</c:forEach>
				</table>
					<input type="button" value="받은 쪽지 확인" onclick="location.href='messageList'">
				</div>
            </div>
          </div>
        </div>
      </div>
    <!-- End Middle Column -->
    </div>
     <!-- Right Column -->
    <jsp:include page="../layout/side-right.jsp"></jsp:include>      
    <!-- End Right Column -->
  <!-- End Grid -->
  </div>
  </div>
</div>
<!-- End Page Container -->
</body>
</html>