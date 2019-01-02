<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Baby Parent</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
<h2>상세페이지</h2>
<table border="1">
<tr>
<td>최종등록일</td>
<td><fmt:formatDate value="${ data.DEAL_DATETIME}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td>글번호</td>
	<td>${data.DEAL_NUM }</td>
</tr>
<tr>
	<td>글제목</td>
	<td>${data.DEAL_SUBJECT }</td>
</tr>
<tr>
	<td>글내용</td>
	<td>${data.DEAL_CONTENT }</td>
</tr>
<tr><td>글쓴이</td><td>${data.DEAL_ID }</td></tr>
<tr><td>조회수</td><td>${data.DEAL_READCOUNT }</td></tr>

</table>
<a href="${path }/deal/updatepage?DEAL_NUM=${data.DEAL_NUM}">수정</a>
<a href="${path }/deal/delete.do?DEAL_NUM=${data.DEAL_NUM}">삭제</a>
<input type="button" value="목록" onclick="location.href='${path}/deal/list.do'">

<input type="button" value="글쓰기" onclick="location.href='${path}/deal/write'">
</body>
</html>