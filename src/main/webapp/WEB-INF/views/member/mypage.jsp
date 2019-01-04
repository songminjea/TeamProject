<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BabyParent | MyPage</title>	
<!-- CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css"> 
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<!-- 유효성 체크에 관한 폰트 색을 담당 -->
<style type="text/css">		
	.errMsg{font-size: 9pt; color: red}	
</style>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
<span class="imageList">
	<a href="{{getView ID}}">
		<span id="{{ID}}">
			<img src="${pageContext.request.contextPath}/mypage/display?imageName={{PIC}}" alt="view" />
		</span>
	</a>
</span>
{{/each}}
</script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.7/handlebars.min.js"></script>
	<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/imglogin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</head>
<!-- body -->
<body class="w3-theme-l5">
<div class="main">
<!-- Header -->
	<jsp:include page="../layout/header.jsp"/>
<!-- END Header -->
<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1600px;padding-top:120px">    
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
              <div align="center" class="mypage_area">
				<h3>회원정보 수정페이지</h3><br/>	
					<table border="0" width="400" >
						<form:form commandName="member"
								   method="post" 
								   action="${pageContext.request.contextPath}/mypageOk"> 
							<tr>
								<td>아이디</td>
								<td>
									<!-- id부분은 수정금지 읽기만 가능하게 readonly="true"로  -->
									<form:input path="ID" maxlength="20" readonly="true" class="mypage_input"/>
									<form:errors path="ID" cssClass="errMsg"/> <!-- 유효성 체크에 실패하면 error메시지 출력 구문 -->
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<form:password path="PWD" maxlength="20" class="mypage_input"/>
									<form:errors path="PWD" cssClass="errMsg"/>
								</td>				
							</tr>
							<tr>
								<td>이름</td>
								<td>
									<form:input path="NAME" maxlength="13" class="mypage_input"/>
									<form:errors path="NAME" cssClass="errMsg"/>
								</td>				
							</tr>
							<tr>
								<td>전화번호</td>
								<td>
									<form:input path="PHONE" maxlength="13" class="mypage_input"/>
									<form:errors path="PHONE" cssClass="errMsg"/>
								</td>				
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<form:input path="EMAIL" maxlength="50" class="mypage_input"/>
									<form:errors path="EMAIL" cssClass="errMsg"/>
								</td>				
							</tr>
							<tr>
									<td class="imgfile">
										<input type="file" class = "file">
									</td>
								</tr>						
								<tr>
									<td>
										<ul class = "uploadedFileList"></ul>
										<form:hidden path="PIC" id="PIC"/>
									</td>
								</tr>				
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="회원정보수정"/> &nbsp;&nbsp;&nbsp;
									<input type="button" value="취소" onclick="history.back();">
								</td>
							</tr>
						</form:form>
					</table>
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

</body>
</html>