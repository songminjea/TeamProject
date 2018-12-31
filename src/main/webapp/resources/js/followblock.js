function getContextPath() { // ContextPath 얻어오는 함수

	var hostIndex = location.href.indexOf(location.host) + location.host.length;

	return location.href.substring(hostIndex, location.href.indexOf('/',
			hostIndex + 1));

}
// 
Handlebars.registerHelper('getType', function(type,follower,following,options) {
	  if (type == "follower") {
	    return follower;
	  } else {
	    return following;
	  }
});


// 팔로워 목록을 출력
function getFollowerList(my_id, page_id) {
	$.ajax({
		type : "POST",
		contentType : "application/json",
		DataType : "json",
		url : "/TeamPro/" + page_id + "/getFollowerList",
		success : function(result) {
			$("#follow_list").children().detach();
			if(result.length == 0){
				$("#follow_list").append("<h1>저런! 친구가 없으시네요!</h1>");
			}else{
				var source = $("#follow-template").html();
				var template = Handlebars.compile(source);
				var data = {
					follow : result,
					my_id,
					type : "follower"
				}
				console.log(data);
				var html = template(data);
				$("#follow_list").append(html);
				
				$.each(result, function(i){
					isFollowed(my_id , result[i].follower_id);
				})
			}
			

		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}


//팔로잉 목록을 출력
function getFollowingList(my_id, page_id) {
	$.ajax({
		type : "POST",
		contentType : "application/json",
		DataType : "json",
		url : "/TeamPro/" + page_id + "/getFollowingList",
		success : function(result) {
			
			
			$("#s_infoArea").children().detach();
			if(result.length == 0){
				$("#s_infoArea").append("<h1>저런! 친구를 만드세요!</h1>");
			}else{
				var source = $("#follow-template").html();
				var template = Handlebars.compile(source);
				var data = {
					follow : result,
					my_id,
					type : "following"
				}
				
				var html = template(data);
				$("#follow_list").append(html);
				
				$.each(result, function(i){
					isFollowed(my_id , result[i].following_id);
				})
			};

		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}


function isFollowed(follower_id, following_id) {
	var isfollowed;
	
	if(follower_id != "")
	$.ajax({
		type : "POST",
		//async: false,
		contentType : "application/json",
		dataType : "json",
		data : JSON.stringify({
			follower_id : follower_id,
			following_id : following_id
		}),
		url : "/TeamPro/isFollowed",
		success : function(result) {
			isfollowed = result;
			// 팔로우 되어있는 사람이 아닐때
			if (isfollowed == 0) { 
				
				$('#list_' + following_id).find('button').eq(0).removeClass(
				'fbhide');
				$('#list_' + following_id).find('button').eq(1).addClass(
				'fbhide');

			// 팔로우 되어있는 사람일때
			} else { 
				
				$('#list_' + following_id).find('button').eq(0).addClass(
				'fbhide');
				$('#list_' + following_id).find('button').eq(1).removeClass(
				'fbhide');
			}
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}

	});
	

}


// 팔로우 눌렀을때 처리
function follow(follower_id, following_id) {

	$.ajax({
		type : "POST",
		contentType : "application/json",
		data : JSON.stringify({
			follower_id : follower_id,
			following_id : following_id
		}),
		url : "/TeamPro/follow",
		success : function(result) {
			if (result == 1) { // 언팔로우 되었을때
				// alert("성공!");
				console.log("팔로우 성공 - ajax")
				$('#list_' + following_id).find('button').eq(0).addClass(
						'fbhide');
				$('#list_' + following_id).find('button').eq(1).removeClass(
						'fbhide');
			} else { // 언팔로우 안되었을때
				console.log("팔로우 실패! 이미 팔로우 되어있음.")
			}

		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}

	});
}

// 언파로우 버튼 눌렀을때.
function unfollow(follower_id, following_id) {

	$.ajax({
		type : "POST",
		contentType : "application/json",
		// dataType: "json",
		data : JSON.stringify({
			follower_id : follower_id,
			following_id : following_id
		}),
		url : "/TeamPro/unfollow",
		success : function(result) {
			if (result == 1) { // 언팔로우 되었을때
				// alert("성공!");
				console.log("언팔로우 성공 - ajax")
				$('#list_' + following_id).find('button').eq(0).removeClass(
						'fbhide');
				$('#list_' + following_id).find('button').eq(1).addClass(
						'fbhide');
			} else { // 언팔로우 안되었을때
				console.log("언팔로우 실패! 팔로우 되어있는 사람이 아님!")
			}

		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}

	});

}



$(function() {

	// 팔로워 버튼 메뉴 클릭 이벤트
	$(document).on("click", "#getfollower_Btn" , function(){
		
		var id = $("#page_id").val()
		url = getContextPath() + "/" + id + "/follower/";
		location.href = url;
		
	});
	
	// 팔로잉 버튼 메뉴 클릭이벤트.
	$(document).on("click", "#getfollowing_Btn" , function(){
		
		var id = $("#page_id").val()
		url = getContextPath() + "/" + id + "/following/";
		location.href = url;
		
	});


});

window.onload = function(){
	
	var my_id = $("#mem_id").val();
	var page_id = $("#page_id").val();
	
	if($("#page_type").val() == 'follower'){	
		getFollowerList(my_id, page_id);
	}
	else{
		getFollowingList(my_id, page_id);
	}
}
