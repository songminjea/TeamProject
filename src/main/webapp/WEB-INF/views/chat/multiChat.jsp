<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="../resourses/js/jquery.min.js"></script>
<script type="text/javascript" src="../resourses/js/sockjs.js"></script>
</head>
<body>
	<div id="positionLayer" style="overflow-y: auto; width: 370px; height: 450px; position: fixed; right: 0; bottom: 0; z-index: 10000; border: 2px solid #000000; text-align: center;">
	<!-- 레이어팝업 -->
	<table align="center" bgcolor="#FFFFFF">
		<tr>
			<td bgcolor="#D75E00" align="center" height="30"><font style="font-size: 18px; font-weight:bold" color="#FFFFFF">자유채팅</font></td>
		</tr>
		<tr>
			<td>
				<div style="overflow: auto; height: 200px;" align="left">
				<ul id="discussion"></ul>
				</div>
 			<ul id="discussion"></ul>
			<br/>
			<br/>		
	<c:choose>
		<%-- 로그인 되어 있을 경우 --%>
		<c:when test="${member.ID != null}">
			<p align="left">&nbsp;${member.ID}(${member.NAME})님이 입장하셨습니다.</p>
			<input type="hidden" id="memID" width="110" value="${member.ID}" readonly="readonly">
			<input type="hidden" id="memName" width="110" value="${member.NAME}" readonly="readonly">
		</c:when>
		<%-- 로그인되어 있지 않을 경우 로그인 화면으로 이동 --%>
		<c:otherwise>
			<%
				response.sendRedirect("login");
			%>
		</c:otherwise>
	</c:choose>
		<input type="text" id="message" size="50" align="middle" placeholder="메세지를 입력하세요">
			<br/>
			<br/>
			<input type="button"style="font-size:18px; font-weight:bold; background-color: #D75E00; color:#ffffff; width: 100%;"  id="btnSend" value="전송"/>
			<ul id="discussion"></ul>
			</td>
		</tr>	
	</table>
	<br/>
<!-- 채팅 API -->
	<script src="http://demo.dongledongle.com/Scripts/jquery-1.10.2.min.js"></script>
	<script src="http://demo.dongledongle.com/Scripts/jquery.signalR-2.2.1.min.js"></script>

	<script type="text/javascript">
		var connection = $.hubConnection('http://demo.dongledongle.com/');
		var chat = connection.createHubProxy('chatHub');

		$(document).ready(
				function() {
					chat.on('addNewMessageToPage', function(memID,  message) {
						$('#discussion').append(
							'<li><strong>' + htmlEncode(memID) 
								+ '</strong>: ' + htmlEncode(message)+ '</li>');
					});
					$('#message').focus();
					connection.start({jsonp : true}).done(
						function() {
							$('#btnSend').click(function() {
								chat.invoke('send', $('#memID').val(),
													$('#message').val());
													$('#message').val('').focus();
							});
							});
				});

		function htmlEncode(value) {
			var encodedValue = $('<div />').text(value).html();
			return encodedValue;
		}
	</script>
<!-- 채팅 API -->	
		<!-- 닫기 버튼 html -->
		<div id="popup">
			<input type="button" value="창닫기" onclick="window.close()">
		</div>
		<!-- 닫기 버튼 html -->

	</div>
</body>
</html>