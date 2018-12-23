package com.team.message.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {
	@RequestMapping(value="/messageList", method=RequestMethod.GET)
	public String messageList(Model model) {
		return "tiles";
	}
	@RequestMapping(value="/messageSend", method=RequestMethod.GET)
	public String messageSend(Model model)throws Exception{
		return "message/messageSend";
	}
	@RequestMapping(value="messageSendOk", method=RequestMethod.POST)
	public String messageSendOk(Model model)throws Exception{
		return "message/messageSendOk";
	}
}
