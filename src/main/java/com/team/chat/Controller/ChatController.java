package com.team.chat.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

import com.team.chat.Service.ChatService;
import com.team.chat.VO.ChatSearchVO;
import com.team.chat.VO.ChatVO;
import com.team.member.Service.MemberServiceImpl;
import com.team.member.VO.MemberVO;
import com.team.message.Service.MessageService;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	MessageService messageService;
	
	@Inject
	public ChatController(ChatService chatService) {
		this.chatService = chatService;
	}
	
	//채팅 리스트
	@RequestMapping(value="{id}/multiChatList", method=RequestMethod.GET)
	public String multiChatList(@PathVariable String id, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");			
		model.addAttribute("profile", memberVO);
			
		return "chat/chat-ing";
	}
	
	//채팅할 사람 검색
	@RequestMapping(value="{id}/chatSearch", method=RequestMethod.GET)
	public String chatSearch(@PathVariable String id, HttpSession session, Model model, HttpServletRequest request)throws Exception{
		// uri 에서 id/~~~ 에서 ~~~ 값을 뽑아내는 부분
			String uri = request.getRequestURI();
			String type = "";
			Pattern pattern = Pattern.compile("(?<=" + id + "\\/)\\w+");
			Matcher data = pattern.matcher(uri);
			if (data.find()) {
				type = data.group();
			}
				/// ---------
				
				// id에 해당하는 프로필을 가져온다. 
				// MemberInterceptor에서 처리 한 후 가져오는것.
			MemberVO memberVo = (MemberVO)request.getAttribute("vo");
			model.addAttribute("profile",memberVo);
			model.addAttribute("type", type); // 팔로우 페이지인지 팔로잉 페이지인지
			model.addAttribute("page_id", id); // 보여줄 페이지의 아이디값
		
		
		/*MemberVO memberVO = (MemberVO) session.getAttribute("member");			
		model.addAttribute("profile", memberVO);	
		
		int count = messageService.countList(memberVO);
		model.addAttribute("messageCount", count);*/
		
		return "chat/chatSearch";
	}
	
	//검색 결과
	/*@RequestMapping(value="{id}/chatSearch", method=RequestMethod.POST)
	public List<Map<String, String>> chatSearch(@PathVariable String id, HttpServletRequest request, 
								  @ModelAttribute("ChatSearchVO")ChatSearchVO chatSearchVO, 
								  HttpSession session, Model model,
								  Map<String, String>searchInfo){

			List<MemberVO>member = chatService.listAll(searchInfo);
			
			MemberVO memberVO = (MemberVO) session.getAttribute("member");			
			model.addAttribute("profile", memberVO);
			
			List<Map<String, String>> searchInfoList = new ArrayList<>();
			
			for(MemberVO temp:member) {
				Map<String, String> tempMap = new HashMap<>();
				
				if (memberVO != null) {
					// temp의 ID가 로그인된 ID와 같으면 무시한다.
					if (memberVO.getID().equals(temp.getID()))
						continue;
				}
				if(temp.getPIC() == null || temp.getPIC().equals("")) {
					temp.setPIC("/resources/img/baby.jpg");
				}
				
				tempMap.put("sMem_id", temp.getID());
				tempMap.put("sMem_pic", temp.getPIC());
				tempMap.put("sMem_name", temp.getNAME());
				searchInfoList.add(tempMap);
			
			}
			return searchInfoList;
		}*/
	
	//채팅 접속
	@RequestMapping(value="{id}/multiChat", method=RequestMethod.GET)
	public String multiChat(@PathVariable String id, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		model.addAttribute("profile", memberVO);
		
		return "chat/multiChat";
	}
	
	//채팅 메세지 보내기
	@ResponseBody
	@RequestMapping(value="{id}/multiChat", method = RequestMethod.POST)
	public void chatSend(ChatVO cvo, Model model, HttpServletRequest request)throws Exception{
		
		chatService.chatSend(cvo);

		String CHAT_SENDCONTENT = request.getParameter("CHAT_SENDCONTENT");
		cvo.setCHAT_SENDCONTENT(CHAT_SENDCONTENT);
		ChatVO resultVO = chatService.sendRead(cvo);
		model.addAttribute("cvo", resultVO);
	}

}
