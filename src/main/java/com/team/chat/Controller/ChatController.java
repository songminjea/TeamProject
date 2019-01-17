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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.chat.Service.ChatService;
import com.team.chat.VO.ChatVO;
import com.team.chat.VO.ChatroomVO;
import com.team.follow.Service.FollowService;
import com.team.follow.VO.FollowVO;
import com.team.member.Service.MemberServiceImpl;
import com.team.member.VO.MemberVO;
import com.team.message.Service.MessageService;

@Controller
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	MessageService messageService;
	
	@Inject
	public ChatController(ChatService chatService) {
		this.chatService = chatService;
	}
	
	//채팅 리스트
	@RequestMapping(value="{id}/chatList", method=RequestMethod.GET)
	public String multiChatList(@PathVariable String id, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");			
		model.addAttribute("profile", memberVO);
		
		List<ChatroomVO>clist = chatService.listAll(memberVO);
		model.addAttribute("clist", clist);
		
		return "chat/chatList";
	}
	
	// 팔로우 목록 페이지 요청 처리
	@RequestMapping(value = { "{id}/chatFollower", "{id}/chatFollowing"})
	public String ShowChatFollowList(@PathVariable String id, Model model, HttpServletRequest request, HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");			
		model.addAttribute("me", memberVO);
		
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

		return "chat/chatSearch";
	}
	
	// 팔로워 목록
	@RequestMapping(value = "/getChatFollowerList", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getFollowerList(@RequestBody Map<String, String> FollowInfo) {
		return getFollowList(FollowInfo,0);
	}

	// 팔로잉 목록
	@RequestMapping(value = "/getChatFollowingList", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getFollowingList(@RequestBody Map<String, String> FollowInfo) {
		return getFollowList(FollowInfo,1);
	}

	public List<Map<String, Object>> getFollowList(Map<String, String> FollowInfo, int Type) {
		// map(my_id로그인 아이디, id페이지 아이디, pageNum페이지 번호), 
		// Type = 0일때 follower 목록 / 1일때 following 목록
	
	
		// 페이지 번호에 10 곱해서 저장. (0, 10, 20 단위 글 보려고)
		int pageNum = Integer.parseInt(FollowInfo.get("pageNum")) * 10;
		FollowInfo.put("pageNum", String.valueOf(pageNum));
		
		// 팔로우 목록 담을 리스트
		List<FollowVO> follow;
		
		if(Type == 0)
		follow = followService.GetAllFollower(FollowInfo);
		else
		follow = followService.GetAllFollowing(FollowInfo);
		
		// 팔로워, 팔로잉 가져오기.
		String pageID = FollowInfo.get("id");
		String followerNum = String.valueOf(followService.getCountFollower(pageID));
		String followingNum = String.valueOf(followService.getCountFollowing(pageID));
		
		// 팔로워 id,팔로우여부 담을 리스트 맵 생성
		List<Map<String, Object>> followlist = new ArrayList<>();
		
		int index = 0;
		
		// 리스트의 값들을 하나씩 체크.
		for (FollowVO temp : follow) {
		//System.out.println(aa.getFollower_id() + " " + aa.getFollowing_id());
		// 임시 맵
		Map<String, Object> tempMap = new HashMap<>();
		
		String target_id = "";
		if(Type == 0)
		target_id = temp.getFollower_id();
		else
		target_id = temp.getFollowing_id();
		
		// 팔로우 여부 체크하기 위해서 (내아이디, 대상 아이디) 담을 FollowVO 생성
		
		if (!FollowInfo.get("my_id").equals("")) {
		
		FollowVO vo = new FollowVO();
		vo.setFollower_id(FollowInfo.get("my_id"));
		vo.setFollowing_id(target_id);
		
		tempMap.put("my_id", FollowInfo.get("my_id"));
		
		// 팔로우 여부 확인
		String isfollowing = String.valueOf(followService.IsFollowing(vo));
		tempMap.put("isfollowed", isfollowing);
		} else {
		tempMap.put("isfollowed", "");
		}
		
		tempMap.put("target_id", target_id);
		
		
		// 멤버의 프로필 값을 가져온다.
		MemberVO memVO = memberService.getMember(target_id);
		
		tempMap.put("memVO", memVO);
		
		
		
		// 팔로워, 팔로잉 수
		if(index == 0) {
		tempMap.put("followerNum", followerNum);
		tempMap.put("followingNum", followingNum);
		}
		
		index++;
		
		followlist.add(tempMap);
		
		}
	
		return followlist;
	}
	
	//채팅 접속 *현재 테이블 드랍시키고, chatroom과 동시에 chat 테이블 넘버값, 나와 상대방 넣기 필요.
	@RequestMapping(value="{id}/multiChat", method=RequestMethod.GET)
	public String multiChat(@PathVariable String id, ChatroomVO cvo, ChatVO chvo, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		model.addAttribute("profile", memberVO);
		
		chatService.create(cvo);
		//CHAT 테이블도 CREATE 필요
		int CHATROOM_NO = cvo.getCHATROOM_NO();
		chvo.setCHAT_NO(CHATROOM_NO);
		//CHATROOM_NO와 동일한 CHAT_NO의 대화를 가져옴.
//		ChatVO resultVO = chatService.read(chvo);
		
//		model.addAttribute("resultChatVO", resultVO);
		
		return "chat/multiChat";
	}
	
	//존재하는 채팅방 접속(넘버값으로 구함) *지난 대화 내용 불러오기 필요.
	@RequestMapping(value="{id}/multiAlreadyChat", method=RequestMethod.GET)
	public String multiAreadyChat(@PathVariable String id, @RequestParam("CHATROOM_NO") int CHATROOM_NO, 
								  @ModelAttribute("ChatroomVO")ChatroomVO cvo, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("profile", memberVO);
			
		cvo.setCHATROOM_NO(CHATROOM_NO);
		ChatroomVO cvo2 = chatService.areadyRead(cvo);	
		model.addAttribute("cvo2", cvo2);
			
		return "chat/multiChat";
	}
	
	//채팅방 대화 내용 저장 후 띄움. 대화 내용 입력 시 SENDVAL -> true로 변경된다.
	@RequestMapping(value="{id}/multiChat", method=RequestMethod.POST)
	public String multiChatContent(@PathVariable String id, @RequestParam("CHATROOM_NO") int CHATROOM_NO,
								   @ModelAttribute()ChatroomVO cvo, HttpSession session, Model model)throws Exception{
		MemberVO memberVO = (MemberVO) session.getAttribute("member");			
		model.addAttribute("profile", memberVO);
		
//		chatService.chatCreate();
//		List<ChatVO>contentList = chatService.contentListAll(CHATROOM_NO);
//		model.addAttribute("contentList", contentList);
		
		return "chat/multiChat.jsp?center=chat/chatContent";
	}
}
