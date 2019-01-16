package com.team.recomment.Controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.gallery.Service.GBService;
import com.team.gallery.util.IPUtill;
import com.team.member.VO.MemberVO;
import com.team.recomment.Service.RCService;
import com.team.recomment.VO.RecommentVO;

@Controller
public class RecommentController {

	@Autowired
	private RCService rcService;
	
	@RequestMapping(value = "{gb_Num}/reComment")
	@ResponseBody
	public List<RecommentVO> serchRecomment(@PathVariable String gb_Num) {
			
		List<RecommentVO> revo = rcService.serchRecomment(Integer.parseInt(gb_Num));
		
		return revo;
	}
	
	@RequestMapping("{MB_ID}/recommentWrite")
	public void recommentWrite(@ModelAttribute RecommentVO revo, HttpServletRequest request) throws Exception{
		
		revo.setCM_IP(IPUtill.getClientIpAddr(request));
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		
		revo.setCM_Date(ts);
		
		int num = revo.getGB_Num();

		rcService.recommentWrite(revo);
		
	}
	

	
}
