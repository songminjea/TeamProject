<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<div id="sendForm" title="메세지 확인">
<form method="post" name="messageView" id="messageView">
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
			<td><input type="button" value="창닫기" onclick="window.close()"></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>