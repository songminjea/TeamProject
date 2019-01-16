pageNum = 0;
isDetach = false;
 
	/* 스크롤 할때 처리 */  
    $('body').scroll(function() {
    	if($('body').scrollTop() == $(document).height()-$(window).height()){
    		isDetach = false;
        	
        	// 로그인된 아이디 (main.jsp에 hidden값)
        	var my_id = $("#mem_id").val();
    		getMessageList();
    	}     
    });
    
    function getMessageList(my_id) {
   	
    	$.ajax({
    		type : "POST",
    		contentType : "application/json",
    		data : JSON.stringify({
    			my_id : my_id
    		}),
    		url : "messageList",
    		success : function(result) {
   			
    			if(result.length >0){
    				var source = $("#message_list").html();
    				$("#message_listWrap").append(source);
    				
    				pageNum++;
    			}
    		},
    		error : function(request, status, error) {
    			console.log("code:" + request.status + "\n" + "message:"
    					+ request.responseText + "\n" + "error:" + error);
    		}
    	});
    }