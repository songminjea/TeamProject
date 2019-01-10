pageNum = 0;
isDetach = true;

function regHelper(){
	Handlebars.registerHelper('SetActive', function(index, options) {
		  
		  if (index == "0") {
		    return "active";
		  } else {
		    return "";
		  }
	});
	
	
	// 이미지 수에 따라 캐러셀 사용 여부를 리턴
	Handlebars.registerHelper('setCarousel', function(length, options) {
		  //console.log(length);
		  // 이미지가 한개일때
		  if (length == "1") {
			  return options.inverse(this);
		  } else { // 이미지가 없거나, 한개 이상 일때.
			 return options.fn(this);
		  }
	});
	
	Handlebars.registerHelper('GetImgSrc', function(src ,options) {
		//console.log(src);
		
		if(src == null || src == ""){
			return "resources/img/baby.jpg";
		}else
			return src;
		
	});
}

function ShowGallery(id, isMyGall){
	var GotoUrl = "";
	// 내가 쓴 글만 출력할때 = main 으로 접근
	if(isMyGall == 'true'){
		GotoUrl = "/TeamPro/getMyGallery";
	}
	// 대상 id가 쓴 글을 출력할때 = {id}/gallery 로 접근
	else{
		GotoUrl = "/TeamPro/getSpecGallery"
	}
	if(isDetach == true)
		$("#gallery_list").children().detach();
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		data : JSON.stringify({
			id : id ,
			pageNum : pageNum
		}),
		DataType : "json",
		url : GotoUrl,
		success : function(result) {
			if(result.length != 0){
				var source = $("#gallery-template").html();
				var template = Handlebars.compile(source);
				var data = {
						gall : result,
				}
				
				regHelper();
				
				//console.log(data);
				var html = template(data);
				$("#gallery_list").append(html);
				TimeFormat();
				
				pageNum++;
			} else{
				if(isDetach == true)
					$("#gallery_list").append("<h4 style='color: #1d2c52;'>글좀 써주세요... 싫음 말고</h4>");
				
			}
			//console.log(result.length);
		}
		
	});
	
}
	

// 시간 처리 ex)1분전 , 10초전 작성 등등
function TimeFormat(){
	
	var length = $(".writeTime").length;
	var now = new Date();
	var old;
	for(var i=0; i<length; i++){
		var timetxt = $(".writeTime").eq(i).text();
		//console.log(now.getTime() + " : " + timetxt);
		
		old = new Date(parseInt(timetxt));
		var gap = now.getTime() - old.getTime();
		var sgap = Math.round(gap/1000);
		var mgap = Math.round(gap/1000/60);
		var hgap = Math.round(gap/1000/3600);
		if(hgap > 24){
			$(".writeTime").eq(i).text(old.getMonth()+1 + "월 " + old.getDate() + "일");
		}		
		else if(hgap >= 1){
			$(".writeTime").eq(i).text(hgap + "시간 전");
		}else if(mgap >= 1){
			$(".writeTime").eq(i).text(mgap + "분 전");
		}else if(sgap >= 1){
			$(".writeTime").eq(i).text(sgap + "초 전");
		}else{
			$(".writeTime").eq(i).text("방금 전");
		}
		
		//console.log(sgap + "초 차이 ," + mgap + "분 차이 " + hgap + "시간 차이");

	}
	
	
}


$('body').scroll(function(){
	
	if ($('body').scrollTop() == $(document).height() - $(window).height()) {
    	isDetach = false;
    	
    	// 내 갤러리인지 아닌지
    	var isMyGall = $("#isMyGall").val()
    	// 스크롤링에 사용되는 페이지 번호 
    	var pageid = $("#pageid").val();

    	ShowGallery(pageid, isMyGall);
    	
    }	
});

$(document).ready(function(){
	var isMyGall = $("#isMyGall").val()
	var pageid = $("#pageid").val();

	ShowGallery(pageid, isMyGall);
});
