<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
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
</body>
</html>