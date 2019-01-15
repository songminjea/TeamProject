/*
 * 검색창 출력을 위한 JS
 */

pageNum = 0;
isDetach = true;


function getSearchHelper(){
	Handlebars.registerHelper('SetBtnState', function(isfollowed,isblocked,type,options) {
		//console.log(isfollowed + " " + isblocked);
		if(isfollowed == ""){
			return 'fbhide';
		}
		
		if (type == "follow") {
			if(isblocked == 'true'){
				return 'fbhide';
			}
			else if(isfollowed == 'true'){
			
				return 'fbhide';
			}else{
				return;
			}
		  
		} else if(type =="following"){
			
			if(isblocked == 'true'){
				return 'fbhide';
			}
			else if(isfollowed == 'true'){
				return;
			}else{
				return 'fbhide';
			}
		} else if(type == "blocking"){
			if(isblocked == 'true'){
				return;
			}
			else{
				return 'fbhide';
			}
		}
		
	});

}

function getSearchList(keyword){
	
	url = "/TeamPro/getSearchList";
	$.ajax({
		type : "POST",
		contentType : "application/json",
		data : JSON.stringify({
			keyword : keyword,
			pageNum : pageNum
		}),
		url : url,
		success : function(result) {
			//console.log(result);
			getSearchHelper();
			
			if(isDetach == true)
				$("#search_list").children().detach();
			
			if(result.length == 0){
				if(isDetach == true)
					$("#search_list").append(
					"<div class='w3-col m12 w3-card w3-round w3-white' style='padding: 50px 30px;'>" +
						"<div class='w3-container'  align='center'>" +
						"<img src='./resources/img/logo_oops.png'style='width: 30%; margin-bottom: 30px;'/>"+
					"<h4 style='font-weight: 500; color: #1d2c52;'>" + keyword + "로 검색한 결과가 없습니다!</h4> </div> </div>"
					);
			}else{
				var source = $("#search-template").html();
				var template = Handlebars.compile(source);
				var data = {
					search : result,
				}	
				//console.log(data);
				var html = template(data);
				$("#search_list").append(html);
				
				pageNum++;
			}
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});
	
}

$('body').scroll(function(){
	if ($('body').scrollTop() == $(document).height() - $(window).height()) {
		isDetach = false;
		
		var keyword = $("#keyword").val();
		getSearchList(keyword);
	
	}
});

function searchBtnExtends(target_id, type, state){
	var reverse_type;
	if(type == "follow")
		reverse_type = "block";
	else
		reverse_type = "follow";
	
	if(state == 1){
		if(type == 'block')
			$('.'+ reverse_type + 'btn_'+ target_id).addClass('fbhide');
	}else{
		$('.'+ reverse_type + 'btn_'+ target_id).filter('.' + reverse_type + 'Btn').removeClass('fbhide');
	}
	
}

$(document).ready(function(){
	
	var keyword = $("#keyword").val();
	
	getSearchList(keyword);
	
	$(document).on("click", ".search_DropBtn", function(){
		if($(this).hasClass("w3-theme-d1") == false){
			$(this).addClass("w3-theme-d1");
			$(this).next().addClass("w3-show");
		}else{
			$(this).removeClass("w3-theme-d1");
			$(this).next().removeClass("w3-show");
		}
	});
	
	
});
