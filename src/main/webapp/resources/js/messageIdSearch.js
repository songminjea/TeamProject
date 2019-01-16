/* 쪽지 전송시 아이디 존재 여부 확인을 위한 JS */

    $(".idCheckBtn").click(function() {
        $.ajax({
            type : "POST",
            data : {
            	"MESSAGE_RECEIVER" : $("#MESSAGE_RECEIVER").val()
            },
            url : "messageIdCheck",
            success : function(data) {
                if ($.trim(data) == "YES") {
	                $(".result .msg").html('<font style="font-size: 13px; color: #2f29fc">아이디가 존재합니다.</font>');
	                $("#sendBtn").removeAttr("disabled");
                } else {
	                $(".result .msg").html('<font style="font-size: 13px; color: #2f29fc">존재하지 않는 아이디입니다.</font>');
	                $("#sendBtn").attr("disabled", "disabled");
                }
            }
        });
    });