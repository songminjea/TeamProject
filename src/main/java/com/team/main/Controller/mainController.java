package com.team.main.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.member.VO.MemberVO;

@Controller
public class mainController {

	@RequestMapping(value = "main", method = {RequestMethod.POST, RequestMethod.GET})
	public String main(HttpSession session, Model model){
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getID();
		
		model.addAttribute("profile", memberVO);
		model.addAttribute("pageid", id);
		model.addAttribute("isMyGall", true);
		
		return "main.jsp?center=gallery/list";
	}
	
}
