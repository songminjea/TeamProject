package com.team.main.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mainController {

	@RequestMapping(value = "main", method = {RequestMethod.POST, RequestMethod.GET})
	public String main(Model model){
		return "main";
	}
	
}
