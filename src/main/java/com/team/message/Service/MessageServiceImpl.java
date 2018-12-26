package com.team.message.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.message.DAO.MessageDAO;
import com.team.message.VO.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	@Inject
	MessageDAO messageDao;
	
	//쪽지 작성
	@Override
	public void create(MessageVO mvo) throws Exception{
		messageDao.create(mvo);
	}
	//쪽지 내용 상세 보기
	@Override
	public MessageVO read(int MESSAGE_NO) throws Exception{
		return messageDao.read(MESSAGE_NO);
	}
	//쪽지 삭제
	@Override
	public void delete(int MESSAGE_NO) throws Exception{
		messageDao.delete(MESSAGE_NO);
	}
	//쪽지 전체 목록
	@Override
	public List<MessageVO>listAll() throws Exception{
		return messageDao.listAll();
	}
}
