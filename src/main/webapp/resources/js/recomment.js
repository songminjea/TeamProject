var writeTemplate = Handlebars.compile($("#writeTemplate").html());
var click = 0;

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

	if(click == 1){
		$(".noAttach").remove();
		click = 0;
		
	}else{
		click = 1;
		var html = writeTemplate(data);
		if(result.length != 0 ){
			$("#recomment_"+gb_Num).append(html);
		}else{
			$("#recomment_"+gb_Num).append("<div class ='noAttach'><div align='center' style='line-height: 200%;'>" +
					"<h4 style='color: #1d2c52; font-weight: 600;'>" +
					"댓글좀 달아주세요ㅠㅠ</h4></div></div>"+html);
		}
	}
		
}
