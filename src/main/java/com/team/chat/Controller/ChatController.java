package com.team.chat.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	@RequestMapping(value="chat", method=RequestMethod.GET)
	public String chat() {
		return "chat/chat";
	}
	@RequestMapping(value="multiChat", method=RequestMethod.GET)
	public String multiChat() {
		return "chat/multiChat";
	}
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public String infoChat() {
		return "chat/chat";
	}
}
