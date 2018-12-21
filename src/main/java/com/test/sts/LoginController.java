package com.test.sts;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("loginDTO")
public class LoginController {
	@Autowired
	LoginService loginService;
	
	@RequestMapping("/signUp")
	public void insertMember(Model model) {
		model.addAttribute("loginDTO",new LoginDTO());
	}
	
	//회원가입 DB작업
	@RequestMapping("/SignOk")
	public String insertOk(@Valid LoginDTO loginDTO, BindingResult result) {
		if(result.hasErrors()) { 
			System.out.println("회원가입시 오류가 발생했습니다.");		
			return "signUp";
		}else {
			//에러가 없으면 DB에 작성한 내용 insert
			loginService.insertMember(loginDTO);
			return "joinOk";
		}
	}
}
