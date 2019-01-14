/* 채팅용 JS */

//채팅 아이디 자신인지 판단함
$("#btnSend").click(function() {
        $.ajax({
            type : "POST",
            data : {
            	"CHAT_SENDVAL" : $("#CHAT_SENDVAL").val()
            },
            url : "multiChat",
            success : function(data) {
                if ($.trim(data) == true) {
                	$("#discussion li").addClass("class", "left");
                } else {
	                $("#discussion li").addClass("class", "right");
                }
            }
        });
    });

