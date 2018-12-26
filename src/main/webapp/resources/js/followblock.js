function getContextPath() { // ContextPath 얻어오는 함수

		var hostIndex = location.href.indexOf( location.host ) + location.host.length;

		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );

	}

$(function() {

	$('#follower_Btn').on("click", function() {
		var id = $('#follower_Btn').val()
		url = getContextPath() + "/" + id + "/follower/";
		location.href = url;
		

	});

	$('#following_Btn').on("click", function() {
		var id = $('#following_Btn').val()
		url = getContextPath() + "/" + id + "/following/";
		location.href = url;
	});

});