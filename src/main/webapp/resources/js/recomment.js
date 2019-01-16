function recomment(gb_Num){
	
	console.log(gb_Num);

	$.ajax({
		type : "POST",
		contentType : "application/json",
		//data : {gb_Num:gb_Num},
		Datatype : "json",
		url : "/TeamPro/"+ gb_Num + "reComment",
		sucess : function(result){
			console.log(result);
		}
	});
}