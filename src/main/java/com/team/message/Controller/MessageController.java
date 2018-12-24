package com.team.message.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.login.DTO.LoginDTO;
import com.team.message.Service.MessageService;
import com.team.message.VO.MessageVO;

@Controller
public class MessageController {
	
	@Inject
	MessageService messageService;
	
	@RequestMapping(value="/messageList", method=RequestMethod.GET)
	public ModelAndView messageList(@ModelAttribute("ldto") LoginDTO ldto)throws Exception{
		String re_id = ldto.getID();
		List<MessageVO> list = messageService.listAll(re_id);
		int count = messageService.countArticle(re_id);
		ModelAndView mav = new ModelAndView();
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("re_id", re_id);
		mav.addObject("map", map);
		mav.setViewName("message/messageList");
		return mav;
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
