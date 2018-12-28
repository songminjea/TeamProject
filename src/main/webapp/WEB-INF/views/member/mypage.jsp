<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>	
	<!-- 유효성 체크에 관한 폰트 색을 담당 -->
	<style type="text/css">		
		.errMsg{font-size: 9pt; color: red}	
	</style>
</head>
<body>
	<div align="center">
		<h2>회원정보 수정페이지</h2>
		<hr width="500">
		
		<table border="1" cellpadding="2" cellspacing="0" width="500" >
			<form:form commandName="member"
					   method="post" 
					   action="${pageContext.request.contextPath}/mypageOk"> 
				<tr>
					<td>아이디</td>
					<td>
						<!-- id부분은 수정금지 읽기만 가능하게 readonly="true"로  -->
						<form:input path="ID" maxlength="20" readonly="true"/>
						<form:errors path="ID" cssClass="errMsg"/> <!-- 유효성 체크에 실패하면 error메시지 출력 구문 -->
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<form:password path="PWD" maxlength="20"/>
						<form:errors path="PWD" cssClass="errMsg"/>
					</td>				
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<form:input path="NAME" maxlength="13"/>
						<form:errors path="NAME" cssClass="errMsg"/>
					</td>				
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<form:input path="PHONE" maxlength="13"/>
						<form:errors path="PHONE" cssClass="errMsg"/>
					</td>				
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<form:input path="EMAIL" maxlength="50"/>
						<form:errors path="EMAIL" cssClass="errMsg"/>
					</td>				
				</tr>				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원정보수정"/> &nbsp;&nbsp;&nbsp;
						<input type="button" value="취소" onclick="history.back();">
					</td>
				</tr>
			</form:form>
		</table>
	</div>
	
</body>
</html>