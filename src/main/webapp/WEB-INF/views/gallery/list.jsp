<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 내가 쓴글만 보여주는건지, 특정 아이디의 글을 볼건지. --%>
<input type="hidden" id="isMyGall" value="${isMyGall}">
<%-- url 아이디 --%>
<input type="hidden" id="pageid" value="${pageid}">
	
<div class="w3-row-padding">
	
	<div class="w3-col m12">
		<div class="w3-card w3-round w3-white" style="padding: 20px 30px;">
			<div class="w3-container w3-padding" id="gallery_list">
			</div>
		</div>
	</div>
	<!-- Single button -->
	
</div>


<script id="gallery-template" type="text/x-handlebars-template">
{{#gall}}
<div id="gallery_{{gallery/gb_Num}}">
	<span class="profileImg">
		<img src="${pageContext.request.contextPath}/{{#GetImgSrc memVO/pic}}{{/GetImgSrc}}" alt="Avatar"
			class="w3-left w3-circle w3-margin-right" style="width: 60px">
	</span>
	<%-- 드랍다운 버튼 --%>
	{{#GetDropdownBtn gallery/mb_ID}}
	<%-- 내가 쓴 글일때 --%>
	<span class="w3-right">
		<div class="w3-dropdown-click">
			<button class="gall_DropBtn w3-button w3-white w3-hover-white">
				<i class="fa fa-check" aria-hidden="true"></i>
			</button>
			<div id="gallDrop_{{gallery/gb_Num}}" class="w3-dropdown-content w3-bar-block w3-border">
				<a href="#" onclick="modifyGallery({{gallery/gb_Num}})" class="w3-bar-item w3-button">수정</a> 
				<a href="" onclick="galleryDelete({{gallery/gb_Num}}); return false;" class="w3-bar-item w3-button">삭제</a>
			</div>
		</div>
	</span>
	<%--{{else}}
	<!-- 다른 사람이 쓴 글일때 --!>
	 <span class="w3-right">
		<div class="w3-dropdown-click">
			<button class="gall_DropBtn w3-button w3-white w3-hover-white">
				<i class="fa fa-check" aria-hidden="true"></i>
			</button>
			<div id="gallDrop_{{gallery/gb_Num}}" class="w3-dropdown-content w3-bar-block w3-border">
				<a href="#" class="w3-bar-item w3-button">aaa</a> 
			</div>
		</div>
	</span> --%>
	
	{{/GetDropdownBtn}} 
	
	

	<%-- 드랍다운 버튼 끝 --%>
	<%-- 글쓴이, 작성시간 --%>
		<a href="${pageContext.request.contextPath}/{{gallery/mb_ID}}/gallery"><h5 class="writerId" style="color: #1d2c52; font-weight: 600;">{{gallery/mb_ID}}</h5></a>
		<h6 class="writeTime w3-opacity">{{gallery/gb_Date}}</h6><br/>

	<%-- 글 내용 --%>
	<span id="Gall_Content"><p>{{#SetContentLine gallery/gb_Content}}{{/SetContentLine}}</p></span>

	<%-- 캐러셀 --%>
	<div id="carouselControls_{{gallery/gb_Num}}" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			{{#file}}
				<div class="carousel-item {{#SetActive @index}}{{/SetActive}}">
					<img class="carousel_Img d-block w-100" src="${pageContext.request.contextPath}/{{gb_File}}" alt="이미지">
				</div>
			{{/file}}		
	
		</div>
		{{#setCarousel file.length}}
			<a class="carousel-control-prev" href="#carouselControls_{{gallery/gb_Num}}" role="button" data-slide="prev"> 
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselControls_{{gallery/gb_Num}}" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<span class="sr-only">Next</span>
			</a>
		{{/setCarousel}}
	</div>		

	

	<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom w3-hover-white">
		<i class="fa fa-thumbs-up" id="like_i"></i><font class="listFont" style="font-size: 14px;">Like</font>
	</button>
	<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom w3-hover-white">
		<i class="fa fa-comment" id="comment_i"></i><font class="listFont" style="font-size: 14px;">Comment</font>
	</button>
	
	<hr class="w3-clear" style="margin: 5px 0 20px;">
</div>	
{{/gall}}
</script>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/gallery.js"></script>