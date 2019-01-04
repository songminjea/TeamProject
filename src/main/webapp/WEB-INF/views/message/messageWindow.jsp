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
<jsp:include page="${center}"/>
<!-- js 파일 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</body>
</html>