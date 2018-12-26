package com.team.message.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//쪽지 전체 목록 
	@RequestMapping(value="messageList", method=RequestMethod.GET)
	public ModelAndView messageList()throws Exception{
		List<MessageVO>list = messageService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageList");
		mav.addObject("list", list);
		return mav;
	}
	//쪽지 작성
	@RequestMapping(value="messageSend", method=RequestMethod.GET)
	public String messageSend(MessageVO mvo, Model model){	
		return "message/messageSend";
	}
	//쪽지 보내기
	@RequestMapping(value="messageSend", method=RequestMethod.POST)
	public String messageSendOk(MessageVO mvo, Model model)throws Exception{
		messageService.create(mvo);
		return "redirect:messageList";
	}
	//쪽지 상세 내용 조회
	@RequestMapping(value="messageView", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int MESSAGE_NO, HttpSession session)throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageView");
		mav.addObject("mdto", messageService.read(MESSAGE_NO));
		return mav;
	}
	@RequestMapping("messageDelete")
	public String delete(int MESSAGE_NO)throws Exception{
		messageService.delete(MESSAGE_NO);
		return "redirect:messageList";
	}
}
