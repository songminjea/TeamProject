



function ShowGallery(id, isMyGall){
	var GotoUrl = "";
	// 내가 쓴 글만 출력할때 = main 으로 접근
	if(isMyGall == 'true'){
		GotoUrl = "/TeamPro/" + id + "/getMyGallery";
	}
	// 대상 id가 쓴 글을 출력할때 = {id}/gallery 로 접근
	else{
		GotoUrl = "/TeamPro/" + id + "/getSpecGallery"
	}
	
	$("#gallery_list").children().detach();
	$.ajax({
		type : "POST",
		contentType : "application/json",
		DataType : "json",
		url : GotoUrl,
		success : function(result) {
			if(result.length != 0){
				mutiImgCheck(result);
	//			var mutiImg = false;
	//			$.each(result,function(i){
	//				var j = i+1;
	//				var firstNum = result[i].gb_Num;
	//				$.each(result,function(j){
	//					var secondNum = result[j].gb_Num;
	//					if(firstNum != secondNum){
	//						multiImg = true;
	//					}
	//				})
	//			})
	//			if(!multiImg){
	//			
	//			var source = $("#gallery-template").html();
	//			var template = Handlebars.compile(source);
	//			console.log(result);
	//			var data = {gall : result}
	//			var html = template(data);
	//			$("#gallery_list").append(html);
	//			TimeFormat();
	//			}else{
	//				console.log(result);
	//			}
			} else{
				$("#gallery_list").append("<h1>글좀 써주세요... 싫음 말고</h1>");
			}
			//console.log(result.length);
		}
		
	});
	
}

function mutiImgCheck(data){
	var mutiImg = false;
	var start = 0;
	var end = 0;
	//console.log(data);
	for(var i = 0; i< data.length; i++){
		for(var j=i+1; j< data.length; j++){
			if(data[i].gb_Num == data[j].gb_Num){
				start = i;
				end = j;
			}
			else{
				start = i;
				end = j-1;
				break;
			} // if 끝
			
		} // for j 끝

		// 이미지가 한개
		if(start == end){
			var source = $("#gallery-template").html();
			var template = Handlebars.compile(source);
			var html = template(data[start]);
			$("#gallery_list").append(html);
			TimeFormat();
		} else{ // 이미지 여러개
			var imguri = [];
			var index = 0;
			for(var k=start; k<=end; k++){
				imguri[index] = {"imguri" : data[k].gb_File};
				index++;
			}
			var source = $("#gallery-template2").html();
			var result = {
					gall : data[start],
					img_file : imguri
			}	
			
			Handlebars.registerHelper('SetActive', function(index, options) {
				  
				  if (index == "0") {
				    return "active";
				  } else {
				    return "";
				  }
			});
			
			//console.log(result);
			
			var template = Handlebars.compile(source);
			var html = template(result);
			$("#gallery_list").append(html);
			TimeFormat();
			
		}		
		
		
		i = end;
	} // for i 끝
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

$(document).ready(function(){
	var isMyGall = $("#isMyGall").val()
	var pageid = $("#pageid").val();

	ShowGallery(pageid, isMyGall);
});
