<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/common.jsp" %>
</head>
<body style="margin: 5% 10% 0 10%">
<div id="main">	
	<article class="post">
		<section>
			<h3>Login</h3>
			<form method="post" action="loginPOST">
				<div class="row uniform">
					<div class="12u$">
						<input type="text" name="mem_id" id="mem_id" placeholder="ID" />
					</div>
					<div class="12u$">
						<input type="password" name="mem_pwd" id="mem_pwd" placeholder="PASSWORD" />
					</div>
					<c:if test="${isfail}">
						<div class="12u$">
							<p style="color: red">Please check ID or Password again.</p>
						</div>
						<% session.setAttribute("isfail", "false"); %>
					</c:if>
					<div class="6u 12u$(small)">
						<input type="checkbox" id="useCookie" name="useCookie">
						<label for="useCookie">RememberMe</label>
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input type="submit" value="LOGIN" /></li>
							<li><input type="reset" value="RESET" /></li>
							<li><a href="register" class="button" >JOIN</a></li>
							<li><a href="find">Did you forget?</a></li>
						</ul>
					</div>
				</div>
			</form>
		</section>
	</article>
</div>
</body>
</html>