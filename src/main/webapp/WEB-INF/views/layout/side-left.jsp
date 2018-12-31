<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//회원수정 버튼 클릭시 첫화면으로 이동
	function goMypage() {
	    location.href="${pageContext.request.contextPath}/mypage/${member.ID}"; 
	}
</script>
</head>
<body>    
<!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">Profile</h4>
         <div class="w3-center image_wrapper">
         	<!-- 만약 회원 프로필 이미지가 없을 경우에는 기본 이미지를 띄운다. -->
         	<c:choose>
				<c:when test="${empty profile.PIC}">
					<img src="${pageContext.request.contextPath}/resources/img/baby.jpg" alt="defaultImage">					
				</c:when>
				<c:otherwise>
					<img src="${member.PIC}">
				</c:otherwise>
			</c:choose>
         </div>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${profile.NAME}</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> ${profile.EMAIL}</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> ${profile.BIRTH}</p>
         <%-- 현재 프로필 아이디가 로그인되어있는 아이디랑 같을때만 회원정보수정 버튼 표시 --%>
         <c:if test="${member.ID eq profile.ID}"> 
         	<p><input type="button" value="회원수정" onclick="goMypage()"></p>
         </c:if>
        </div>
      </div>
      <br>

      <!-- Accordion -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-white">
          <a href="${pageContext.request.contextPath}/${profile.ID}/follower" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>팔로우 목록</a>
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <a href="${pageContext.request.contextPath}/imgupload" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</a>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>      
      </div>
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
        	<p>fgdfgfdgd</p>
        </div>
      </div>
      <br>
      
      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>
    
    <!-- End Left Column -->
    </div>
</body>
</html>
