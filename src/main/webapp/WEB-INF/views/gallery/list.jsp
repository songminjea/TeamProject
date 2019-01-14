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

<div id="screenLock" style="width:100%; height:100%; top:0px; left:0px; position:absolute; z-index:1; background:#1B1B1B; visibility:hidden;">
	<div style="position: relative; top: 50%; text-align: center; color: red; font-size: 20px; font-weight: bold; opacity: 1.0;">
		차단 된 페이지에는 접근 할 수 없습니다.<br><br>
		<a href="javascript:history.back();" style=" border: 1px solid white; color: white; border-radius: 20px; padding: 5px;">
		돌아가기
		</a>
	</div> 
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
	{{else}}
	<%-- 다른 사람이 쓴 글일때 --%>
	 <span class="w3-right">
		<div class="w3-dropdown-click">
			<button class="gall_DropBtn w3-button w3-white w3-hover-white">
				<i class="fa fa-check" aria-hidden="true"></i>
			</button>
			<div id="gallDrop_{{gallery/gb_Num}}" class="w3-dropdown-content w3-bar-block w3-border">
				<a href="${pageContext.request.contextPath}/{{gallery/mb_ID}}/follower" class="w3-bar-item w3-button">팔로우 목록</a>
				<button class="w3-bar-item w3-button blockBtn blockbtn_{{gallery/mb_ID}}" value="{{gallery/mb_ID}}">차단 하기</button>
				
				<button type="button" class="w3-bar-item w3-button blockingBtn blockbtn_{{gallery/mb_ID}} fbhide"
					value='{{gallery/mb_ID}}'>
					<span>차단 중</span> <span>차단 해제</span>
				</button>
			</div>
		</div>
	</span>
	
	{{/GetDropdownBtn}} 
	
	

	<%-- 드랍다운 버튼 끝 --%>
	<%-- 글쓴이, 작성시간 --%>
	<h5>
		<a href="${pageContext.request.contextPath}/{{gallery/mb_ID}}/gallery"><span class="writerId" style="font-weight: bolder;color: #1d2c52;">{{gallery/mb_ID}}</span></a>
		<span class="writeTime w3-opacity">{{gallery/gb_Date}}</span>
	</h5>
	<br><br>

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

	

	<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom">
		<i class="fa fa-thumbs-up" id="like_i"></i><font class="listFont">Like</font>
	</button>
	<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom">
		<i class="fa fa-comment" id="comment_i"></i><font class="listFont">Comment</font>
	</button>
	
	<hr class="w3-clear" style="margin: 5px 0 20px;">
</div>	
{{/gall}}
</script>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/gallery.js"></script>