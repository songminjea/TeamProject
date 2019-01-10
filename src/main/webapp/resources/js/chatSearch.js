/* 채팅 아이디 검색용 JS */

function chatSearch(keyword){
	
	url = "chatSearch";
	$.ajax({
		type : "GET",
		contentType : "application/json",
		data : JSON.stringify({
			keyword : keyword
		}),
		url : url,
		success : function(result) {
			
			if(result.length == 0){
				if(isDetach == true)
					$("#search_list").append(
					"<div class='w3-col m12 w3-card w3-round w3-white' style='padding: 50px 30px;'>" +
						"<div class='w3-container'  align='center'>" +
					"<h4 style='font-weight: 500; color: #1d2c52;'>" + keyword + "로 검색한 결과가 없습니다.</h4> </div> </div>"
					);
			}else{
				var source = $("#chatSearch-template").html();
				var template = Handlebars.compile(source);
				var data = {
					chatSearch : result,
				}	
				//console.log(data);
				var html = template(data);
				$("#chatSearch_List").append(html);
				
			}
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
	
}
$(document).ready(function(){	
	var keyword = $("#chatSearchKeyword").val();	
	chatSearch(keyword);	
});
