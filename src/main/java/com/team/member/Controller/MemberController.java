package com.team.member.Controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.member.Service.MemberServiceImpl;
import com.team.member.VO.MemberVO;

@Controller
//@SessionAttributes("member")
public class MemberController {

	@Autowired
	MemberServiceImpl memberService;
	
	@RequestMapping("/signUp")
	public String insertMember(Model model) {
		model.addAttribute("member", new MemberVO());
		
		
		return "member/signUp";
	}
	
	@RequestMapping("/insertOk")
	//@Valid(벨리드:미리체크 하겠다는 뜻)어노테이션기호를 사용하여 
	//작성한 회원 내용정보가 있는 MybatisMember(DTO)객체의 유효성 체크를 한다.
	//BindingResult result로 유효성체크의 결과정보를 전달 받는다.
	public String insertOk(@Valid MemberVO member, BindingResult result) {
		
		if(result.hasErrors()) { //에러가 있으면
			System.out.println("회원가입시 오류가 발생했습니다.");		
			return "member/signUp";
		}else {
			//에러가 없으면 DB에 작성한 내용 insert
			memberService.InsertMember(member);
			return "member/joinOk";
		}
	}
}
