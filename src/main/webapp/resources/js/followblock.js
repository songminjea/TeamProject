function getContextPath() { // ContextPath 얻어오는 함수

	var hostIndex = location.href.indexOf(location.host) + location.host.length;

	return location.href.substring(hostIndex, location.href.indexOf('/',
			hostIndex + 1));

}

function follow(follower_id, following_id) {

}

function unfollow(follower_id, following_id) {
	
	//console.log(follower_id);
	//console.log(following_id);
	
	$.ajax({
		type : "POST",
		contentType: "application/json",
		dataType: "json",
		data : JSON.stringify({follower_id : follower_id,
				following_id : following_id}),
		url : "/TeamPro/unfollow",
		success : function(data) {
			if(data == 1){ // 언팔로우 되었을때
				$('#following_id').remove();
			}else{ // 언팔로우 안되었을때
				alert("언팔로우 실패!")
			}
			
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}

	});

}

$(function() {

	$('#follower_Btn').on("click", function() {
		var id = $('#follower_Btn').val()
		url = getContextPath() + "/" + id + "/follower/";
		location.href = url;

	});

	$('#following_Btn').on("click", function() {
		var id = $('#following_Btn').val()
		url = getContextPath() + "/" + id + "/following/";
		location.href = url;
	});

});
