<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- <c:forEach var="follower" items="${follower}"> --%>
	<div class="w3-row-padding">
		<div class="w3-col m12">
			<div class="w3-card w3-round w3-white">
				<div class="w3-container w3-padding">
					<h6 class="w3-opacity">${follower}</h6>
					<p contenteditable="true" class="w3-border w3-padding">Status:
						Feeling Blue</p>
					<button type="button" class="w3-button w3-theme">
						<i class="fa fa-pencil"></i> Post
					</button>
				</div>
			</div>
		</div>
	</div>
<%-- </c:forEach> --%>
