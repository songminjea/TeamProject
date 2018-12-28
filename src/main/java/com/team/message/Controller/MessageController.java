package com.team.message.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.message.Service.MessageService;
import com.team.message.VO.MessageVO;

@Controller
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	//쪽지 전체 목록
	@RequestMapping(value="messageList", method=RequestMethod.GET)
	public String messageList(Model model)throws Exception{
		List<MessageVO>mlist = messageService.listAll();
		model.addAttribute("mlist", mlist);
		return "message/messageList";
	}
	
	//쪽지 작성
	@RequestMapping(value="messageSend", method=RequestMethod.GET)
	public String messageSend(MessageVO mvo, Model model) {
		return "message/messageSend";
	}
	
	//쪽지 보내기
	@RequestMapping(value="messageSend", method=RequestMethod.POST)
	public String messageSendOk(MessageVO mvo, Model model)throws Exception{
		messageService.create(mvo);
		return "message/messageSendOk";
	}
	
	//쪽지 상세내용 조회
	@RequestMapping(value="messageView", method=RequestMethod.GET)
	public String messageView(@ModelAttribute("MessageVO")MessageVO mvo, Model model, HttpServletRequest request)throws Exception{
		int MESSAGE_NO = Integer.parseInt(request.getParameter("MESSAGE_NO"));
		mvo.setMESSAGE_NO(MESSAGE_NO);
		MessageVO resultVO = messageService.read(mvo);
		model.addAttribute("mdto", resultVO);
		return "message/messageView";
	}
	
	//쪽지 조회시 읽음으로 변경되고, 읽은 날짜가 변경된다.(이후 변경되지는 않음)
	
	//쪽지 삭제
	@RequestMapping(value="messageDelete")
	public String messageDelete(@RequestParam int MESSAGE_NO)throws Exception{
		messageService.delete(MESSAGE_NO);
		return "redirect:messageList";
	}
	
}
