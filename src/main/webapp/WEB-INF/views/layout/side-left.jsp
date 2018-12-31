<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>    
    <div class="w3-col m3" style="max-width: 320px;">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white" style="padding: 20px;">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <br/>
         <div class="w3-center image_wrapper">
         	<%-- 만약 회원 프로필 이미지가 없을 경우에는 기본 이미지를 띄운다. --%>
         	<c:choose>
				<c:when test="${empty profile.PIC}">
					<img src="${pageContext.request.contextPath}/resources/img/baby.jpg" alt="defaultImage">					
				</c:when>
				<c:otherwise>
					<img src="${profile.PIC}">
				</c:otherwise>
			</c:choose>
         </div>
         <hr>
        <%-- 회원 정보 --%>
        <div class="member_icon" style="font-weight: 500; font-size: 15px;">
	         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${profile.NAME}</p>
	         <p><i class="fa fa-envelope fa-fw w3-margin-right w3-text-theme"></i> ${profile.EMAIL}</p>
	         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> ${profile.BIRTH}</p>
	         <p align="center"><input type="button" class="uploadBtn"onclick="location.href='${pageContext.request.contextPath}/imgupload'" value="게시물 올리기"></p>
        </div>
        </div>
      </div>
      <br>
      <!-- Accordion -->
      <div class="w3-card w3-round w3-white" style="padding: 10px; border-radius: 4px;">
        <div class="w3-white">
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
<%--           <a href="${pageContext.request.contextPath}/imgupload" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</a> --%>
<!--           <div id="Demo3" class="w3-hide w3-container"> -->
<!--          <div class="w3-row-padding"> -->
<!--          <br> -->
<!--            <div class="w3-half"> -->
<!--              <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom"> -->
<!--            </div> -->
<!--            <div class="w3-half"> -->
<!--              <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom"> -->
<!--            </div> -->
<!--            <div class="w3-half"> -->
<!--              <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom"> -->
<!--            </div> -->
<!--            <div class="w3-half"> -->
<!--              <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom"> -->
<!--            </div> -->
<!--            <div class="w3-half"> -->
<!--              <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom"> -->
<!--            </div> -->
<!--            <div class="w3-half"> -->
<!--              <img src="/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom"> -->
<!--            </div> -->
<!--          </div> -->
<!--           </div> -->
        </div>      
      </div>
      <br>     
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small" style="padding: 10px;">
        <div class="w3-container">
        	<p>내가 생각하는 팔로우 추천해주는 곳 위치</p>
        </div>
      </div>
      <br>
    </div>
</body>
</html>
