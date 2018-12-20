package com.team.chatController;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team.chatInterface.MemberVO;

@Controller
public class HomeController{
	/*@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView login(MemberVO vo, @CookieValue(value="REMEMBER", required=false) Cookie rememberCookie) throws Exception {
		if (rememberCookie != null) {
			vo.setMem_id(rememberCookie.getValue());
		}
		ModelAndView mv = new ModelAndView("member/login");
		return mv;
	}*/
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model) {
		return "main";
	}	
	
	@RequestMapping("list")
	public String list(Model model) {
		return "gallery/list";
	}
	
}
