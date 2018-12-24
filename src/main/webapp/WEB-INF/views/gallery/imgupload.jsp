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
	#space{
		margin-bottom: 3%;
	}


.file-area {
    width: 100%;
    position: relative;
    font-size: 12px;
}
input[type=file] {
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
				var html ="<div class=fileName>"+fileInfo.fileName;
				html +="<small data-src='{{fullName}}' style='cursor: pointer'>X</small><br>";	
				html +="<input type='hidden' name='file' value ='"+fileInfo.fullName+"'></div>";
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
				var html ="<div class=fileName>"+fileInfo.fileName;
					html +="<small data-src='{{fullName}}' style='cursor: pointer'>X</small><br>";	
					html +="<input type='hidden' name='file' value ='"+fileInfo.fullName+"'></div>";
					$(".file-dummy").append(html);
				
			}
		});
	});
	
	$(".file-dummy").on("click", "small", function(event){
		
		$.ajax({
			url: "${pageContext.request.contextPath}/gallery/delete",
			type: "post",
			data: {fileName: $(this).attr("data-src")},
			dataType: "text",
			success: function(result) {
				
				if (result == "deleted") {
					alert("삭제 완료");
					
					$(".fileName").remove();
				}
			}
 		})
	})

});
</script>
<!-- image upload -->
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/upload.js"></script>


</head>

<body>
<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
	<h4>사진 업로드</h4>
	<form action="">
	<div id="space">
		<select name="GB_Privacy">
			<option value="N" selected="selected">친구공개</option>
			<option value="Y">미공개</option>
		</select>
	</div>
	
	<div class="w3-col m3" id="space">ID</div>
	<div class="w3-col m9" id="space"><input type="text" name="MB_ID"></div>
	<div class="w3-col m3" id="space">제목</div>
	<div class="w3-col m9" id="space"><input type="text" name="GB_Subject"></div>
	<div class="w3-col m3" id="space">내용</div>
	<textarea rows="5" cols="40" class="w3-col m9" id="space" name="GB_Content"></textarea>
	<div>File Drop & Click Zone</div>
	<input type="file">
	<div class="file-area w3-col m12" >
	    <div class="file-dummy" id="space">
	       
	    </div>
	</div>
	</form>
</div>

</body>
</html>