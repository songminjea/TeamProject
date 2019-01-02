<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/message.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> 
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
</head>
<script type="text/javascript">
	function messageCheck(){
		var subject = document.messageSendOk.MESSAGE_SUBJECT.value;
		var content = document.messageSendOk.MESSAGE_CONTENT.value;
		var receiver = document.messageSendOk.MESSAGE_RECEIVER.value;
		
		if(receiver == ""){
			alert("받는 사람을 입력하세요.");
			document.messageSendOk.MESSAGE_RECEIVER.focus();
			return false;
		}else{
			if(subject == ""){
				alert("제목을 입력하세요.");
				document.messageSendOk.MESSAGE_SUBJECT.focus();
				return false;
			}
			else {
				if(content == ""){
					alert("내용을 입력하세요.");
					document.messageSendOk.MESSAGE_CONTENT.focus();
					return false;
				}
			}			
		}
		
		document.messageSendOk.method = "POST";
		document.messageSendOk.submit();
	}
</script>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<div id="sendTitle" align="center" style="background-color: #4497fd; width: 100%; height: 50px;">
	<font color="white" id="send_text" style="font-weight: 600; font-size: 18px;">쪽지 보내기</font>
</div>
<c:if test="${member.ID!= null}">
	<div id="sendForm" title="메세지 확인">
		<form method="post" name="messageView" id="messageView" onsubmit="return messageCheck();">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr bgcolor="white">
					<td>보낸 사람</td>
					<td>${mdto.MESSAGE_SENDER}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${mdto.MESSAGE_SUBJECT}</td>
				</tr>
				<tr>
					<td>받은 날짜</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${mdto.MESSAGE_SENDTIME}"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${mdto.MESSAGE_CONTENT}</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="답장" id="sendBtn" onclick = "location.href='${pageContext.request.contextPath}/${member.ID}/messageSend?MESSAGE_RECEIVER=${message.MESSAGE_SENDER}'">
						<input type="button" value="창닫기" onclick="window.close()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</c:if>
<!-- js 파일 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</body>
</html>