var writeTemplate = Handlebars.compile($("#writeTemplate").html());
var click = 0;


Handlebars.registerHelper('SetDeleteBtn', function(writerID , options) {
	  var sessionID = $("#mem_id").val();
	  //console.log(sessionID + " " + writerID);
	  //console.log(sessionID == writerID);
	  // 해당 글이 내가 쓴글일때.
	  if(sessionID == "" || sessionID == null){
		  return options.inverse(this);
	  }else if (sessionID == writerID) {
		  return options.fn(this);
	  }else { // 내가 쓴 글이 아닐때.
		  return options.inverse(this);
	  }
});



function formRecommentWrite(){
	var formdata = jQuery("#recommentWrite").serialize();
	
	//console.log(formdata);
	
	var mb_ID = $("#MB_ID").val();
	var gb_Num = $("#GB_Num").val();

	$.ajax({
		type : "post",
		contentType :"application/x-www-form-urlencoded; charset=UTF-8",
		DataType : "html",
		data : formdata,
		url : "/TeamPro/"+mb_ID+"/recommentWrite",
		success : function(result){
			$(".noAttach").remove();
			click = 0;
			recomment(gb_Num);
		}
	});
	
	
}

function deleteBtn(num,gb_Num){
	
	$.ajax({
		type :"post",
		contentType : "application/json",
		DataType : "json",
		url : "/TeamPro/"+num+"/delRecomment",
		success : function(result){
			$(".noAttach").remove();
			click = 0;
			recomment(gb_Num);	
		}
	});
}

function modifyRecomment(cm_Num){
	$.ajax({
		type :"post",
		contentType : "application/json",
		DataType : "json",
		url : "/TeamPro/"+num+"/modifyRecomment",
		success : function(result){
			$(".noAttach").remove();
			click = 0;
			recomment(gb_Num);	
		}
	});
}

function recomment(gb_Num){

	$.ajax({
		type : "POST",
		contentType : "application/json",
		//data : {gb_Num:gb_Num},
		Datatype : "json",
		url : "/TeamPro/"+ gb_Num + "/reComment",
		success : function(result){
			
			var data = {
					write : result,
					gb_Num : gb_Num
			}
			
			
			serchWrite(result,gb_Num,data);
		}
	});
}


function serchWrite(result,gb_Num,data){
	//console.log(result);
	
	if(click == 1){
		$(".noAttach").remove();
		click = 0;
		
	}else{
		click = 1;
		var html = writeTemplate(data);
		if(result.length != 0 ){
			$("#recomment_"+gb_Num).append(html);
			Timeset();
		}else{
			$("#recomment_"+gb_Num).append("<div class ='noAttach'><div align='center' style='line-height: 200%;'>" +
					"<h5 style='color: #1d2c52; font-weight: 600;'>" +
					"댓글이 없습니다. <br> 하고 싶은 말을 적어주세요!</h5></div></div>"+html);
		}
		
	}	
}

function Timeset(){
		
	var length = $(".commentTime").length;
	var now = new Date();
	var old;
	var timetxt = $(".commentTime").text();
		//console.log(now.getTime() + " : " + timetxt);
		
	old = new Date(parseInt(timetxt));
	var gap = now.getTime() - old.getTime();
	var sgap = Math.round(gap/1000);
	var mgap = Math.round(gap/1000/60);
	var hgap = Math.round(gap/1000/3600);
	if(hgap > 24){
		$(".commentTime").text(old.getMonth()+1 + "월 " + old.getDate() + "일");
	}		
	else if(hgap >= 1){
		$(".commentTime").text(hgap + "시간 전");
	}else if(mgap >= 1){
		$(".commentTime").text(mgap + "분 전");
	}else if(sgap >= 1){
		$(".writeTime").text(sgap + "초 전");
	}else{
		$(".commentTime").text("방금 전");
	}

}


