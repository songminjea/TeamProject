package com.team.member.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.team.follow.Service.FollowService;
import com.team.follow.VO.FollowVO;
import com.team.member.Service.MemberServiceImpl;
import com.team.member.VO.MemberVO;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	FollowService followService;
	
	@RequestMapping("/check")
	public String check() {
		return "member/check";
	}
		
	@RequestMapping("/signUp")
	public String insertMember(Model model) {
		model.addAttribute("member", new MemberVO());
		return "member/signUp";
	}
	

	@RequestMapping("/insertOk")
	//@Valid(벨리드:미리체크 하겠다는 뜻)어노테이션기호를 사용하여 
	//작성한 회원 내용정보가 있는 MybatisMember(DTO)객체의 유효성 체크를 한다.
	//BindingResult result로 유효성체크의 결과정보를 전달 받는다.
	public String insertOk(@Valid MemberVO member, BindingResult result, Map<String, BindingResult> model) {
		
		model.put(BindingResult.class.getName()+".member", result);
		if(result.hasErrors()) { //에러가 있으면
			System.out.println(result.toString());
			System.out.println("회원가입시 오류가 발생했습니다.");		
			return "member/signUp";
		}else {
			//에러가 없으면 DB에 작성한 내용 insert
			memberService.InsertMember(member);
			return "login";
		}
	}
	
	@RequestMapping("{ID}/mypage")
	public String mypageMember(@PathVariable String ID,Model model) {
		
		model.addAttribute("member",memberService.getMember(ID));
		
		return "member/mypage";
	}
	
	@RequestMapping("/mypageOk")
	public String mypageOk(@Valid MemberVO member,BindingResult result, Map<String, BindingResult> model) {
		
		model.put(BindingResult.class.getName()+".member", result);
		if(result.hasErrors()) {
			System.out.println(result.toString());
			System.out.println("회원정보 수정시 오류가 발생");
			return "member/mypage";
		}else {
			memberService.updateMember(member);
			return "login";
		}
	}
	
	
	
	
	@RequestMapping("/search")
	public String MemberSearch(@RequestParam String keyword, HttpSession session ,Model model) {
		//System.out.println(keyword);

		
		// 검색값 얻어오기
		List<MemberVO> member = memberService.GetSearchMember(keyword);
		
		// 로그인 여부 체크하기 위해 세션값 받아옴.
		MemberVO memVO = (MemberVO)session.getAttribute("member");
		
		// 팔로우 여부를 맵으로 저장. <아이디, 팔로우여부>
		Map<String, Boolean> isFollowedList = new HashMap<>();
		
		// 세션 member가 존재할때. = 로그인 되어있을때만.
		if(memVO != null) {
			
			for(MemberVO temp : member) {
				if(memVO.getID().equals(temp.getID()))
					continue;
					
				FollowVO fVo = new FollowVO();
				fVo.setFollower_id(memVO.getID());
				fVo.setFollowing_id(temp.getID());
				
				// 팔로우 여부 체크
				boolean isFollowed = followService.IsFollowing(fVo);
				
				
				isFollowedList.put(temp.getID(), isFollowed);
			}
		}
		
		//System.out.println(isFollowedList.get("aaaa"));
		model.addAttribute("isfollowed", isFollowedList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("search_Mem", member);
		
		return "main.jsp?center=member/search";
	}
	
	
	
}
