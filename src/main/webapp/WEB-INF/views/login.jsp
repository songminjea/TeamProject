<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BabyParent | Login</title>
</head>
<link rel="stylesheet" href="./resources/css/main2.css"/>
<body style="margin: 5% 10% 0 10%">
	<form action="loginPost" method="post">
		<table class="login_page">
			<caption>Login</caption>
			<tr>
				<td>ID</td>
				<td><input type="text" id="ID" name="ID"/></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" id="PWD" name="PWD"/></td>
			</tr>
			<tr class="checkbox">
				<td>
					<input type="checkbox" id="REMEMBERID" name="REMEMBERID"/>아이디 기억
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="Login" id="Login"/>
					<!-- 회원가입 페이지 넘어가는 용 -->
					<input type="button" value="Register" onclick="location.href='http://localhost:8080/TeamPro/check'"/>
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>