<span id="s_listArea"> <%-- 팔로워 팔로잉 목록 버튼 --%>
			<button type="button" class="w3-button w3-theme-d1 w3-hover-white"
					id="chatfollower_Btn">
				<i class="fa fa-thumbs-up" style="color: #4497fd;"></i>
				<span style="font-weight: bold; color:#1d2c52;">&nbsp;팔로워</span>
			</button>
			<button type="button" class="w3-button w3-theme-d1 w3-hover-white"
					id="chatfollowing_Btn">
				<i class="fa fa-thumbs-up" style="color: #597eff;"></i>
				<span style="font-weight: bold; color:#1d2c52;">&nbsp;팔로잉</span>
			</button>
		</span>
		<hr class="w3-clear" style="margin: 5px 0 20px;">			
		<span id="chatFollow_list"> <%-- 팔로우 정보 리스트 영역 --%>				
		</span>
	
<script id="chatFollow-template" type="text/x-handlebars-template">
{{#follow}}	
	<div id="list_{{target_id}}">
		<img src=${pageContext.request.contextPath}/{{#GetImgSrc memVO/pic}}{{/GetImgSrc}} alt="프로필 사진" class="w3-left w3-circle w3-margin-right" style="width: 60px">
		<span id="span_fBtn" class="w3-right">
			<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn {{#SetBtnState isfollowed 'follow'}}{{/SetBtnState}} fbtn_{{target_id}}"
				value='{{target_id}}'>팔로우
			</button>
			<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn {{#SetBtnState isfollowed 'following'}}{{/SetBtnState}} fbtn_{{target_id}}"
				value='{{target_id}}'>
				<span>팔로잉</span> <span>언팔로우</span>
			</button>
		</span>
						
		<h4>
			<a href="${pageContext.request.contextPath}/{{target_id}}/gallery">
				{{target_id}}
			</a>
		</h4>
		<br>	
		<hr class="w3-clear">
	</div>
{{/follow}}
</script>