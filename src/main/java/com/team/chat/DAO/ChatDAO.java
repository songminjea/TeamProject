package com.team.chat.DAO;

import java.util.List;
import java.util.Map;

import com.team.chat.VO.ChatVO;
import com.team.member.VO.MemberVO;

public interface ChatDAO {
	
	//채팅 아이디 검색 목록
	public List<MemberVO>listAll(Map<String, String> searchInfo);
	
	public void sendMessage(ChatVO cvo) throws Exception;
	
	public ChatVO sendRead(ChatVO cvo)throws Exception;
}
