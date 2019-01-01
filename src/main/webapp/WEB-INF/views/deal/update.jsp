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
<h2>수정</h2>

<a href="${path }/board/write">글쓰기</a>
<form name="updateForm" method="POST" action="${path}/deal/update.do">
	<div>글번호</div>
	<div><input name="DEAL_NUM" value="${data.DEAL_NUM }" type="text" readonly="readonly"></div>
	<div>작성자</div>
	<div><input name="DEAL_ID" value="${data.DEAL_ID }" type="text" readonly="readonly"></div>
	<div>제목</div>
	<div><input name="DEAL_SUBJECT" value="${data.DEAL_SUBJECT }" type="text"></div>
	<div>내용</div>
	<div><textarea name="DEAL_CONTENT" rows="5" cols="50">${data.DEAL_CONTENT }</textarea></div>
	<div>조회수</div>
	<div><input name="DEAL_READCOUNT" value="${data.DEAL_READCOUNT }" type="text" readonly="readonly"></div>
	<div>작성일자</div>
	<div><fmt:formatDate value="${data.DEAL_DATETIME }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
	<div>
		<input type="submit" value="글수정">
		<input type="reset" value="리셋">
	</div>
	</form>
</body>
</html>