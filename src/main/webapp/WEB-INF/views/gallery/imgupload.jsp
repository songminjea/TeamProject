<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.fileDrop{
		height : 100px;
		border: 2px dotted gray;
	}
	small{
		margin-left : 3px;
		font-weight: bold;
	}


.file-area {
    width: 100%;
    position: relative;
    font-size: 12px;
}
.file-area input[type=file] {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    opacity: 0;
    cursor: pointer;
}
.file-area .file-dummy {
    width: 100%;
    padding: 20px 10px;
    border: 2px dashed #ccc;
    background-color: #fff;
    text-align: left;
    transition: background 0.3s ease-in-out;
}

	
</style>
<script  src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$(".file-area").on("dragenter dragover",function(e){
		e.preventDefault();
	});
	
	$('input[type="file"]').on('change', function(e){
		e.preventDefault();
		
		var file = e.target.files[0];
		console.log(file);
		var formData = new FormData();
				
		formData.append("file",file);
		
		console.log(formData);
		
		$.ajax({
			type : "POST",
			url :"${pageContext.request.contextPath}/gallery/imgupload",
			data : formData,
			datatype: "text",
			contentType: false,
			processData: false,
			success : function(data){
				console.log(data);
				var fileInfo = getFileInfo(data);
				var html ="<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
				html +="<input type='hidden' name='file' value ='"+fileInfo.fullName+"'>";
				$(".file-dummy").append(html);
				
			}
		});
	});
	
	$(".file-area").on("drop", function(e){
		e.preventDefault();
		
		var files = e.originalEvent.dataTransfer.files;
		var file = files[0];
		console.log(file);
		var formData = new FormData();
				
		formData.append("file",file);
		
		console.log(formData);
		
		$.ajax({
			type : "POST",
			url :"${pageContext.request.contextPath}/gallery/imgupload",
			data : formData,
			datatype: "text",
			contentType: false,
			processData: false,
			success : function(data){
				console.log(data);
				var fileInfo = getFileInfo(data);
				var html ="<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
				html +="<input type='hidden' name='file' value ='"+fileInfo.fullName+"'>";
				html +="<input type=''"
				$(".file-dummy").append(html);
				
			}
		});
	});

});
</script>
<!-- image upload -->
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/upload.js"></script>


</head>

<body>
<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
	<h4>사진 업로드방</h4>

	<div class="file-area">
    	<input type="file">
	    <div class="file-dummy">
	        
	    </div>
	</div>
</div>

</body>
</html>