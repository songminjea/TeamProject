package com.team.follow.Controller;


import java.util.ArrayList;
import java.util.List;

import javax.xml.ws.ResponseWrapper;

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

import com.team.follow.Service.FollowService;
import com.team.follow.VO.FollowVO;

@Controller
public class FollowController {

	@Autowired
	private FollowService followService;


	// 팔로우 버튼 눌렀을때.
	@RequestMapping("/follow") 
	public String Follow(@RequestBody FollowVO vo, Model model) {
		System.out.println("follow 호출");
		
		if(followService.IsFollowing(vo)) {
			System.out.println("이미 팔로우 되어있음.");
			
		} else {
			followService.InsertFollowing(vo);
		}

		
		return "followOk";
	}
	
	@RequestMapping(value= "/unfollow" , method = RequestMethod.POST)
	@ResponseBody
	public int UnFollow(@RequestBody FollowVO vo, Model model) {
		System.out.println("UnFollow 호출");
		
		if(followService.IsFollowing(vo)) {
			followService.DeleteFollowing(vo);
			return 1;
		}
		else {
			System.out.println("팔로우 되어있지 않음.");
			return 0;
		}
		
		
		
		
	}
	
	// 팔로워 목록
	@RequestMapping("{id}/follower")
	public String ShowFollowList(@PathVariable String id, Model model) {
		//System.out.println("ShowFollowList 호출");
		
		
		String url = id + "/follower";
		
		// 팔로워 목록 받아오기
		List<FollowVO> follower = followService.GetAllFollower(id);
		// 팔로우 여부 체크
		List<Boolean> isfollowing = new ArrayList<Boolean>();
		
		
		for(FollowVO vo : follower) {
			FollowVO temp = new FollowVO();
			temp.setFollower_id(vo.getFollowing_id());
			temp.setFollowing_id(vo.getFollower_id());
			isfollowing.add(followService.IsFollowing(vo));
		}
		
		model.addAttribute("type", "follower");
		model.addAttribute("page_id", id);
		model.addAttribute("follow_list", follower);
		model.addAttribute("isfollowing", isfollowing);
		model.addAttribute("center", url);
		
		
		return "main.jsp?center=follow/list";
	
	}
	
	// 팔로잉 목록
	@RequestMapping("{id}/following")
	public String ShowFollowinglist(@PathVariable String id, Model model) {
		//System.out.println("ShowFollowinglist 호출");
	
		String url = "follow/followlist.jsp";
		
		List<FollowVO> following = followService.GetAllFollowing(id);
		List<Boolean> isfollowing = new ArrayList<Boolean>();
		
		
		for(FollowVO vo : following) {
			isfollowing.add(followService.IsFollowing(vo));
		}
				
		
		model.addAttribute("type", "following");
		model.addAttribute("page_id", id);
		model.addAttribute("follow_list", following);
		model.addAttribute("isfollowing", isfollowing);
		model.addAttribute("center", url);
		
		
		return "main.jsp?center=follow/list";
	
	}
	
	
}