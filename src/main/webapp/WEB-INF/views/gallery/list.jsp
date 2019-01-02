<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 내가 쓴글만 보여주는건지, 특정 아이디의 글을 볼건지. --%>
<input type="hidden" id="isMyGall" value="${isMyGall}">

<%-- url 아이디 --%>
<input type="hidden" id="pageid" value="${pageid}">


<div class="w3-row-padding">
	<div class="w3-col m12">
		<div class="w3-card w3-round w3-white">
			<div class="w3-container w3-padding" id="gallery_list">

			</div>
		</div>
	</div>
</div>

<script id="gallery-template" type="text/x-handlebars-template">
{{#gall}}
	<span class="profileImg">
		<img src="${pageContext.request.contextPath}/resources/img/baby.jpg" alt="Avatar"
			class="w3-left w3-circle w3-margin-right" style="width: 60px">
	</span>
	<span class="writeTime w3-right w3-opacity">{{gb_Date}}</span>
	<h4>
		<a href="${pageContext.request.contextPath}/{{mb_ID}}/gallery"><span class="writerId">{{mb_ID}}</span></a>
	</h4>
		<span>
	<p>{{gb_Content}}</p>
	</span>
	<div class="w3-row-padding" style="margin: 0 -16px">
		<div class="w3-half">
			<img src="${pageContext.request.contextPath}/resources/img/logo2.png" style="width: 100%"
				alt="Northern Lights" class="w3-margin-bottom">
		</div>
	</div>
	<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom">
		<i class="fa fa-thumbs-up"></i> Like
	</button>
	<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom">
		<i class="fa fa-comment"></i> Comment
	</button>
	
	<hr class="w3-clear" style="margin: 5px 0 20px;">	
{{/gall}}
</script>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/gallery.js"></script>
