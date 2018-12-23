package com.team.follow.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.follow.Service.FollowService;
import com.team.follow.VO.FollowVO;

@Controller
public class FollowController {

	@Autowired
	private FollowService followService;


	/*@RequestMapping("/followTest")
	public String followTest(Model model, HttpSession session) {
		//System.out.println( session.getAttribute("id"));
		String url = "follow/followlist.jsp";
		model.addAttribute("center", url);
		
		return "main";
	}*/
	
	// 팔로우 버튼 눌렀을때.
	@RequestMapping("/follow") 
	public String Follow(@ModelAttribute FollowVO vo, Model model) {
		
		
		if(followService.IsFollowing(vo)) {
			System.out.println("이미 팔로우 되어있음.");
			
		} else {
			followService.InsertFollowing(vo);
		}

		
		return "followOk";
	}
	
	
	@RequestMapping("/unfollow")
	public String UnFollow(@ModelAttribute FollowVO vo, Model model) {
		
		if(followService.IsFollowing(vo)) {
			followService.DeleteFollowing(vo);
		}
		else {
			System.out.println("팔로우 되어있지 않음.");
		}
		
		
		return "unfollowOk";
		
	}
	
	
	@RequestMapping("**/follower")
	public String ShowFollowList(@RequestParam String id, Model model) {
		
	
		String url = "follow/list.jsp";
		
		//List<FollowVO> follower = followService.GetAllFollower(id);
		String follower = "testFollower";
		

		model.addAttribute("follower", follower);
		model.addAttribute("center", url);
		
		
		return "main";
	
	}
	
	@RequestMapping("/following")
	public String ShowFollowinglist(@RequestParam String id, Model model) {
		
	
		String url = "follow/followlist.jsp";
		
		//List<FollowVO> following = followService.GetAllfollowing(id);
		String following = "testFollower";

		model.addAttribute("following", following);
		model.addAttribute("center", url);
		
		
		return "main";
	
	}
	
	
}