package com.team.chat.Service;

import java.util.List;

import com.team.chat.VO.ChatroomVO;
import com.team.member.VO.MemberVO;

public interface ChatService {
	
	//채팅 리스트
	public List<ChatroomVO> listAll(MemberVO mvo);
	
	//채팅방 생성
	public void create(ChatroomVO cvo)throws Exception;

	
	//채팅 내용
	public ChatroomVO read(ChatroomVO cvo)throws Exception;

	//채팅 개수
	public int countList(MemberVO memberVO)throws Exception;
}
