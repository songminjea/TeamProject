<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Baby Parent</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> 
<!-- 썸머노트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
</head>
<!-- body -->
<body class="w3-theme-l5">
<div class="main" style="overflow-y:auto;">
<!-- Header -->
	<jsp:include page="../layout/header.jsp"/>
<!-- END Header -->
<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1600px;padding-top:120px;">    
  <!-- The Grid -->
  <div class="w3-row">
  	<!-- Left Column -->
    <jsp:include page="../layout/side-left.jsp"/>
    <!-- End Left Column -->
    <!-- Middle Column -->
    <div class="w3-col m7">
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <div align="center" style="padding: 30px;">
	
<h2>글쓰기 페이지</h2>
<c:set var="path" value="${pageContext.request.contextPath}" />
<form name="ddto" method="post" action="${path}/deal/insert.do" class="table" >
	<div>제목<input name="DEAL_SUBJECT" id="deal_subject" size="80" required></div>
	<div>내용<textarea name="DEAL_CONTENT" id="deal_content" rows="8" cols="80" required></textarea> </div>
	<div>작성자<input name="DEAL_ID" id="deal_id" size="80" required></div>
		<div style="width:650px; text-align:center;">
            <input type="submit" value="확인">
            <input type="reset" value="리셋">
            <input type="button" value="목록" onclick="location.href='${path}/deal/list.do'">
        </div>
		<!--섬머노트  -->
 	<div id="summernote"></div>
    <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 100
      });
    </script>
</form>
			</div>
            </div>
          </div>
        </div>
      </div>
    <!-- End Middle Column -->
    </div>
     <!-- Right Column -->
    <jsp:include page="../layout/side-right.jsp"></jsp:include>      
    <!-- End Right Column -->
  <!-- End Grid -->
  </div>
  </div>
</div>
<!-- End Page Container -->
<!-- js 파일 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</body>
</html>