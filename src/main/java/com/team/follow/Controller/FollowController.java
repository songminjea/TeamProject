package com.team.follow.Controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.follow.Service.FollowService;
import com.team.follow.VO.FollowVO;

@Controller
public class FollowController {

	@Autowired
	private FollowService followService;


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
	
	
	@RequestMapping("**/follower/{id}")
	public String ShowFollowList(@PathVariable String id, Model model) {
		
		
		
		String url = "follow/list.jsp";
		
		List<FollowVO> follower = followService.GetAllFollower(id);
		
		model.addAttribute("type", "follower");
		model.addAttribute("follow_list", follower);
		model.addAttribute("center", url);
		
		
		return "main";
	
	}
	
	@RequestMapping("**/following/{id}")
	public String ShowFollowinglist(@PathVariable String id, Model model) {
		
	
		String url = "follow/followlist.jsp";
		
		List<FollowVO> following = followService.GetAllFollowing(id);
		
		model.addAttribute("type", "following");
		model.addAttribute("follow_list", following);
		model.addAttribute("center", url);
		
		
		return "main";
	
	}
	
	
}