package com.team.follow.Controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.follow.Service.FollowService;
import com.team.follow.VO.FollowVO;

@Controller
public class FollowController {

	@Autowired
	private FollowService followService;

	// 팔로우 버튼 눌렀을때.
	@RequestMapping(value = "/follow", method = RequestMethod.POST)
	@ResponseBody
	public int Follow(@RequestBody FollowVO vo, Model model) {
		System.out.println("follow 호출");

		int result = 0;

		if (followService.IsFollowing(vo)) {
			System.out.println("이미 팔로우 되어있음.");
			result = 0;

		} else {
			followService.InsertFollowing(vo);
			System.out.println("컨트롤러에서 팔로우 처리 완료");
			result = 1;
		}

		return result;
	}

	@RequestMapping(value = "/unfollow", method = RequestMethod.POST)
	@ResponseBody
	public int UnFollow(@RequestBody FollowVO vo, Model model) {
		System.out.println("UnFollow 호출");
		int result = 0;

		if (followService.IsFollowing(vo)) {
			followService.DeleteFollowing(vo);
			System.out.println("컨트롤러에서 언팔로우 완료");
			result = 1;
		} else {
			System.out.println("팔로우 되어있지 않음.");
			result = 0;
		}

		return result;

	}

	// 팔로우 목록 페이지 요청 처리
	@RequestMapping(value = { "{id}/follower", "{id}/following" })
	public String ShowFollowList(@PathVariable String id, Model model, HttpServletRequest request) {

		// uri 에서 id/~~~ 에서 ~~~ 값을 뽑아내는 부분
		String uri = request.getRequestURI();
		String type = "";
		Pattern pattern = Pattern.compile("(?<=" + id + "\\/)\\w+");
		Matcher data = pattern.matcher(uri);
		if (data.find()) {
			type = data.group();
		}
		/// ---------

		model.addAttribute("type", type); // 팔로우 페이지인지 팔로잉 페이지인지
		model.addAttribute("page_id", id); // 보여줄 페이지의 아이디값

		return "main.jsp?center=follow/list";

	}

	// 팔로워 목록
	@RequestMapping(value = "{id}/getFollowerList", method = RequestMethod.POST)
	@ResponseBody
	public List<FollowVO> getFollowerList(@PathVariable String id) {
		//System.out.println("getFollowerList 호출");

		// 팔로워 목록 받아오기
		List<FollowVO> follower = followService.GetAllFollower(id);

		return follower;

	}

	// 팔로잉 목록
	@RequestMapping(value = "{id}/getFollowingList", method = RequestMethod.POST)
	@ResponseBody
	public List<FollowVO> getFollowingList(@PathVariable String id) {
		//System.out.println("getFollowingList 호출");

		// 팔로잉 목록 받아오기
		List<FollowVO> following = followService.GetAllFollowing(id);

		return following;

	}

	// 팔로우 되어있는지 안되어있는지 체크 여부.
	@RequestMapping(value = "/isFollowed", method = RequestMethod.POST)
	@ResponseBody
	public int isFollowed(@RequestBody FollowVO vo, Model model) {

		int result = 0;

		followService.IsFollowing(vo);

		if (followService.IsFollowing(vo))
			result = 1;
		else
			result = 0;

		return result;

	}

	
}