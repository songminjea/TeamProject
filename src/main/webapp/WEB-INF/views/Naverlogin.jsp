<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
					<h3>네이버 로그인 확인</h3>
					<div id="naver_id_login" style="text-align:center">
						<a href="${url}">
							네이버 로그인 하겠습니다.
						</a>
					</div>
					<div id="naver_id_login" style="text-align:center">
						<a href="${pageContext.request.contextPath}/${member.ID}/login">
							네이버 로그인 취소하겠습니다.
						</a>
					</div>
</body>
</html> 