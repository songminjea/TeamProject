package com.team.chat.DAO;

import java.util.List;
import java.util.Map;

import com.team.chat.VO.ChatVO;
import com.team.member.VO.MemberVO;

public interface ChatDAO {
	
	//채팅 아이디 검색 목록
	public List<MemberVO>listAll(Map<String, String> searchInfo);
	
	//채팅 보낸 메시지
	public void sendMessage(ChatVO cvo) throws Exception;
	
	//채팅 아이디 자신인지 체크
	public int chatIdCheck(String CHAT_SENDER) throws Exception;
	
	public ChatVO sendRead(ChatVO cvo)throws Exception;
}
