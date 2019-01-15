package com.team.chat.DAO;

import java.util.List;

import com.team.chat.VO.ChatVO;
import com.team.chat.VO.ChatroomVO;

public interface ChatDAO {
	
	//채팅 아이디 검색 목록
	public List<ChatroomVO>listAll(String my_id);
	
	//채팅방 생성
	public void create(ChatroomVO cvo)throws Exception;
	
	//채팅 내용
	public ChatVO read(ChatroomVO cvo)throws Exception;
	
	//이미 있는 채팅방 입장
	public ChatroomVO areadyRead(ChatroomVO cvo2)throws Exception;
}
