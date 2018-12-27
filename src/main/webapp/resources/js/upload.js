


var fileTemplate = Handlebars.compile($("#fileTemplate").html());

function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName){
	//원본파일, 이미지경로, 원본파일경로,저장파일명 변수 선언
	var originalFileName,imgSrc,originalFileUrl,uuidFileName;
	
	if(checkImageType(fullName)){
		imgSrc="display?fileName="+fullName;
		uuidFileName = fullName.substr(14);
		var originalImg = fullName.substr(0,12)+fullName.substr(14);
		
		//원본이미지 링크
		originalFileUrl = "display?fileName="+originalImg;
		
	}else{
		imgSrc ="/resources/upload/files/file-icon.png"	//파일 아이콘 이미지 링크
		uuidFileName = fullName.substr(12);
		
		originalFileUrl = "display?fileName="+fullName;
			
	}
	originalFileName = uuidFileName.substr(uuidFileName.indexOf("_")+1);
	return {originalFileName:originalFileName, imgSrc:imgSrc, originalFileUrl:originalFileUrl,fullName:fullName};
}

function printFiles(data){
	
	var fileInfo = getFileInfo(data);
	
	var html = fileTemplate(fileInfo);
	
	$(".uploadedFileList").append(html);
	
	if(fileInfo.fullName.substr(12,2) == "s_"){
		
		//마지막에 추가된 첨부파일 템플릿 선택자
		var that =$(".uploadedFileList li").last();
		
		
		//파일 아이콘에서 이미지 아이콘으로 변경
		that.find(".fa-paperclip").attr("class","fa fa-camera");
	}
}