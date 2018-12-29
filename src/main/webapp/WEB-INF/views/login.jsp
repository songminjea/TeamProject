<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>BabyParent | Login</title>
</head>
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
<body>
	<form action="loginPost" method="post">
		<table class="login_layer">
			<tr>
				<td>ID</td>
				<td><input type="text" id="ID" name="ID"/></td>
			</tr>
			<tr align="left">
				<td>Password</td>
				<td><input type="password" id="PWD" name="PWD"/></td>
			</tr>
			<tr class="checkbox">
				<td>
					<input type="checkbox" id="REMEMBERID" name="REMEMBERID"/>아이디 기억
				</td>
			</tr>
			<tr align="center">
				<td>
					<input type="submit" value="Login" id="Login"/>
					<!-- 회원가입 페이지 넘어가는 용 -->
					<input type="button" value="Register" onclick="location.href='check'"/>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
					<div id="naver_id_login" style="text-align:center">
						<a href="Naverlogin">
							<img width="223" src="${pageContext.request.contextPath}/resources/img/naver_Bn_Green.PNG"/>
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<!-- 구글 로그인 화면으로 이동 시키는 URL -->
					<div id="google_id_login" style="text-align:center">
						<a href="Googlelogin">
							<img width="230" src="${pageContext.request.contextPath}/resources/img/btn_google_signin_dark_normal_web@2x.png"/>
						</a>
					</div>
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>