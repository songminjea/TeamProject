
function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	
	return fileName.match(pattern);
}

function getFileInfo(fullName){
	var fileName,imgsrc,getLink,fileLink;
	if(checkImageType(fullName)){
		imgsrc="/TeamPro/imgupload/displayFile?fileName="+fullName;
		console.log(fileLink);
		var front = fullName.substr(0,12);
		console.log(front);
		var end = fullName.substr(14);
		console.log(end);
		getLink = "/TeamPro/imgupload/displayFile?fileName="+front+end;
	}else{
		fileLink = fullName.substr(12);
		console.log(fileLink);
		getLink ="/TeamPro/imgupload/displayFile?fileName="+fullName;
		console.log(getLink);
	}
	fileName =fullName.substr(fullName.indexOf('_')+1);
	console.log(fileName);
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink,fullName:fullName};
}
