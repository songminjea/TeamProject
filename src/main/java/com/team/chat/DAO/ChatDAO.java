package com.team.chat.DAO;

import java.util.List;

import com.team.chat.VO.ChatroomVO;

public interface ChatDAO {
	
	//채팅 아이디 검색 목록
	public List<ChatroomVO>listAll(String my_id);
	
	//채팅방 생성
	public void create(ChatroomVO cvo)throws Exception;

	//채팅 내용
	public ChatroomVO read(ChatroomVO cvo2)throws Exception;
	
	//채팅방 개수
	public int countList(String chat_id)throws Exception;
}
