<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 스프링 프레임웍에서 제공해주는 form태그 사용을 위한 선언 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.board_list {width: 500px; margin: 0 auto;}
.msg{font-size: 10pt; color: red;}
</style>
<meta charset="UTF-8">
<title>회원가입</title>
	
	<script type="text/javascript">
	
	 // 취소 버튼 클릭시 첫화면으로 이동
    function goFirstForm() {
        location.href="http://localhost:8080/TeamPro/login";
    }
	</script>
</head>

<body>
	<table class="board_list">
<form:form action="insertOk" method="post" commandName="member">		
		<tbody>
			<tr>
				<th scope="row">이름</th>
				<td><form:input path="NAME" maxlength="50" />
					<form:errors path="NAME" cssClass="msg"/></td>
				<td></td>
			</tr>
			<tr>
				<th scope="row">아이디</th>
				<td><form:input path="ID" maxlength="50" />
					<form:errors path="ID" cssClass="msg"/></td>
				<td><input type="button" value="중복확인" id="checkSignup"></td>
			</tr>
			<tr>
				<th scope="row">비밀번호</th>
				<td>
					<form:input path="PWD" maxlength="20"/>
					<form:errors path="PWD" cssClass="msg"/>
				</td>
				<td></td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
					<td>
						<form:input path="PHONE" maxlength="20"/>
						<form:errors path="PHONE" cssClass="msg"/>
					</td>
				<td></td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
					<td>
						<form:input path="EMAIL" maxlength="50"/>
						<form:errors path="EMAIL" cssClass="msg"/>
					</td>
				<td></td>
			</tr>
			<tr>
				<th scope="row">생년월일</th>
					<td>
						<form:input path="BIRTH" maxlength="20"/>
						<form:errors path="BIRTH" cssClass="msg"/>
					</td>
				<td></td>
			</tr>
			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="button" value="취소" onclick="goFirstForm()">
			</tr>
		</tfoot>
		</form:form>
	</table>
</body>
</html>