<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 로그인 유효성 체크 --%>
<script type="text/javascript">
	if("${msg}" != ""){
		window.alert("${msg}");
		window.location.href="login";
	}
</script>
<title>BabyParent | Login</title>
<!-- CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> 
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
</head>
<body class="main_login">
<!-- Header -->
	<jsp:include page="layout/header.jsp"/>
<!-- END Header -->
	<div class="w3-col m3" id="loginArea" style="max-width: 400px;" align="center">
      <!-- Profile -->
      	<div class="w3-card w3-round w3-white padding_area">
        	<div class="w3-container">
         		<h4 class="w3-center">Login</h4>
				<form action="loginPost" method="post">
					<table class="login_layer">
					<tbody id="login_area">
						<tr>
							<td><input type="text" id="ID" name="ID" placeholder="ID" class="input_login"/></td>
						</tr>
						<tr>
							<td><input type="password" id="PWD" name="PWD" placeholder="Password" class="input_login"/></td>
						</tr>
						<tr class="checkbox">
							<td>
								<input type="checkbox" id="REMEMBERID" name="REMEMBERID" style="margin-top: 10px;"/>아이디 기억
							</td>
						</tr>
						<tr align="center">
							<td>
								<input type="submit" value="Login" id="LoginBtn" style="margin-bottom: 5px; margin-top: 10px;"/><br/>
								<!-- 회원가입 페이지 넘어가는 용 -->
								<input type="button" value="Register" id="RegisterBtn" onclick="location.href='check'" style="margin-bottom: 3px;"/>
							</td>
						</tr>
						<tr>
							<td>
<!-- 								네이버 로그인 화면으로 이동 시키는 URL -->
								<div id="naver_id_login" style="text-align:center">
									<a href="Naverlogin">
										<img width="223" src="${pageContext.request.contextPath}/resources/img/naver_Bn_Green.PNG"/>
									</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
<!-- 								구글 로그인 화면으로 이동 시키는 URL -->
								<div id="google_id_login" style="text-align:center">
									<a href="Googlelogin">
										<img width="230" src="${pageContext.request.contextPath}/resources/img/btn_google_signin_dark_normal_web@2x.png"/>
									</a>
								</div>
							</td>
						</tr>
						</tbody>
					</table>	
				</form>
      		</div>
		</div>
   	</div>
		
<%-- js파일 --%>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
</body>
</html>