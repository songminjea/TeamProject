<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- image upload -->

<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/upload.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.fileDrop{
		height : 70px;
		border: 2px dotted gray;
	}
	small{
		margin-left : 3px;
		font-weight: bold;
	}
</style>
<script  src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	$(".fileDrop").on("dragenter dragover",function(e){
		e.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files;
		var file = files[0];
		console.log(file);
		var formData = new FormData();
				
		formData.append("file",file);
		
		console.log(formData);
		
		$.ajax({
			type : "POST",
			url :"${path}/gallery/imgupload",
			data : formData,
			datatype: "text",
			prodcessData : false,
			contentType : false,
			success : function(data){
				console.log(data);
				var fileInfo = getFileInfo(data);
				var html ="<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
				html +="<input type='hidden' class='file' value ='"+fileInfo.fullName+"'>";
				$(".uploadedList").append(html);
				
			}
		});
	});
});
</script>



</head>

<body>
<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
	첨부파일 등록
	<div class="fileDrop">
		
	</div>
	
	<div class="uploadedList"></div>
</div>
</body>
</html>