function getContextPath() { // ContextPath 얻어오는 함수

	var hostIndex = location.href.indexOf(location.host) + location.host.length;

	return location.href.substring(hostIndex, location.href.indexOf('/',
			hostIndex + 1));

}

// 팔로워 목록을 출력
function getFollowerList(my_id, page_id) {
	
	$("#s_listArea").children().remove();
	
	$("#s_listArea").append(
			"<button type='button' class='w3-button w3-theme-d1'" +
				" id='getfollower_Btn' value='" +page_id+ "'" +
				" onclick=getFollowerList('" + my_id + "','" + page_id  + "')>" +
				" <i class='fa fa-thumbs-up'></i> 팔로워" +
			"</button>");
	
	$("#s_listArea").append(
			"<button type='button' class='w3-button w3-theme-d1'" +
				" id='getfollowing_Btn' value='" +page_id+ "'" +
				" onclick=getFollowingList('" + my_id + "','" + page_id  + "')>" +		
				" <i class='fa fa-thumbs-up'></i> 팔로잉" +
			"</button>");
	
	//console.log(page_id + " " + my_id);
	$.ajax({
		type : "POST",
		contentType : "application/json",
		DataType : "json",
		url : "/TeamPro/" + page_id + "/test",
		success : function(result) {

			$.each(result, function(i) {
				//console.log(result[i]);
				
				isFollowed(my_id , result[i].follower_id);
				
				// 리스트를 감싸는 div의 아이디
				var div_id = "list_"+result[i].follower_id;
				$("#"+div_id).remove();
				$("#div_flist").append("<div id="+div_id+">");
				
				$("#"+div_id).append("<img src='/TeamPro/resources/css/baby.jpg' alt='프로필 사진'" +
					"class='w3-left w3-circle w3-margin-right' style='width: 60px'>");
				
				
				$("#"+div_id).append("<span id='span_fBtn' class='w3-right'>");
				
				$("#"+div_id).children("#span_fBtn").append("<button type='button'" +
						"class='w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn fbhide'" +
						"onclick=follow('" + my_id + "','" + result[i].follower_id + "')>팔로우</button>" +
						"<button type='button'" +
						"class='w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn fbhide'" +
						"onclick=unfollow('" + my_id + "','" + result[i].follower_id + "')>" +
						"<span>팔로잉</span> <span>언팔로우</span>" +
					"</button>");
				
				$("#"+div_id).append("<h4><a href=''>"+ result[i].follower_id + "</a></h4>");
				$("#"+div_id).append("<br>	<hr class='w3-clear'>");
			});

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}


//팔로잉 목록을 출력
function getFollowingList(my_id, page_id) {
	$("#div_flist").children().remove();
	$("#div_flist").append("<span id='s_listArea'>");
	$("#s_listArea").append(
			"<button type='button' class='w3-button w3-theme-d1'" +
				" id='getfollower_Btn' value='" +page_id+ "'" +
				" onclick=getFollowerList('" + my_id + "','" + page_id  + "')>" +
				" <i class='fa fa-thumbs-up'></i> 팔로워" +
			"</button>");
	
	$("#s_listArea").append(
			"<button type='button' class='w3-button w3-theme-d1'" +
				" id='getfollowing_Btn' value='" +page_id+ "'" +
				" onclick=getFollowingList('" + my_id + "','" + page_id  + "')>" +		
				" <i class='fa fa-thumbs-up'></i> 팔로잉" +
			"</button>");
	
	//console.log(page_id + " " + my_id);
	$.ajax({
		type : "POST",
		contentType : "application/json",
		DataType : "json",
		url : "/TeamPro/" + page_id + "/test2",
		success : function(result) {

			$.each(result, function(i) {
				//console.log(result[i]);
				
				isFollowed(my_id , result[i].following_id);
				
				// 리스트를 감싸는 div의 아이디
				var div_id = "list_"+result[i].following_id;
				$("#"+div_id).remove();
				$("#div_flist").append("<div id="+div_id+">");
				
				$("#"+div_id).append("<img src='/TeamPro/resources/css/baby.jpg' alt='프로필 사진'" +
					"class='w3-left w3-circle w3-margin-right' style='width: 60px'>");
				
				
				$("#"+div_id).append("<span id='span_fBtn' class='w3-right'>");
				
				$("#"+div_id).children("#span_fBtn").append("<button type='button'" +
						"class='w3-button w3-theme-d1 w3-margin-bottom followBtn fbBtn fbhide'" +
						"onclick=follow('" + my_id + "','" + result[i].following_id + "')>팔로우</button>" +
						"<button type='button'" +
						"class='w3-button w3-theme-d1 w3-margin-bottom followingBtn fbBtn fbhide'" +
						"onclick=unfollow('" + my_id + "','" + result[i].following_id + "')>" +
						"<span>팔로잉</span> <span>언팔로우</span>" +
					"</button>");
				
				$("#"+div_id).append("<h4><a href=''>"+ result[i].following_id + "</a></h4>");
				$("#"+div_id).append("<br>	<hr class='w3-clear'>");
			});

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
}


function isFollowed(follower_id, following_id) {
	var isfollowed;
	
	//console.log(follower_id + " " + following_id);
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
			alert("code:" + request.status + "\n" + "message:"
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
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}

	});
}

// 언파로우 버튼 눌렀을때.
function unfollow(follower_id, following_id) {

	// console.log(follower_id);
	// console.log(following_id);
	// console.log('#list_' + following_id);

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
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}

	});

}

$(function() {

	// 팔로워 버튼 메뉴 클릭 이벤트
	$(document).on("click", "#getfollower_Btn" , function(){
		
		var id = $(this).val()
		url = getContextPath() + "/" + id + "/follower/";
		//location.href = url;
		
	});
	
	// 팔로잉 버튼 메뉴 클릭이벤트.
	$(document).on("click", "#getfollowing_Btn" , function(){
		
		var id = $(this).val()
		url = getContextPath() + "/" + id + "/following/";
		//location.href = url;
		
	});


});
