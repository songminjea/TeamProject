<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>BabyParent</title>
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
<script type="text/javascript">
	function messageViewOpen() {
		window.open("messageView", "messageView", "width=500, height=600");
	}
	function messageSendOpen() {
		window.open("messageSend", "messageSend", "width=500, height=600");
	}
</script>
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
		<h3>쪽지 리스트</h3>
		<table width="600" cellpadding="0" cellspacing="0" border="0">
			<colgroup bgcolor="#ddffaa">
				<col width="20%">
				<col width="40%">
				<col width="30%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr align="center">
					<td>발신자</td>
					<td>제목</td>
					<td>받은 날짜</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="messageList" items="${list}">
		 			<c:if test="${member.ID eq list.MESSAGE_RECEIVER}"> 
						<tr bgcolor="white">
							<td>${messageList.MESSAGE_SENDER}</td>
							<td>
								<a href="message/messageView?MESSAGE_NO=${list.MESSAGE_NO}" id ="messageView" onclick="messageViewOpen()">${list.MESSAGE_SUBJECT}</a>
							</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.MESSAGE_SENDTIME}"/></td>
							<td>
								<a href="messageDelete">X</a>
							</td>
						</tr>
					</c:if> 
				</c:forEach>
			</tbody>
		</table>
		<button type="button" class="btn" id="messageSend" onclick="messageSendOpen()">쪽지 보내기</button>
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