package com.team.message.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.message.Service.MessageService;
import com.team.message.VO.MessageVO;

@Controller
public class MessageController {
	
	@Inject
	MessageService messageService;
	
	@RequestMapping(value="/messageList", method=RequestMethod.GET)
	public String messageList(Model model)throws Exception{
		List<MessageVO> list = messageService.listAll();
		return "tiles";
	}
	@RequestMapping(value="/messageSend", method=RequestMethod.GET)
	public String messageSend(){
		return "message/messageSend";
	}
	@RequestMapping(value="messageSendOk", method=RequestMethod.POST)
	public String messageSendOk(@ModelAttribute MessageVO mvo)throws Exception{
		messageService.create(mvo);
		return "redirect:messageList";
	}
	@RequestMapping(value="messageView", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int MESSAGE_NO, HttpSession session)throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageView");
		mav.addObject("mdto", messageService.read(MESSAGE_NO));
		return mav;
	}
	@RequestMapping("messageDelete")
	public String delete(@RequestParam int MESSAGE_NO)throws Exception{
		messageService.delete(MESSAGE_NO);
		return "redirect:messageList";
	}
}
