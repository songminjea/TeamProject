package com.team.gallery.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.gallery.Service.GBService;
import com.team.gallery.VO.galleryVO;
import com.team.gallery.util.IPUtill;
import com.team.gallery.util.UploadUtil;


@Controller
public class galleryController {
	
	private static final Logger logger = LoggerFactory.getLogger(galleryController.class);
	
	@Autowired
	private GBService gbService;
	
	
	@RequestMapping(value = "imgupload", method=RequestMethod.GET)
	public String imgupload() {
		
		return "main.jsp?center=gallery/imgupload";
	}
	
	@RequestMapping("/galleryWrite")
	public String galleryWrite(galleryVO gvo, RedirectAttributes ra, HttpServletRequest request) throws Exception {
		
		gvo.setGb_IP(IPUtill.getClientIpAddr(request));
		
		gbService.insert(gvo);
		
		ra.addFlashAttribute("msg", "success");
		
		return null;
	}
	

	
	
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@ResponseBody
	@RequestMapping(value="gallery/imgupload", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public ResponseEntity<String> imgupload(MultipartFile file, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		
		
		try {
			String saveFilePath = UploadUtil.uplaodFile(file, request);
			entity = new ResponseEntity<>(saveFilePath,HttpStatus.CREATED);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value ="/display", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName,HttpServletRequest request) throws Exception{
		
		HttpHeaders header = UploadUtil.getHttpHeaders(fileName);
		String rootPath = UploadUtil.getRootPath(fileName, request);
		
				
		ResponseEntity<byte[]> entity = null;
		
		try (InputStream is = new FileInputStream(rootPath+fileName)){
			entity = new ResponseEntity<>(IOUtils.toByteArray(is),header,HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "gallery/delete", method = RequestMethod.POST)
	public ResponseEntity<String> deleteImage (String fileName, HttpServletRequest request) {
		
				
		ResponseEntity<String> entity = null;
		
		try {
			UploadUtil.deleteFile(fileName, request);
			entity = new ResponseEntity<>("DELETED",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
