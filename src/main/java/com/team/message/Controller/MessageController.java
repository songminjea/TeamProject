package com.team.message.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.member.VO.MemberVO;
import com.team.message.Service.MessageService;
import com.team.message.VO.MessageSearchVO;
import com.team.message.VO.MessageVO;
import com.team.message.VO.MessagePageMaker;

@Controller
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	@Inject
	public MessageController(MessageService messageService) {
		this.messageService = messageService;
	}
		
	//쪽지 전체 목록
	@RequestMapping(value="{id}/messageList", method=RequestMethod.GET)
	public String messageList(@PathVariable String id, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		model.addAttribute("profile", memberVO);
		
		int count = messageService.countList(memberVO);
		model.addAttribute("messageCount", count);
		
		List<MessageVO>mlist = messageService.listAll();		
		model.addAttribute("mlist", mlist);
		
		return "main.jsp?center=message/messageList";
	}
	
	//검색
	@RequestMapping(value="{id}/messageList", method=RequestMethod.POST)
	public String messageSearch(@ModelAttribute("messageSearchVO")MessageSearchVO messageSearchVO, 
								 @PathVariable String id, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		model.addAttribute("profile", memberVO);
		
		int count = messageService.countList(memberVO);
		model.addAttribute("messageCount", count);
		
		MessagePageMaker messagePageMaker = new MessagePageMaker();
		messagePageMaker.setCri(messageSearchVO);
		messagePageMaker.setTotalCount(messageService.countSearchedArticles(messageSearchVO));
		
		model.addAttribute("mlist", messageService.listSearch(messageSearchVO));
		model.addAttribute("messagePageMaker", messagePageMaker);
		
		return "main.jsp?center=message/messageList";
	}
		
	//내가 보낸 쪽지
	@RequestMapping(value="{id}/messageSendList", method=RequestMethod.GET)
	public String messageSendList(@PathVariable String id, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		model.addAttribute("profile", memberVO);
		
		int count = messageService.countList(memberVO);
		model.addAttribute("messageCount", count);
		
		List<MessageVO>mslist = messageService.sendListAll();
		model.addAttribute("mslist", mslist);
		
		return "main.jsp?center=message/messageSendList";
	}
	
	//쪽지 작성
	@RequestMapping(value="{id}/messageSend", method=RequestMethod.GET)
	public String messageSend(MessageVO mvo, Model model) {		
		return "message/messageSend";
	}
	
	//쪽지 보낼 때 아이디 여부 체크
	@ResponseBody
	@RequestMapping(value="{id}/messageIdCheck", method=RequestMethod.POST)	
	public String messageIdCheck(@RequestParam("MESSAGE_RECEIVER") String MESSAGE_RECEIVER) throws Exception{
		
		String str = "";
		int idcheck = messageService.messageIdCheck(MESSAGE_RECEIVER);
		//상대방의 계정이 존재할 경우 
		if (idcheck == 1) {
			str = "YES";
		}else {
			str = "NO";
		}
		
		return str;
	}
	
	//쪽지 보내기
	@RequestMapping(value="{id}/messageSend", method=RequestMethod.POST)
	public String messageSendOk(MessageVO mvo, Model model)throws Exception{
		
		messageService.create(mvo);
		
		return "message/messageSendOk";
	}
	
	//쪽지 답장
	@RequestMapping(value="{id}/messageResend", method=RequestMethod.GET)
	public String messageResend(@ModelAttribute("MessageVO")MessageVO mvo, Model model, HttpSession session, HttpServletRequest request)throws Exception{
		int MESSAGE_NO = Integer.parseInt(request.getParameter("MESSAGE_NO"));
		mvo.setMESSAGE_NO(MESSAGE_NO);
		MessageVO resultVO = messageService.read(mvo);
		messageService.updateRead(MESSAGE_NO);
		model.addAttribute("mdto", resultVO);
		return "message/messageResend";
	}
	
	//쪽지 답장 보내기
		@RequestMapping(value="{id}/messageResend", method=RequestMethod.POST)
		public String messageResendOk(MessageVO mvo, Model model)throws Exception{
			
			messageService.create(mvo);
			
			return "message/messageSendOk";
		}
	
	//쪽지 상세내용 조회
	//쪽지 조회시 읽음으로 변경되고, 읽은 날짜가 변경된다.(이후 변경되지는 않음)
	@RequestMapping(value="{id}/messageView", method=RequestMethod.GET)
	public String messageView(@RequestParam("MESSAGE_NO") int MESSAGE_NO,
							   @ModelAttribute("MessageVO")MessageVO mvo, 
							   Model model, HttpServletRequest request)throws Exception{
		
		mvo.setMESSAGE_NO(MESSAGE_NO);
		MessageVO resultVO = messageService.read(mvo);

		messageService.updateRead(MESSAGE_NO);
		
		model.addAttribute("mdto", resultVO);
		
		return "message/messageView";
	}

	//내가 보낸 쪽지 상세내용 조회
	@RequestMapping(value="{id}/messageSendView", method=RequestMethod.GET)
	public String messageSendView(@ModelAttribute("MessageVO")MessageVO mvo, Model model, HttpServletRequest request)throws Exception{
		int MESSAGE_NO = Integer.parseInt(request.getParameter("MESSAGE_NO"));
		mvo.setMESSAGE_NO(MESSAGE_NO);
		MessageVO resultVO = messageService.sendRead(mvo);
		model.addAttribute("msdto", resultVO);
		return "message/messageSendView";
	}

	//쪽지 삭제
	@RequestMapping(value="{id}/messageDelete")
	public String messageDelete(@RequestParam("MESSAGE_NO") int MESSAGE_NO,
								MessageSearchVO messageSearchVO,
								RedirectAttributes redirectAttributes)throws Exception{
		
		messageService.delete(MESSAGE_NO);
		
		redirectAttributes.addAttribute("page", messageSearchVO.getPage());
		redirectAttributes.addAttribute("perPageNum", messageSearchVO.getPerPageNum());
		redirectAttributes.addAttribute("searchType", messageSearchVO.getSearchType());
		redirectAttributes.addAttribute("keyword", messageSearchVO.getKeyword());
		
		return "redirect:messageList";
	}
	
}
