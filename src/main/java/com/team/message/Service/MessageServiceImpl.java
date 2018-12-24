package com.team.message.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.message.DAO.MessageDAO;
import com.team.message.VO.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Inject
	MessageDAO messageDAO;
	
	//쪽지 보내기
	@Override
	public void create(MessageVO mvo) throws Exception{
		//태그문자 처리 (< -> &lt;, > -> &gt;)
		String subject = mvo.getMESSAGE_SUBJECT();
		String content = mvo.getMESSAGE_CONTENT();
		String sender = mvo.getMESSAGE_SENDER();
		String receiver = mvo.getMESSAGE_RECEIVER();
		
		//공백문자 처리
		subject = subject.replace("<", "&lt;");
		subject = subject.replace(">", "&gt;");
		//줄바꿈 문자 처리
		content = content.replace("\n", "<br>");
		
		mvo.setMESSAGE_SUBJECT(subject);
		mvo.setMESSAGE_CONTENT(content);
	}
	
	//쪽지 상세 보기
	@Override
	public MessageVO read(int MESSAGE_NO) throws Exception{
		return messageDAO.read(MESSAGE_NO);
	}
	//쪽지 삭제
	@Override
	public void delete(int MESSAGE_NO) throws Exception{
		messageDAO.delete(MESSAGE_NO);
	}
	//쪽지 전체 목록
	@Override
	public List<MessageVO>listAll() throws Exception{
		return messageDAO.listAll();
	}
}
