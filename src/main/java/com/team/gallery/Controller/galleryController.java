package com.team.gallery.Controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.gallery.Service.GBService;
import com.team.gallery.VO.fileVO;
import com.team.gallery.VO.galleryVO;
import com.team.gallery.util.IPUtill;
import com.team.gallery.util.UploadUtil;
import com.team.member.Service.MemberServiceImpl;
import com.team.member.VO.MemberVO;


@Controller
public class galleryController {
	
	
	@Autowired
	private GBService gbService;
		
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping(value = "gallWrite", method=RequestMethod.GET)
	public String imgupload(HttpSession session, Model model) {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		model.addAttribute("profile", memberVO);
		
		return "main.jsp?center=gallery/gallWrite";
	}
	
	@RequestMapping("/galleryWrite")
	public String galleryWrite(@ModelAttribute galleryVO gvo,fileVO fvo, RedirectAttributes ra, HttpServletRequest request) throws Exception {
		
				
		gvo.setGb_IP(IPUtill.getClientIpAddr(request));
		
		gbService.insert(gvo);
		
		int Num = gbService.maxNum(gvo);
		
		if(fvo.getGb_Image() != null) {
			fvo.setGb_Num(Num);			
			gbService.FileInsert(fvo);
		}
		
		ra.addFlashAttribute("msg", "success");
		
		return "redirect:main";
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
	
	
	
	
	// 갤러리 접근 처리.
	@RequestMapping(value = "{id}/gallery")
	public String ShowGallery(@PathVariable String id, Model model, HttpServletRequest request) {
		//System.out.println("ShowGallery 호출");
		
		// id에 해당하는 프로필을 가져온다. 
		// MemberInterceptor에서 처리 한 후 가져오는것.
		MemberVO memberVo = (MemberVO)request.getAttribute("vo");
		model.addAttribute("profile",memberVo);
		model.addAttribute("isMyGall" , false);
		model.addAttribute("pageid", id);
		
		return "main.jsp?center=gallery/list";
	}
	
	
	public List<Map<String, Object>> ShowGallery(@RequestBody Map<String, String> galleryInfo, int type)
			throws Exception {
		// 맵은 <id, pageNum> 로 구성
		// 어떤 ID가 쓴 글인지, 스크롤링 페이지가 몇번째인지
		

		// 글 8개씩 불러옴.
		String pageNum = String.valueOf(Integer.parseInt(galleryInfo.get("pageNum")) * 8);
		galleryInfo.put("pageNum", pageNum);

		// 갤러리 정보 가져온다.
		List<galleryVO> gall;
		if(type == 0) {
			gall = gbService.GetSpecGalleryList(galleryInfo);
		}else {
			gall = gbService.GetMyGalleryList(galleryInfo);
		}

		// 리턴해줄 맵 생성
		List<Map<String, Object>> galleryInfoList = new ArrayList<>();

		for (galleryVO gtemp : gall) {
			Map<String, Object> temp = new HashMap<>();

			List<galleryVO> file = gbService.GetImgList(gtemp.getGb_Num());

			MemberVO memVO = memberService.getMember(gtemp.getMb_ID());
			// 글 정보
			temp.put("gallery", gtemp);
			// 해당 글의 이미지 파일 정보 리스트
			temp.put("file", file);
			// 갤러리 글 ID의 정보
			temp.put("memVO", memVO);
			
			
			galleryInfoList.add(temp);

		}
		
		

		return galleryInfoList;
	}
	
	// 특정 사용자가 쓴 글을 가져온다.
	@RequestMapping(value = "/getSpecGallery")
	@ResponseBody
	public List<Map<String, Object>> GetSpecGallery(@RequestBody Map<String, String> galleryInfo, Model model) throws Exception {
		// Map<String, String> galleryInfo 은 (id, pageNum)로 구성 
		return ShowGallery(galleryInfo, 0);
	}
	
	// 내가 팔로우 한 사람들의 글을 가져옴.
	@RequestMapping(value = "/getMyGallery")
	@ResponseBody
	public List<Map<String, Object>> GetMyGallery(@RequestBody Map<String, String> galleryInfo, Model model) throws Exception {
		return ShowGallery(galleryInfo, 1);
	}
}
