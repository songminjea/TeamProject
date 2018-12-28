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

	

.file-click{
    width: 100%;
    position: relative;
}

.file-click input[type=file] {
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
.view{
	height : 80px;
}

.mailbox-attachment-info{
	width: 150px;
}

	
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.7/handlebars.min.js"></script>
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
				printFiles(data);
				$(".noAttach").remove();
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
				printFiles(data);
				$(".noAttach").remove();
			}
		});
	});
	
	$(".uploadedFileList").on("click",".delBtn", function(e) {
		e.preventDefault();
		var that = $(this);
		$.ajax({
			type : "POST",
			url :"${pageContext.request.contextPath}/gallery/delete",
			data : {fileName: that.attr("href")},
			datatype : "text",
			success : function(result){
				if(result == "DELETED"){
					alert("삭제되었습니다.");
					that.parents("li").remove();
				}
			}
		});
		
	});	

	
});

</script>

<!-- 핸들바 기능 -->
<script id ="fileTemplate" type="text/x-handlebars-template">
	<li>
		<img src="{{imgSrc}}" alt = "Attachment" class ="view">
		<input type="hidden" name = "gb_Image" value ="{{fullName}}">
		<div class = "mailbox-attachment-info">
			<a href ="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class = "fa fa-paperclip"></i>{{originalFileName}}
			</a>
			<a href="{{fullName}}" class = "btn btn-default btn-xs pull-right delBtn">
				<i class="fa fa-fw fa-remove"></i>
			</a>
		</div>
	</li>
</script>


<!-- image upload -->
<script type="text/javascript" src = "${pageContext.request.contextPath}/resources/js/upload.js"></script>


</head>

<body>
<div class="w3-container w3-card w3-white w3-round w3-margin"><br>
	<h4>사진 업로드</h4>
	<form role = "form" method = "post" action="galleryWrite">
	<div id="space">
		<select name="gb_Privacy">
			<option value="N" selected="selected">친구공개</option>
			<option value="Y">미공개</option>
		</select>
	</div>
	
	<div class="w3-col m3" id="space">ID</div>
	<div class="w3-col m9" id="space"><input type="text" name="mb_ID"></div>
	<div class="w3-col m3" id="space">내용</div>
	<textarea rows="5" cols="40" class="w3-col m9" id="space" name="gb_Content"></textarea>
	<div>
		<span class="file-click">Click & Drag Zone
			<input type="file">
		</span>
	</div>
	<div class="file-area w3-col m12" >
	    <div class="file-dummy" id="space">
	       <div class = "box-footer">
	       		<ul class = "mailbox-attachments clearfix uploadedFileList"></ul>	       
	       </div>
	    </div>
	</div>
	<div id ="space">
		<input type ="submit" value="등록">
		<input type ="reset" value="다시작성">
	</div>
	</form>
</div>

</body>



</html>