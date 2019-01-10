/* 쪽지 전송시 아이디 존재 여부 확인을 위한 JS */
 
    $(".idCheckBtn").click(function() {
        
        $.ajax({
            async: true,
            type : "POST",
            data : {
            	"MESSAGE_RECEIVER" : $("#MESSAGE_RECEIVER").val()
            },
            url : "messageIdCheck",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if ($.trim(data) == 1) { 
                	$(".result .msg").html('<font style="font-size: 13px; color: #2f29fc">아이디가 존재합니다.</font>');
                	$("#sendBtn").removeAttr("disabled");
                } else {
                	$(".result .msg").html('<font style="font-size: 13px; color: #2f29fc">존재하지 않는 아이디입니다.</font>');
                	$("#sendBtn").attr("disabled", "disabled");
                }
            }
        });
    });

