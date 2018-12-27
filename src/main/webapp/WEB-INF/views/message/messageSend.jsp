<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#sendBtn").click(function(){
			var subject = $("#MESSAGE_SUBJECT").val();
			var content = $("#MESSAGE_CONTENT").val();
			var receiver = $("#MESSAGE_RECEIVER").val();
			
			if(subject == ""){
				alert("제목을 입력하세요.");
				document.messageSendOk.subject.focus();
				return;
			}
			if(content == ""){
				alert("내용을 입력하세요.");
				document.messageSendOk.content.focus();
				return;
			}
			if(receiver == ""){
				alert("받는 사람을 입력하세요.");
				document.messageSendOk.receiver.focus();
				return;
			}
			document.messageSendOk.submit();
		})
	})
</script>
<body>
<c:if test="${member.NAME!= null}">
	<div id="sendForm" title="메세지 전송">
	  <form method="post" name="messageSendOk">
	    <table>
		    <tr>
		   	 	<td>작성자</td>
		   	 	<td><input type="text" name="MESSAGE_SENDER" id="MESSAGE_SENDER" value="${member.ID}" readonly="readonly"></td>
		    </tr>
		    <tr>
		   	 	<td>받는 사람</td>
		   	 	<td><input type="text" name="MESSAGE_RECEIVER" id="MESSAGE_RECEIVER" ></td>
		    </tr>
		    <tr>
		   	 	<td>제목</td>
		   	 	<td><input type="text" name="MESSAGE_SUBJECT" id="MESSAGE_SUBJECT" ></td>
		    </tr>
	      	<tr>
	      		<td>내용</td>
	      		<td><textarea id = "messageArea" rows="15" cols="48" name="MESSAGE_CONTENT" id="MESSAGE_CONTENT"></textarea></td>
	      	</tr>
	      	<tr>
	      		<td><input type="submit" value="보내기" id="sendBtn"></td>
	      		<td><input type="button" value="창닫기" onclick="window.close()"></td>
	      	</tr>	      
	    </table>
	  </form>
	</div>
</c:if>
</body>
</html>