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
<h2>글쓰기 페이지</h2>
<form name="ddto" method="post" action="${path}/deal/insert.do" >
	<div>제목<input name="DEAL_SUBJECT" id="deal_subject" size="80" ></div>
	<div>내용<textarea name="DEAL_CONTENT" id="deal_content" rows="8" cols="80"></textarea> </div>
	<div>작성자<input name="DEAL_ID" id="deal_id" size="80" ></div>
		<div style="width:650px; text-align:center;">
            <input type="submit" value="확인">
        </div>
		



</form>

</body>
</html>