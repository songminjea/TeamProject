<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>Baby Parent</title>
<style>
.ablack {
	color: black;
	text-decoration: none;
	background-color: transparent;
	-webkit-text-decoration-skip: objects;
	
}
​
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main2.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<!-- font -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
	
</head>
<!-- body -->
<body class="w3-theme-l5" >
	<div class="main" style="overflow-y:auto;">
		<!-- Header -->
		<jsp:include page="../layout/header.jsp" />
		<!-- END Header -->
		<!-- Page Container -->
		<div class="w3-container w3-content"
			style="max-width: 1600px; padding-top: 120px;">
			<!-- The Grid -->
			<div class="w3-row">
				<!-- Left Column -->
				<jsp:include page="../layout/side-left.jsp" />
				<!-- End Left Column -->
				<!-- Middle Column -->
				<div class="w3-col m7">
					<div class="w3-row-padding">
						<div class="w3-col m12">
							<div class="w3-card w3-round w3-white">
								<div class="w3-container w3-padding">
									<div align="center" style="padding: 30px;">

										<h3>중고거래</h3>
										<c:set var="path" value="${pageContext.request.contextPath}" />
										<div align="left">
										<div align="right">
											<input type="button" value="글쓰기" class="btn btn-info"
												onclick="location.href='${path }/deal/write'" />
												</div>
										정렬기준 <select id="choice">
												<option value="small">게시판형</option>
												<option value="image">이미지형</option>
											</select>
											지역 : <select name="region">
												<option value="all">전체</option>
												<option value="seoul">서울</option>
												<option value="degu">대구</option>
												<option value="ulsan">울산</option>
												<option value="busan">부산</option>
											</select>
											
											</div>
											<br>
											<input type="text" class="form-control"
												id="myInput" size="33" placeholder="원하는 물건,글쓴이를 검색해보세요">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											
											  <br>
											<br>
											<table border="1" id="small" class="table">
												<tr>
													<th>번호</th>
													<th>물건</th>
													<!-- 내용은 상세페이지에서만-->
													<th>작성자</th>
													<th>작성일자</th>
													<th>조회수</th>
												</tr>
												<c:forEach var="row" items="${list}">
													<tr>
														<td>${row.DEAL_NUM}</td>
														<!-- 게시물 조회를 위해서 get방식으로 게시물번호 값을 넘겨줌 -->
														<td><a
															href="${path }/deal/read.do?DEAL_NUM=${row.DEAL_NUM}"
															class="ablack">${row.DEAL_SUBJECT}</a></td>
														<!-- 내용은 나중에 list페이지에서 삭제 -->
														<td>${row.DEAL_ID}</td>

														<!-- 만약 오늘이면 HH:mm:ss만 그 밖이면 yyyy-MM-dd만 상세 보기에서는 yyyy-MM-dd HH:mm:ss -->

														<%-- 	
														<!-- 안됨..시스템시간 받아오는법..  -->
														
														<c:if test="${row.DEAL_DATETIME eq sysdate}">
														<td>
														<fmt:formatDate value="${row.DEAL_DATETIME}"
															pattern="HH:mm:ss" />
														</td>
														</c:if>  --%>

														<td><fmt:formatDate value="${row.DEAL_DATETIME}"
																pattern="yyyy-MM-dd" /></td>

														<%-- <fmt:formatDate value="${row.DEAL_DATETIME}"
															pattern="yyyy-MM-dd HH:mm:ss" /> --%>

														<td>${row.DEAL_READCOUNT}</td>
													</tr>
												</c:forEach>
											</table>

											<table id="image">
												<c:forEach var="row" items="${list}">
													<tr>
														<td>
															<div class="card" style="width: 400px">
																<img class="card-img-top"
																	src="https://cdn.pixabay.com/photo/2014/10/01/10/44/hedgehog-468228_960_720.jpg"
																	alt="Card image" style="width: 100%">
																<div class="card-body">
																	<h4 class="card-title">${row.DEAL_SUBJECT}</h4>
																	<p class="card-text">일단은 실험..</p>
																	<a
																		href="${path }/deal/read.do?DEAL_NUM=${row.DEAL_NUM}"
																		class="btn btn-primary">자세히보기</a>
																</div>
															</div>
														</td>
														<td>
															<div class="card" style="width: 400px">
																<img class="card-img-top"
																	src="https://cdn.pixabay.com/photo/2014/05/20/21/20/easter-349026_960_720.jpg"
																	alt="Card image" style="width: 100%">
																<div class="card-body">
																	<h4 class="card-title">팝니다</h4>
																	<p class="card-text">
																		데이터 받아오기 언제해<br>글자를 길게 적으면 어떻게 되는지 보자.<br>커지네..안돼
																		그.. 점점점 처리로 바꿔야겠어
																	</p>
																	<a href="#" class="btn btn-primary">자세히보기</a>
																</div>
															</div>
														</td>

													</tr>
													<tr>
														<td>
															<div class="card" style="width: 400px">
																<img class="card-img-top"
																	src="https://cdn.pixabay.com/photo/2014/11/30/14/11/kitty-551554_960_720.jpg"
																	alt="Card image" style="width: 100%">
																<div class="card-body">
																	<h4 class="card-title">John Doe</h4>
																	<p class="card-text">Some example text some example
																		text. John Doe is an architect and engineer</p>
																	<a href="#" class="btn btn-primary">See Profile</a>
																</div>
															</div>
														</td>
														<td>
															<div class="card" style="width: 400px">
																<img class="card-img-top" src="img_avatar1.png"
																	alt="Card image" style="width: 100%">
																<div class="card-body">
																	<h4 class="card-title">John Doe</h4>
																	<p class="card-text">Some example text some example
																		text. John Doe is an architect and engineer</p>
																	<a href="#" class="btn btn-primary">See Profile</a>
																</div>
															</div>
														</td>

													</tr>
												</c:forEach>


											</table>

										<br> <br> <br>
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
	<script type="text/javascript">
	$(document).ready(
			function() {

				$("#image").hide();

				$("#choice").change(function() {
					if ($("#choice").val() == 'image') {
						$("#small").hide();
						$("#image").show();
					} else {
						$("#image").hide()
						$("#small").show();
					}
				});

				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#small tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
							$("#image tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
				
				

			})
</script>
	
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
</body>
</html>