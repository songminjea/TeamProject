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
		$("#sendBtn").click(function formCheck() {
			var subject = $("#subject").val();
			var content = $("#content").val();
			var receiver = $("#receiver").val();
			
			if(subject == ""){
				alert("제목을 입력하세요.");
				document.messageSend.subject.focus();
				return;
			}
			if(content == ""){
				alert("내용을 입력하세요.");
				document.messageSend.content.focus();
				return;
			}
			if(receiver == ""){
				alert("받는 사람을 입력하세요.");
				document.messageSend.receiver.focus();
				return;
			}
			document.messageSend.submit();
		})
	})
</script>
<body>
<c:if test="${member.NAME!= null}">
	<div id="sendForm" title="메세지 전송">
	  <form method="post" onsubmit="return formCheck();" name="messageSend">
	    <table>
		    <tr>
		   	 	<td>작성자</td>
		   	 	<td><input type="text" name="sender" id="sender" value="${member.ID}" readonly="readonly"></td>
		    </tr>
		    <tr>
		   	 	<td>받는 사람</td>
		   	 	<td><input type="text" name="receiver" id="receiver" ></td>
		    </tr>
		    <tr>
		   	 	<td>제목</td>
		   	 	<td><input type="text" name="subject" id="subject" ></td>
		    </tr>
	      	<tr>
	      		<td>내용</td>
	      		<td><textarea id = "messageArea" rows="15" cols="48" name="content" id="content"></textarea></td>
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