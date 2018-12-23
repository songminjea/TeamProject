<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<title>BabyParent</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<link rel="stylesheet" href="./resources/css/main2.css"/>

<c:set var="center" value="${param.center}"/>
 
	<c:if test="${empty center}"> 
 		<c:set var="center" value="/list"/>
 	</c:if>

<body class="w3-theme-l5">
<div class="main">
<!-- Header -->
	<jsp:include page="layout/header.jsp"/>
<!-- END Header -->

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;padding-top:150px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <jsp:include page="layout/side-left.jsp"/>
    <!-- End Left Column -->

	<!-- Center -->
	<div class="w3-col m7">
		<jsp:include page="${center }"></jsp:include>
	</div>
	<!-- END Center -->
    
    <!-- Right Column -->
    <jsp:include page="layout/side-right.jsp"></jsp:include>      
    <!-- End Right Column -->
    
  <!-- End Grid -->
  </div>
  </div>
<!-- End Page Container -->
</div>
<br>
<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}
// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>
</body>
</html> 
