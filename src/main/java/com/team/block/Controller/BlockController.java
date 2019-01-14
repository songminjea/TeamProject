package com.team.block.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.block.Service.BlockService;
import com.team.block.VO.BlockVO;
import com.team.follow.Service.FollowService;
import com.team.follow.VO.FollowVO;
import com.team.member.Service.MemberServiceImpl;
import com.team.member.VO.MemberVO;

@Controller
public class BlockController {

	@Autowired
	private BlockService blockService;
	
	@Autowired
	private FollowService followService;

	@Autowired
	private MemberServiceImpl memberService;
	
	// 차단 버튼 눌렀을때.
	@RequestMapping("/block") 
	@ResponseBody
	public int Block(@RequestBody BlockVO vo, Model model) {
		System.out.println("block 호출");
		//System.out.println(vo.getBlocker_id() + " " + vo.getBlocking_id());
		
		int result = 0;
		if(blockService.IsBlocking(vo)) {
			System.out.println("이미 차단 되어있음.");
			result = 0;
			
		} else {
			FollowVO fvo = new FollowVO();
			fvo.setFollower_id(vo.getBlocker_id());
			fvo.setFollowing_id(vo.getBlocking_id());
			followService.DeleteFollowing(fvo);
			fvo.setFollower_id(vo.getBlocking_id());
			fvo.setFollowing_id(vo.getBlocker_id());
			followService.DeleteFollowing(fvo);
			blockService.InsertBlocking(vo);
			result = 1;
		}

		
		return result;
	}
	
	// 차단 해제 눌렀을때.
	@RequestMapping("/unblock")
	@ResponseBody
	public int UnBlock(@RequestBody BlockVO vo, Model model) {
		System.out.println("unblock 호출");
		
		int result = 0;
		
		if(blockService.IsBlocking(vo)) {
			blockService.DeleteBlocking(vo);
			result = 1;
		}
		else {
			System.out.println("팔로우 되어있지 않음.");
			result = 0;
		}
		
		
		return result;
		
	}
	
	
	// 팔로우 목록 페이지 요청 처리
	@RequestMapping(value = "{id}/blocking")
	public String ShowBlockingList(@PathVariable String id, Model model, HttpServletRequest request) {

		// id에 해당하는 프로필을 가져온다.
		// MemberInterceptor에서 처리 한 후 가져오는것.
		MemberVO memberVo = (MemberVO) request.getAttribute("vo");
		
		
		if(memberVo == null || !memberVo.getID().equals(id)) {			
			return "redirect:/main";
		}
		
		model.addAttribute("profile", memberVo);
		model.addAttribute("type", "blocking"); // 팔로우 페이지인지 팔로잉 페이지인지
		model.addAttribute("page_id", id); // 보여줄 페이지의 아이디값

		return "main.jsp?center=follow/list";

	}
	
	
	// 팔로잉 목록
	@RequestMapping(value = "/getBlockingList", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> getBlockingList(@RequestBody Map<String, String> BlockInfo) {

		// map(my_id로그인 아이디, pageNum페이지 번호),
		// Type = 0일때 follower 목록 / 1일때 following 목록

		// 페이지 번호에 10 곱해서 저장. (0, 10, 20 단위 글 보려고)
		int pageNum = Integer.parseInt(BlockInfo.get("pageNum")) * 10;
		BlockInfo.put("pageNum", String.valueOf(pageNum));

		// 차단 목록 담을 리스트
		List<BlockVO> blocking = blockService.GetAllBlocking(BlockInfo);


		// 팔로워, 팔로잉, 차단 수 가져오기.
		String pageID = BlockInfo.get("id");
		String followerNum = String.valueOf(followService.getCountFollower(pageID));
		String followingNum = String.valueOf(followService.getCountFollowing(pageID));
		String blockingNum = String.valueOf(blockService.getCountBlocking(pageID));

		// 팔로워 id,팔로우여부 담을 리스트 맵 생성
		List<Map<String, Object>> blocklist = new ArrayList<>();

		int index = 0;

		// 리스트의 값들을 하나씩 체크.
		for (BlockVO temp : blocking) {
			//System.out.println(aa.getFollower_id() + " " + aa.getFollowing_id());
			// 임시 맵
			Map<String, Object> tempMap = new HashMap<>();

			String target_id = temp.getBlocking_id();
			

			tempMap.put("target_id", target_id);

			// 멤버의 프로필 값을 가져온다.
			MemberVO memVO = memberService.getMember(target_id);

			tempMap.put("memVO", memVO);

			// 팔로워, 팔로잉 수
			if (index == 0) {
				tempMap.put("followerNum", followerNum);
				tempMap.put("followingNum", followingNum);
				tempMap.put("blockingNum", blockingNum);
			}

			index++;

			blocklist.add(tempMap);

		}

		return blocklist;

	}
}
