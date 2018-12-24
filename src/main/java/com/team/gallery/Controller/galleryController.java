package com.team.gallery.Controller;

import java.io.File;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.team.gallery.util.UploadUtil;


@Controller
public class galleryController {
	
	private static final Logger logger = LoggerFactory.getLogger(galleryController.class);
	
	@RequestMapping(value = "imgupload", method=RequestMethod.GET)
	public String imgupload() {
		
		return "main.jsp?center=gallery/imgupload";
	}
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@ResponseBody
	@RequestMapping(value="/gallery/imgupload", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public ResponseEntity<String> imgupload(MultipartFile file) throws Exception{
		logger.info("originalName : "+file.getOriginalFilename());
		logger.info("size: " +file.getSize());
		logger.info("contentType : " +file.getContentType());
		
		return new ResponseEntity<String>(UploadUtil.UploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "gallery/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteImage (String imageName) {
		logger.info("delete file : " + imageName); 
		
		new File(uploadPath + imageName.replace('/', File.separatorChar)).delete();
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
}
