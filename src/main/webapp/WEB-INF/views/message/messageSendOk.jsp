<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
.messageCloseBtn{
		  width: 250px;
		  max-width : 100%;
		  height: 50px;
		  border-radius: 5px;
		  background-color: #6494ff;
		  border: none;
		  padding: 2px;
		  color: white;
		  font-weight: 600;
		  	
}	
.gray{
	background-color: #cbcbcd;
}	
</style>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<div id="sendTitle" align="center" style="background-color: #4497fd; width: 100%; height: 50px;">
	<font color="white" id="send_text" style="font-weight: 600; font-size: 18px;">쪽지 보내기</font>
</div>
<div align="center">
	<div style="position: absolute; top: 0; bottom: 0; height: 30%; right:0; left: 0; margin: auto;">
		<table>
			<tr>
				<!-- 애 웃는 얼굴 넣을 거임 -->	
				<td><img src=""></td>
			</tr>
			<tr align="center">
				<td width="100%" style="padding: 20px;">
					<font style="font-weight: 600; font-size: 16px; color: #1d2c52;">쪽지를 성공적으로 보냈습니다.</font>
				</td>
			</tr>
		</table>
		<div>
		    <div align="center" style="position: absolute; bottom: 60px; margin-top: 20px; width:100%; left:0; right:0; margin-left:auto; margin-right:auto;">
				<input type="button" value="창닫기" class="messageCloseBtn gray" onclick="window.close()">
			</div>
		</div>
	</div>
</div>
<!-- js 파일 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</body>
</html>