package com.team.chat.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.chat.DAO.ChatDAO;
import com.team.chat.VO.ChatroomVO;
import com.team.member.VO.MemberVO;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	ChatDAO chatDao;
	
	//채팅 아이디 검색 목록
	@Override
	public List<ChatroomVO>listAll(MemberVO mvo){
		String my_id = mvo.getID();
		return chatDao.listAll(my_id);
	}
	
	//채팅방 생성
	@Override
	public void create(ChatroomVO cvo)throws Exception{
		String CHATROOM_SENDER = cvo.getCHATROOM_SENDER();
		String CHATROOM_RECEIVER = cvo.getCHATROOM_RECEIVER();
		
		CHATROOM_SENDER = CHATROOM_SENDER.replace("<", "&lt;");
		CHATROOM_SENDER = CHATROOM_SENDER.replace(">", "&gt;");
		CHATROOM_RECEIVER = CHATROOM_RECEIVER.replace("<", "&lt;");
		CHATROOM_RECEIVER = CHATROOM_RECEIVER.replace(">", "&gt;");
		
		CHATROOM_SENDER = CHATROOM_SENDER.replace(" ", "&nbsp;&nbsp;");
		CHATROOM_RECEIVER = CHATROOM_RECEIVER.replace(" ", "&nbsp;&nbsp;");
		
		cvo.setCHATROOM_SENDER(CHATROOM_SENDER);
		cvo.setCHATROOM_RECEIVER(CHATROOM_RECEIVER);
		
		chatDao.create(cvo);
	}

	//채팅 내용
	@Override
	public ChatroomVO read(ChatroomVO cvo)throws Exception{
		ChatroomVO cvo2 = chatDao.read(cvo);
		return cvo2;
	}
	
	//채팅 개수
	@Override
	public int countList(MemberVO memberVO)throws Exception{
		String chat_id = memberVO.getID();
		return chatDao.countList(chat_id);
	}

}
