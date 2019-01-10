package com.team.chat.Service;

import java.util.List;
import java.util.Map;

import com.team.chat.VO.ChatVO;
import com.team.member.VO.MemberVO;

public interface ChatService {
	
	//채팅 아이디 검색 목록
	public List<MemberVO>listAll(Map<String, String> searchInfo);
	
	//채팅 보내기
	public void chatSend(ChatVO cvo) throws Exception;

	//채팅 내용 불러오기
	public ChatVO sendRead(ChatVO cvo)throws Exception;
}
