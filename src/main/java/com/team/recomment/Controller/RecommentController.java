package com.team.recomment.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.gallery.Service.GBService;
import com.team.recomment.Service.RCService;
import com.team.recomment.VO.RecommentVO;

@Controller
public class RecommentController {

	@Autowired
	private RCService rcService;
	
	@RequestMapping(value = "{gb_Num}/reComment")
	@ResponseBody
	public List<RecommentVO> serchRecomment(@PathVariable String gb_Num, Model model, HttpServletRequest request ) {
		
		List<RecommentVO> revo = rcService.serchRecomment(Integer.parseInt(gb_Num));
		
		return revo;
	}
	

	
}
